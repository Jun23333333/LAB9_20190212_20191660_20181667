<%@ page import="Beans.HumanoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaHumano" scope="request" type="java.util.ArrayList<Beans.HumanoBean>" />
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <span class="fs-4">Lab9</span>
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Humanos</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/SupervivienteServlet" class="nav-link" >Supervivientes</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/VirusServlet" class="nav-link">Virus</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/ZombieServlet" class="nav-link">Zombies</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/ObjetoServlet" class="nav-link">Objetos</a></li>
                    <li class="nav-item"><a href="<%=request.getContextPath()%>/CaceriaServlet" class="nav-link">Cacería</a></li>
                </ul>
            </header>
        </div>
        <div class="b-example-divider"></div>
        <div class="table-responsive" >
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th></th><th></th><th></th><th></th><th></th>
                        <th scope="col">Numero de Identificacion</th>
                        <th scope="col">Nombre y Apellido</th>
                        <th scope="col">Sexo</th>
                        <th scope="col">Estado</th>
                        <th></th><th></th><th></th><th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (HumanoBean humano : listaHumano ) {%>
                        <tr>
                            <th></th><th></th><th></th><th></th><th></th>
                            <td><%=humano.getNumero_identi()%></td>
                            <td><%=humano.getNombre()%> <%=humano.getApellido()%></td>
                            <td><%=humano.getSexo()%></td>
                            <td><%= humano.getEstado() == null ? "Sin estado" : humano.getEstado()%></td>
                            <th></th><th></th><th></th><th></th>
                        </tr>
                        <%
                        } %>
                </tbody>
            </table>
            <center><a href="<%=request.getContextPath()%>/ZombieServlet">
                <button type="button" class="btn btn-Warning">Ver lista de Zombies</button>
            </a>
            <a href="<%=request.getContextPath()%>/SupervivienteServlet">
                <button type="button" class="btn btn-Info">Ver lista de Supervivientes</button>
            </a></center>
        </div>




        <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
