package Servlets;

import Daos.VirusDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VirusServlet", value = "/VirusServlet")
public class VirusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        String idVirusStr =  request.getParameter("idVirus")== null ? "2" : request.getParameter("idVirus");
        VirusDao virusDao = new VirusDao();
        switch (action){
            case "listar":
                try{
                    int idVirus = Integer.parseInt(idVirusStr);
                    request.setAttribute("listaVirus",virusDao.listarVirus());
                    request.setAttribute("casos",virusDao.casosEncontrados());
                    request.setAttribute("activos",virusDao.virusActivos());
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Virus.jsp");
                    requestDispatcher.forward(request,response);
                }catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/VirusServlet");
                }
                break;
            case "agregar":
                RequestDispatcher crear = request.getRequestDispatcher("Agregar_virus.jsp");
                crear.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
