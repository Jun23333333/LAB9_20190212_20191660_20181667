<%@ page import="Beans.SupervivienteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSuperviviente" scope="request" type="java.util.ArrayList<Beans.SupervivienteBean>" />
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>agregar superviviente</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/estilos.css" />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"></script>
</head>
<body>
<section class="vh-100">
    <div class="container py-4 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-2">Registrar Superviviente</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/SupervivienteServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="nombre">Nombre</label>
                                        <input name="nombre"
                                               type="text"
                                               id="nombre"
                                               class="form-control"
                                               placeholder="Ingrese nombre"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="apellido">Apellidos</label>
                                        <input name="apellido"
                                               type="text"
                                               id="apellido"
                                               class="form-control"
                                               placeholder="Ingrese apellido"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="NI">Numero de Identificacion</label>
                                        <input name="NI"
                                               type="number"
                                               id="NI"
                                               class="form-control"
                                               placeholder="Ingrese num de identificacion"/>
                                    </div>

                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="peso">Peso</label>
                                        <input name="peso"
                                               type="number"
                                               id="peso"
                                               class="form-control"
                                               placeholder="Ingrese su usuario"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="fuerza">Fuerza</label>
                                        <input name="fuerza"
                                               type="number"
                                               id="fuerza"
                                               class="form-control"
                                               placeholder="Ingrese su fuerza"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="pareja">Pareja</label>
                                        <select name="pareja"
                                               id="pareja"
                                               class="form-control">
                                            <option value="alone">--Forever Alone--</option>
                                            <% for (SupervivienteBean superviviente : listaSuperviviente){%>
                                            <option value="<%=superviviente.getNumero_identi()%>"><%=superviviente.getNombre()%> <%=superviviente.getApellido()%></option>
                                            <% } %>
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/SupervivienteServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Superviviente</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
