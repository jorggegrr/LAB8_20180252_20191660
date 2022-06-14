package Servlets;

import Daos.CancionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancionServlet", value = {"/CancionServlet", "/listaRecomendados"})
public class CancionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CancionDao cancionDao = new CancionDao();

        request.setAttribute("listaRecomendados", cancionDao.listarCanciones_recomen());

        RequestDispatcher view =request.getRequestDispatcher("listaRecomendados.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
