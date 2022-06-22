package Servlets;

import Beans.ObjetoBean;
import Daos.ObjetosDao;
import Daos.SupervivienteDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ObjetoServlet", value = "/ObjetoServlet")
public class ObjetoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ObjetosDao objetosDao = new ObjetosDao();
        switch (action){
            case "listar":
                request.setAttribute("listaObjeto",objetosDao.listar());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Objeto.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar_vacuna":
                RequestDispatcher crear_vacuna = request.getRequestDispatcher("Agregar_Vacuna.jsp");
                crear_vacuna.forward(request, response);
                break;
            case "agregar_objeto":
                RequestDispatcher crear_objeto = request.getRequestDispatcher("Agregar_Objeto.jsp");
                crear_objeto.forward(request, response);
                break;
            case "editar":
                String nombre = request.getParameter("id");
                ObjetoBean objetoBean = objetosDao.buscarPorNombre(nombre);
                String tipo = request.getParameter("tipo");
                if (tipo == "Vacuna"){
                    request.setAttribute("vacuna",objetoBean);
                    RequestDispatcher editar_vacuna = request.getRequestDispatcher("Editar_Vacuna.jsp");
                    editar_vacuna.forward(request, response);
                    break;
                }
                else{
                    request.setAttribute("objeto",objetoBean);
                    RequestDispatcher editar_objeto = request.getRequestDispatcher("Editar_Objeto.jsp");
                    editar_objeto.forward(request, response);
                    break;
                }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ObjetosDao objetosDao = new ObjetosDao();

        switch (action){
            case "crear_vacuna":
                String nombre = request.getParameter("nombre");
                double peso = Double.parseDouble(request.getParameter("Peso"));
                double demo = Double.parseDouble(request.getParameter("demo"));
                double rapi = Double.parseDouble(request.getParameter("rapi"));
                double nino = Double.parseDouble(request.getParameter("nino"));
                double normal = Double.parseDouble(request.getParameter("normal"));
                double otro = Double.parseDouble(request.getParameter("otro"));

                objetosDao.crear_vacuna(nombre,peso,demo,rapi,nino,normal,otro);
                response.sendRedirect(request.getContextPath()+"/ObjetoServlet");
                break;
            case "crear_objeto":
                String nombre1 = request.getParameter("nombre");
                double peso1 = Double.parseDouble(request.getParameter("peso"));

                objetosDao.crear_objeto(nombre1,peso1);
                response.sendRedirect(request.getContextPath()+"/ObjetoServlet");
                break;
            case "editar_vacuna":
                String nombre2 = request.getParameter("nombre");
                double peso2 = Double.parseDouble(request.getParameter("Peso"));
                double demo2 = Double.parseDouble(request.getParameter("demo"));
                double rapi2 = Double.parseDouble(request.getParameter("rapi"));
                double nino2 = Double.parseDouble(request.getParameter("nino"));
                double normal2 = Double.parseDouble(request.getParameter("normal"));
                double otro2 = Double.parseDouble(request.getParameter("otro"));

                objetosDao.editar_vacuna(nombre2,peso2,demo2,rapi2,nino2,normal2,otro2);
                response.sendRedirect(request.getContextPath()+"/ObjetoServlet");
                break;
            case "editar_objeto":
                String nombre3 = request.getParameter("nombre");
                double peso3 = Double.parseDouble(request.getParameter("peso"));

                objetosDao.editar_objeto(nombre3,peso3);
                response.sendRedirect(request.getContextPath()+"/ObjetoServlet");
                break;
        }
    }
}
