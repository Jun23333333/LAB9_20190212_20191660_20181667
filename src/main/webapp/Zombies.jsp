<%@ page import="Beans.ZombieBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaZombie" scope="request" type="java.util.ArrayList<Beans.ZombieBean>" />
<jsp:useBean id="variante_comun" scope="request" type="Servlets.ZombieServlet" />
<jsp:useBean id="Porcentaje_hombre" scope="request" type="Servlets.ZombieServlet" />
<jsp:useBean id="Porcentaje_mujer" scope="request" type="Servlets.ZombieServlet" />
<jsp:useBean id="Porcentaje_otro" scope="request" type="Servlets.ZombieServlet" />
<jsp:useBean id="Promedio_victima" scope="request" type="Servlets.ZombieServlet" />
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
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Zombies</a></li>
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
            <th scope="col">Tiempo Infectado</th>
            <th scope="col">Variante de virus</th>
            <th scope="col">Numero de Victimas</th>
            <th scope="col">Tipo de zombie</th>
        </tr>
        </thead>
        <%for (ZombieBean zombie : listaZombie) {%>
        <tr>
            </td>
            <th></th><th></th><th></th><th></th><th></th>
            <td><%=zombie.getNumero_identi()%> </td>
            <td><%=zombie.getNombre()%> <%=zombie.getApellido()%> </td>
            <td><%=zombie.getSexo()%> </td>
            <td><%=zombie.getTiempo_infectado()%></td>
            <td><%=zombie.getVariante()%></td>
            <td><%=zombie.getNum_victima()%></td>
            <td><%=zombie.getTipo()%></td>
        </tr>
        <% }%>
    </table>
    <a href="<%=request.getContextPath()%>/ZombieServlet?a=agregar">
        <button type="button" class="btn btn-Warning">Agregar Zombie</button>
    </a>
</div>

<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">Variante de virus mas comun</th>
            <th scope="col">Promedio de victima por zombie</th>
            <th scope="col">Porcentaje de zombie</th>
        </tr>
        </thead>

        <tr>
            <td><%=variante_comun%></td>
            <td><%=Promedio_victima%> <%=zombie.getApellido()%> </td>
            <td>Hombre: <%=Porcentaje_hombre%> %</td>
        </tr>
        <tr>
            <td> </td>
            <td> </td>
            <td>Mujer: <%=Porcentaje_mujer%> %</td>
        </tr>
        <tr>
            <td> </td>
            <td> </td>
            <td>Otros: <%=Porcentaje_otro%> %</td>
        </tr>

    </table>
</div>


<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
