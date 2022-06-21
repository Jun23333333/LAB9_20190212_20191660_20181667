<%@ page import="Beans.VirusBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaVirus" scope="request" type="java.util.ArrayList<Beans.VirusBean>" />
<jsp:useBean id="Virus_activos" scope="request" type="Servlets.VirusServlet" />
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
            <li class="nav-item"><a href="#" class="nav-link ">Humanos</a></li>
            <li class="nav-item"><a href="#" class="nav-link ">Supervivientes</a></li>
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Virus</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Zombies</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Objetos</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Cacería</a></li>
        </ul>
    </header>
</div>
<div class="b-example-divider"></div>
<h3>Virus activos: <%=Virus_activos%></h3>
<div class="table-responsive" >
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th></th><th></th><th></th><th></th><th></th>
            <th scope="col">ID</th>
            <th scope="col">Virus</th>
            <th scope="col">ID Variante</th>
            <th scope="col">Variante</th>
            <th SCOPE="col">Casos encontrados</th>
            <th></th><th></th><th></th><th></th>
        </tr>
        </thead>
        <tbody>
        <% for (VirusBean virus : listaVirus ) {%>
        <tr>
            <th></th><th></th><th></th><th></th><th></th>
            <td><%=virus.getId()%></td>
            <td><%=virus.getVirus()%></td>
            <td><%=virus.getVariante().getId()%></td>
            <td><%=virus.getVariante().getNombre()%></td>
            <td><%=virus.getCaso()%></td>
            <th></th><th></th><th></th><th></th>
        </tr>
        <%
            } %>
        </tbody>
    </table>
</div>



<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
