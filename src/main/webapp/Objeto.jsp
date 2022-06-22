<%@ page import="Beans.ObjetoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaObjeto" scope="request" type="java.util.ArrayList<Beans.ObjetoBean>" />
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
            <li class="nav-item"><a href="#" class="nav-link ">Virus</a></li>
            <li class="nav-item"><a href="#" class="nav-link ">Zombies</a></li>
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Objetos</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Cacería</a></li>
        </ul>
    </header>
</div>
<div class="b-example-divider"></div>

<div class="table-responsive" >
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Peso</th>
            <th scope="col">Tipo</th>
            <th scope="col">Efectividad</th>
            <th> </th>
        </tr>
        </thead>
        <tbody>
        <% for (ObjetoBean objeto : listaObjeto ) {%>
        <tr>
            <td><%=objeto.getNombre()%></td>
            <td><%=objeto.getPeso()%> Kg</td>
            <td><%=objeto.getTipo()%></td>
            <% if(objeto.getTipo() == "Vacuna"){%>
            <td id="efectividad"
                class="table-elipse"
                data-bs-toggle="collapse"
                data-bs-target="abc"
            >
                <a href="#" class="fas fa-ellipsis-h text-black-50"></a>
            </td>
            <tr id="abc" class="collapse cell-1 row-child">
                <td colspan="0.7">Demoledor</td>
                <td colspan="0.7">Rapido</td>
                <td colspan="0.7">Niño</td>
                <td colspan="0.7">Normal</td>
                <td colspan="0.7">Otros</td>
            </tr>
            <tr id="abc" class="collapse cell-1 row-child">
                <td colspan="0.7"><%=objeto.getEfectividad_demo()%></td>
                <td colspan="0.7"><%=objeto.getEfectividad_rapi()%></td>
                <td colspan="0.7"><%=objeto.getEfectividad_nino()%></td>
                <td colspan="0.7"><%=objeto.getEfectividad_normal()%></td>
                <td colspan="0.7"><%=objeto.getEfectividad_otro()%></td>
            </tr>
            <% }
            else {%>
            <td> </td>
            <% } %>
            <a href="<%=request.getContextPath()%>/ObjetoServlet?a=editar">
                <button type="button" class="btn btn-Primary">Editar</button>
            </a>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="<%=request.getContextPath()%>/ObjetoServlet?a=crear_objeto">
        <button type="button" class="btn btn-Warning">Crear Objeto</button>
    </a>
    <a href="<%=request.getContextPath()%>/ObjetoServlet?a=crear_vacuna">
        <button type="button" class="btn btn-Warning">Crear Vacuna</button>
    </a>
</div>



<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
