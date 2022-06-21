package Servlets;

import Beans.VirusBean;
import Daos.SupervivienteDao;
import Daos.VirusDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "VirusServlet", value = "/VirusServlet")
public class VirusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        VirusDao virusDao = new VirusDao();
        switch (action){
            case "listar":
                ArrayList<VirusBean> virus = virusDao.listarVirus();
                request.setAttribute("listaVirus",virus);
                int virus_activo = 0;
                for (VirusBean a : virus){
                    virus_activo = virus_activo + a.getCaso();
                }
                request.setAttribute("Virus_activos",virus_activo);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Superviviente.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar":
                RequestDispatcher crear = request.getRequestDispatcher("Agregar_super.jsp");
                crear.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
