package Servlets;

import Daos.SupervivienteDao;
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
        VirusDao virusDao = new VirusDao();
        switch (action){
            case "listar":
                try{
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

            case "eliminar":
                try{
                    int idVariante = Integer.parseInt(request.getParameter("idVariante"));
                    int idVirus = Integer.parseInt(request.getParameter("idVirus"));
                    virusDao.eliminarZombie(idVariante,idVirus);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/VirusServlet");
                }
                response.sendRedirect(request.getContextPath() + "/VirusServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        VirusDao virusDao = new VirusDao();

        switch (action){
            case "crear":
                try{
                    String virus = request.getParameter("virus");
                    String variante = request.getParameter("variante");
                    virusDao.anadirNuevaVariante(virus,variante);
                }catch (NullPointerException f){
                    System.out.println("El virus ya existe con ese nombre!");
                    f.printStackTrace();
                }

                response.sendRedirect(request.getContextPath()+"/VirusServlet");
                break;
        }

    }
}
