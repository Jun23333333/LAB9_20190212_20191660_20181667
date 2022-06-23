<%@ page import="Beans.SupervivienteBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>Nuevo empleado</title>
</head>
<body>
<div class='container'>
    <div class="row mb-4">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h1 class='mb-3'>Nuevo Superviviente</h1>
            <hr>
            <form method="POST" action="SupervivienteServlet?action=crear">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control form-control-sm" name="nombre" id="nombre">
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control form-control-sm" name="apellido" id="apellido">
                </div>
                <div class="form-group">
                    <label>Sexo</label>
                    <select  class="form-select" aria-label="Default select example" name="sexo">
                        <option selected>Escoger sexo</option>
                        <option>masculino</option>
                        <option>femenino</option>
                        <option>otro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="peso">Peso</label>
                    <input type="text" class="form-control form-control-sm" name="peso" id="peso">
                </div>
                <div class="form-group">
                    <label for="fuerza">Fuerza</label>
                    <input type="text" class="form-control form-control-sm" name="fuerza" id="fuerza">
                </div>

                <a href="<%= request.getContextPath()%>/SupervivienteServlet" class="btn btn-danger">Cancelar</a>
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
