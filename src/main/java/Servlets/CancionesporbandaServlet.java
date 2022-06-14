package Servlets;


import Beans.Canciones;
import Daos.CancionesDao;
import Daos.CancionesporbandaDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CancionesporbandaServlet",urlPatterns = {"/listaCancionesporbanda"})
public class CancionesporbandaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        CancionesporbandaDao cancionesporbandaDao = new CancionesporbandaDao();
        switch (action) {
            case "cancionporbanda" -> {
                String id= request.getParameter("id");;
                request.setAttribute("listaCanciones", cancionesporbandaDao.mostrarbanda(id));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("listacancionesporbanda.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
}