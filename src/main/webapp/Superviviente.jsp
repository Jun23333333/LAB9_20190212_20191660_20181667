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
            <li class="nav-item"><a href="<%=request.getContextPath()%>/HumanoServlet" class="nav-link " aria-current="page">Humanos</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/SupervivienteServlet" class="nav-link active" >Supervivientes</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/VirusServlet" class="nav-link ">Virus</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/ZombieServlet" class="nav-link">Zombies</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/ObjetoServlet" class="nav-link">Objetos</a></li>
            <li class="nav-item"><a href="<%=request.getContextPath()%>/CaceriaServlet" class="nav-link">Cacería</a></li>
        </ul>
    </header>
</div>
<div class="b-example-divider"></div>

<div class="table-responsive">
    <a href="<%=request.getContextPath()%>/SupervivienteServlet?action=agregar">
        <center><button type="button" class="btn btn-Warning"><b>Agregar Superviviente</b></button></center>

    </a>
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
            <th></th>
            <th></th>
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
            <td><a href="<%=request.getContextPath()%>/SupervivienteServlet?action=editar&id=<%=superviviente.getNumero_identi()%>"><button type="button" class="btn btn-outline-primary">Editar</button></a></td>
            <td><a href="<%=request.getContextPath()%>/SupervivienteServlet?action=borrar&id=<%=superviviente.getNumero_identi()%>"><button type="button" class="btn btn-outline-danger">Eliminar</button></a></td>
        </tr>
        <% }%>
    </table>

</div>


<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
