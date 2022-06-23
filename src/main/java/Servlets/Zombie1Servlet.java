package Servlets;

import Daos.ZombiesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Zombie1Servlet", value = "/Zombie1Servlet")
public class Zombie1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ZombiesDao zombiesDao = new ZombiesDao();
        String idStr = request.getParameter("id");
        switch (action){
            case "listar":
                try{
                    request.setAttribute("listaZombie",zombiesDao.listarZombie());
                    request.setAttribute("tipoZombie",zombiesDao.listarTipoZombie());
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Zombies.jsp");
                    requestDispatcher.forward(request,response);
                }catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/Zombie1Servlet");
                }
                break;
            case "agregar1":
                break;
            case "agregar2":
                try {

                    if (idStr != null){
                        request.setAttribute("idZombie", idStr);
                        RequestDispatcher crear = request.getRequestDispatcher("Calcular_tiempo.jsp");
                        crear.forward(request, response);}
                }catch (NullPointerException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/Zombie1Servlet");
                }

                break;
            case "eliminar":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ZombiesDao zombiesDao = new ZombiesDao();
        switch (action){
            case "crear":

                break;
            case "calcular":
                try {
                    String fechaStr = request.getParameter("fecha");
                    String idStr = request.getParameter("id");
                    String[] fechaHora = fechaStr.split("T");
                    String fecha1 = fechaHora[0];
                    String horaConFormato = fechaHora[1]+":00";
                    String fechaConFormato = fecha1 + " " +horaConFormato;
                    zombiesDao.calcularTiempoInfectado(idStr,fechaConFormato);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/Zombie1Servlet");
                }

                break;
        }
    }
}
