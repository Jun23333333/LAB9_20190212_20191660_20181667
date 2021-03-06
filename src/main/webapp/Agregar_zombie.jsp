<%@ page import="Beans.VarianteBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.ZombieBean" %>
<%@ page import="Beans.VirusBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaVariante" scope="request" type="java.util.ArrayList<Beans.VarianteBean>" />
<jsp:useBean id="listasexo" scope="request" type="java.util.ArrayList<Beans.ZombieBean>" />
<jsp:useBean id="listaTipo" scope="request" type="java.util.ArrayList<Beans.ZombieBean>" />
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>agregar zombie</title>
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
                        <h4 class="my-2">Registrar Zombie</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/ZombieServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="tipo">Elegir tipo</label>
                                        <select class="form-select form-select-sm" name="filtro" aria-label=".form-select-sm example">
                                            <option value="Selecciona el tipo" >Selecciona el tipo</option>
                                            <%for( ZombieBean zombieBean: listaTipo){%>
                                            <option value="<%=zombieBean.getTipo()%>" id="tipo" name="tipo"><%=zombieBean.getTipo()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="variante">Elegir variante</label>
                                        <select class="form-select form-select-sm" name="filtro" aria-label=".form-select-sm example">
                                        <option value="Selecciona el tipo" >Selecciona el tipo</option>
                                        <%for( VarianteBean varianteBean: listaVariante){%>
                                        <option value="<%=varianteBean.getId()%>" id="variante" name="variante"><%=varianteBean.getNombre()%></option>
                                        <%}%>
                                    </select>
                                    </div>

                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="tiempo">Tiempo Infectado</label>
                                        <input name="tiempo"
                                               type="number"
                                               id="tiempo"
                                               class="form-control"
                                               placeholder="Ingrese el tiempo infectado"/>
                                    </div>


                                </div>
                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/ZombieServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Zombie</button>
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
