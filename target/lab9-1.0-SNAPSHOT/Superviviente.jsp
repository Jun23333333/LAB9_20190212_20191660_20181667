<%@ page import="Beans.SupervivienteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSuperviviente" scope="request" type="java.util.ArrayList<Beans.SupervivienteBean>" />
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
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Supervivientes</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Virus</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Zombies</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Objetos</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Cacería</a></li>
        </ul>
    </header>
</div>
<div class="b-example-divider"></div>

<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th></th><th></th><th></th><th></th><th></th>
            <th scope="col">Numero de Identificacion</th>
            <th scope="col">Nombre y Apellido</th>
            <th scope="col">Sexo</th>
            <th scope="col">Peso</th>
            <th scope="col">Fuerza</th>
            <th scope="col">Pareja</th>
            <th scope="col">Peso Cargado</th>
        </tr>
        </thead>
        <%for (SupervivienteBean superviviente : listaSuperviviente) {%>
        <tr>
            </td>
            <th></th><th></th><th></th><th></th><th></th>
            <td><%=superviviente.getNumero_identi()%> </td>
            <td><%=superviviente.getNombre()%> <%=superviviente.getApellido()%> </td>
            <td><%=superviviente.getSexo()%> </td>
            <td><%=superviviente.getPeso()%> Kg</td>
            <td><%=superviviente.getFuerza()%> N</td>
            <td><%=superviviente.getParejaNombre()== null ? "" : superviviente.getParejaNombre()%>
                <%=superviviente.getParejaApellido() == null ? "Sin Pareja" : superviviente.getParejaApellido() %></td>
            <td><%=superviviente.getCarga()%> Kg</td>
        </tr>
        <% }%>
    </table>
    <a href="<%=request.getContextPath()%>/SupervivienteServlet?a=agregar">
        <button type="button" class="btn btn-Warning">Agregar Superviviente</button>
    </a>
    <a href="<%=request.getContextPath()%>/SupervivienteServlet">
        <button type="button" class="btn btn-Info">Supervivientes</button>
    </a>
</div>


<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
