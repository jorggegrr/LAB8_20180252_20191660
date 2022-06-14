package Servlets;

import Daos.CancionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancionServlet", value = "/CancionServlet")
public class CancionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        CancionDao cancionDao = new CancionDao();

        switch (action) {
            case "listar" -> {
                request.setAttribute("listaCanciones", cancionDao.listarCanciones_recomen());

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("listaRecomendados.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
