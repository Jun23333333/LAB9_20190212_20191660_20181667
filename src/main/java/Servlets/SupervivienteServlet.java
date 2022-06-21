package Servlets;

import Beans.SupervivienteBean;
import Daos.SupervivienteDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SupervivienteServlet", value = "/SupervivienteServlet")
public class SupervivienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        SupervivienteDao supervivienteDao = new SupervivienteDao();
        int idOperador = 0;
        switch (action){
            case "listar":
                request.setAttribute("listaOperadores",supervivienteDao.listar());
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        SupervivienteDao supervivienteDao = new SupervivienteDao();

        switch (action){
            case "crear":
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String sexo = request.getParameter("sexo");
                String estado = request.getParameter("estado");
                int numero = Integer.parseInt(request.getParameter("NI"));
                double peso = Double.parseDouble(request.getParameter("peso"));
                double fuerza = Double.parseDouble(request.getParameter("fuerza"));
                String num_pareja = request.getParameter("pareja");
                int id_pareja = 0;
                if(num_pareja != "alone"){
                    id_pareja = Integer.parseInt(num_pareja);
                }
                //(idHumano,nombre,apellido,estado,sexo,peso,fuerza,pareja)
                supervivienteDao.crear(numero,nombre, apellido,estado,sexo, peso, fuerza, id_pareja);
                response.sendRedirect(request.getContextPath()+"/Superviviente.jsp");
                break;
        }
    }

}

