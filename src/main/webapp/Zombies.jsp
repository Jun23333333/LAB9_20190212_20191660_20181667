<%@ page import="Beans.ZombieBean" %>
<%@ page import="Beans.VarianteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaZombie" scope="request" type="java.util.ArrayList<Beans.ZombieBean>"/>
<jsp:useBean id="varianteMasComun" scope="request" type="Beans.VarianteBean" />
<jsp:useBean id="zombieH" scope="request" type="Beans.ZombieBean" />
<jsp:useBean id="zombieM" scope="request" type="Beans.ZombieBean" />

<jsp:useBean id="promedio1" scope="request" type="Beans.ZombieBean" />
<jsp:useBean id="promedio2" scope="request" type="Beans.ZombieBean" />
<jsp:useBean id="promedio3" scope="request" type="Beans.ZombieBean" />
<jsp:useBean id="promedio4" scope="request" type="Beans.ZombieBean" />
<jsp:useBean id="promedio5" scope="request" type="Beans.ZombieBean" />

<!doctype html>
<html lang="en">
<%int cont=0;%>
<head>
    <title>Zombies</title>
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
            <th scope="col">Tipo de zombie</th>
            <th scope="col">Tiempo Infectado</th>
            <th scope="col">Variante de virus</th>
            <th scope="col">Numero de Victimas</th>
            <th scope="col">Actualizar Tiempo de infección</th>
        </tr>
        </thead>
        <tbody>
        <%for (ZombieBean zombie : listaZombie) {
        cont++;%>
        <tr>
            <th></th><th></th><th></th><th></th><th></th>
            <td><%=zombie.getTipo()%></td>
            <td><%=zombie.getTiempo_infectado()%></td>
            <td><%=zombie.getVariante().getNombre()%></td>
            <td><%=zombie.getNum_victima()%></td>
            <td><a href="<%=request.getContextPath()%>/ZombieServlet?action=agregarT&id=<%=zombie.getNumero_identi()%>">
                <button type="button" class="btn btn-success">Calcular</button>
            </a></td>
        </tr>
        <% }%>
        </tbody>
    </table>
    <a href="<%=request.getContextPath()%>/ZombieServlet?action=agregarL">
        <button type="button" class="btn btn-Warning">Agregar Zombie</button>
    </a>
</div>

<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">Variante de virus mas comun</th>

            <th scope="col">Porcentaje de zombie</th>
        </tr>
        </thead>

        <tr>
            <td><%=varianteMasComun.getNombre()%></td>

            <td>Hombre: <%=zombieH.getCantidad()%> </td>
        </tr>
        <tr>
            <td> </td>

            <td>Mujer: <%=zombieM.getCantidad()%> </td>
        </tr>
        <tr>
            <%float prom = cont-zombieH.getPromedio()-zombieM.getPromedio();%>
            <td> </td>

            <td>Otros:  <%=prom%> </td>
        </tr>

    </table>
</div>
<div class="table-responsive">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th><%=promedio1.getTipo()%></th>
            <th><%=promedio2.getTipo()%></th>
            <th><%=promedio3.getTipo()%></th>
            <th><%=promedio4.getTipo()%></th>
            <th><%=promedio5.getTipo()%></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><%=promedio1.getPromedio()%></td>
            <td><%=promedio2.getPromedio()%></td>
            <td><%=promedio3.getPromedio()%></td>
            <td><%=promedio4.getPromedio()%></td>
            <td><%=promedio5.getPromedio()%></td>
        </tr>
        </tbody>
    </table>
</div>


<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
