package Servlets;

import Beans.Canciones;
import Daos.CancionesDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CancionesServlet",urlPatterns = {"/listaCanciones"})
public class CancionesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CancionesDao cancionesDao = new CancionesDao();

        switch (action) {
            case "listar" -> {
                ArrayList<Canciones> listaCanciones = cancionesDao.obtenerListaCanciones();

                request.setAttribute("listaCanciones",listaCanciones);

                RequestDispatcher view =request.getRequestDispatcher("listaCanciones.jsp");
                view.forward(request,response);
            }
            case "favorito" -> {
                String id = request.getParameter("id");
                String estado = request.getParameter("estado");
                cancionesDao.añadirFavorito(id, estado);
                response.sendRedirect(request.getContextPath() + "/listaCanciones");
            }
        }

    }
}
