package Servlets;

import Daos.VirusDao;
import Daos.ZombiesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ZombieServlet", value = "/ZombieServlet")
public class ZombieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ZombiesDao zombiesDao = new ZombiesDao();
        switch (action){
            case "listar":
                try{
                    request.setAttribute("listaZombie",zombiesDao.listarZombie());
                    request.setAttribute("varianteMasComun",zombiesDao.varianteMasComun());
                    request.setAttribute("zombieH",zombiesDao.zombiePorSexo("masculino"));
                    request.setAttribute("zombieM",zombiesDao.zombiePorSexo("femenino"));
                    request.setAttribute("promedio1",zombiesDao.promedioVictimasporZombie("demoledor"));
                    request.setAttribute("promedio2",zombiesDao.promedioVictimasporZombie("rapido"));
                    request.setAttribute("promedio3",zombiesDao.promedioVictimasporZombie("nino"));
                    request.setAttribute("promedio4",zombiesDao.promedioVictimasporZombie("normal"));
                    request.setAttribute("promedio5",zombiesDao.promedioVictimasporZombie("otro"));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Zombies.jsp");
                    requestDispatcher.forward(request,response);
                }catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");

                }
                response.sendRedirect(request.getContextPath() + "/ZombieServlet");
                break;
            case "agregarL":
                try{
                    request.setAttribute("listaVariante", zombiesDao.listarVariante());
                    request.setAttribute("listaTipo",zombiesDao.listarTipoZombie());
                    request.setAttribute("listasexo",zombiesDao.listarSexo());
                    RequestDispatcher chiclim = request.getRequestDispatcher("Agregar_virus.jsp");
                    chiclim.forward(request,response);
                }catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");

                }
                response.sendRedirect(request.getContextPath() + "/ZombieServlet");
                break;
            case "agregarT":
                try {
                    String idStr = request.getParameter("id");
                    if (idStr != null){
                        request.setAttribute("idZombie", idStr);
                        RequestDispatcher crear = request.getRequestDispatcher("Calcular_tiempo.jsp");
                        crear.forward(request, response);}
                }catch (NullPointerException e){
                    System.out.println("Error al convertir tipo de dato");

                }
                response.sendRedirect(request.getContextPath() + "/ZombieServlet");
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ZombiesDao zombiesDao = new ZombiesDao();
        switch (action){

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

                }
                response.sendRedirect(request.getContextPath() + "/ZombieServlet");
                break;

            case "crear":
                try{
                    String tipo = request.getParameter("tipo");
                    String variante = request.getParameter("variante");
                    String tiempoStr = request.getParameter("tiempo");
                    String sexo = request.getParameter("sexo");
                    int idV = Integer.parseInt(variante);
                    int tiempo = Integer.parseInt(tiempoStr);
                    zombiesDao.agregarZombie(zombiesDao.createAlphaNumericArrayStrings(11,1), tiempo, idV, tipo,  sexo);
                }catch (NullPointerException f){
                    System.out.println("El virus ya existe con ese nombre!");
                    f.printStackTrace();

                }
                response.sendRedirect(request.getContextPath()+"/ZombieServlet");
                break;

        }
    }


}
