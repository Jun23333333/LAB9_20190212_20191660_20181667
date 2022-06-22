package Servlets;

import Beans.HumanoBean;
import Daos.HumanoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HumanoServlet", value = "")
public class HumanoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HumanoDao humanoDao = new HumanoDao();
        RequestDispatcher view;
        switch (action){
            case "listar":
                ArrayList<HumanoBean> lista = humanoDao.listarHumano();
                request.setAttribute("listaHumano",lista);
                view = request.getRequestDispatcher("Humano.jsp");

                view.forward(request,response);
                break;
        }
    }


}
