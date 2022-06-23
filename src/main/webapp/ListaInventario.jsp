<%@ page import="Beans.HumanoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.ObjetoBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaobjeto" scope="request" type="java.util.ArrayList<Beans.ObjetoBean>" />
<jsp:useBean id="idhumano" scope="request" type="java.lang.String" />
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
            <th scope="col">Nombre </th>
            <th scope="col">Masa</th>
            <th scope="col">Tipo</th>
            <th scope="col">Cantidad</th>
            <th></th><th></th><th></th><th></th>
        </tr>
        </thead>
        <tbody>
        <% for (ObjetoBean objeto : listaobjeto ) {%>
        <tr>
            <th></th><th></th><th></th><th></th><th></th>
            <td><%=objeto.getNombre()%></td>
            <td><%=objeto.getPeso()%> Kg</td>
            <td><%=objeto.getTipo()%> </td>
            <td><%= objeto.getCantidad()%></td>
            <td><a href="<%=request.getContextPath()%>/SupervivienteServlet?action=borrarobjeto&idHumano=<%=objeto.getIdHumano()%>&idObjeto=<%=objeto.getIdObjeto()%>"><button type="button" class="btn btn-outline-danger">Eliminar</button></a></td>
            <th></th><th></th><th></th><th></th>
        </tr>
        <%
            } %>
        </tbody>
    </table>
    <center><a href="<%=request.getContextPath()%>/SupervivienteServlet">
        <button type="button" class="btn btn-Warning">Regresar</button>
    </a>
    </center>
</div>




<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>