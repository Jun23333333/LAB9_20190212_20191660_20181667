package Servlets;

import Daos.HumanoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HumanoServlet", value = "/HumanoServlet")
public class HumanoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HumanoDao humanoDao = new HumanoDao();
        switch (action){
            case "listar":
                request.setAttribute("listaHumano",humanoDao.listaHumano());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Humano.jsp");
                requestDispatcher.forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
