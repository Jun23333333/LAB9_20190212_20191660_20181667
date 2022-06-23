<%@ page import="Beans.SupervivienteBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="listaSuperviviente" scope="request" type="java.util.ArrayList<Beans.SupervivienteBean>" />
<jsp:useBean id="superviviente" scope="request" type="Beans.SupervivienteBean" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<div class='container'>
    <div class="row mb-4">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h1 class='mb-3'>Editar usuario</h1>
            <hr>
            <form method="POST" action="SupervivienteServlet?action=actualizar">
                <input type="hidden" name="numeroid" value="<%= superviviente.getNumero_identi()%>"/>
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control form-control-sm" id="nombre" name="nombre"
                           value="<%= superviviente.getNombre() == null ? "" : superviviente.getNombre()%>">
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido</label>
                    <input type="text" disabled class="form-control form-control-sm" id="apellido" name="apellido"
                           value="<%= superviviente.getApellido() == null ? "" : superviviente.getApellido()%>">
                </div>
                <div class="form-group">
                    <label for="peso">Peso</label>
                    <input type="text" class="form-control form-control-sm" id="peso" name="peso"
                           value="<%= superviviente.getPeso()%>">
                </div>
                <div class="form-group">
                    <label for="fuerza">Fuerza</label>
                    <input type="text" class="form-control form-control-sm" id="fuerza" name="fuerza"
                           value="<%= superviviente.getFuerza()%>">
                </div>
                <div class="form-group">
                    <label>Pareja</label>
                    <select  class="form-select" aria-label="Default select example" name="pareja">
                        <option selected>Escoger pareja</option>
                        <option selected>Sol@</option>
                        <% for (SupervivienteBean supervi: listaSuperviviente){
                        %>
                        <option value="<%=supervi.getNumero_identi()%>"><%=supervi.getNombre()%> <%=supervi.getApellido()%></option>
                        <% } %>
                    </select>
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
