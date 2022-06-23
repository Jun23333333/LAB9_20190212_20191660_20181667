package Servlets;

import Beans.SupervivienteBean;
import Daos.SupervivienteDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "SupervivienteServlet", value = "/SupervivienteServlet")
public class SupervivienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        SupervivienteDao supervivienteDao = new SupervivienteDao();
        switch (action){
            case "listar":
                request.setAttribute("listaSuperviviente",supervivienteDao.listar());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Superviviente.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar":
                requestDispatcher = request.getRequestDispatcher("NuevoSuperviviente.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "borrar":
                if (request.getParameter("id") != null) {
                    String superIdString = request.getParameter("id");
                    String numero_identi = null;
                    try {
                        numero_identi= superIdString;
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("SupervivienteServlet");
                    }

                    SupervivienteBean sup = supervivienteDao.obtenerSuperviviente(numero_identi);

                    if (sup != null) {
                        supervivienteDao.borrarSuperviviente(numero_identi);
                    }
                }

                response.sendRedirect("SupervivienteServlet");
                break;
            case "editar":
                String superIdString = request.getParameter("id");
                //supervivienteDao.obtenerSuperviviente(superIdString);
                request.setAttribute("listaSuperviviente",supervivienteDao.listar());
                request.setAttribute("superviviente",supervivienteDao.obtenerSuperviviente(superIdString));
                requestDispatcher = request.getRequestDispatcher("EditarSuperviviente.jsp");

                requestDispatcher.forward(request,response);
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
                double peso = Double.parseDouble(request.getParameter("peso"));
                double fuerza = Double.parseDouble(request.getParameter("fuerza"));
                supervivienteDao.crear(nombre, apellido,sexo, peso, fuerza);
                response.sendRedirect(request.getContextPath()+"/SupervivienteServlet");
                break;
            case "actualizar":
                SupervivienteBean superviviente = new SupervivienteBean();
                superviviente.setNombre(request.getParameter("nombre"));

                superviviente.setPeso(Double.parseDouble(request.getParameter("peso")));

                superviviente.setFuerza(Double.parseDouble(request.getParameter("fuerza")));

                superviviente.setIdPareja(request.getParameter("pareja"));

                superviviente.setNumero_identi(request.getParameter("numeroid"));
                supervivienteDao.actualizarSuperviviente(superviviente);
                response.sendRedirect("SupervivienteServlet?action=listar");

                break;
        }
    }

}

