<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>agregar Objeto</title>
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
                        <h4 class="my-2">Registrar Objeto</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/ObjetoServlet?action=crear_objeto">
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
                                        <label class="form-label" for="peso">Peso</label>
                                        <input name="peso"
                                               type="number"
                                               id="peso"
                                               class="form-control"
                                               placeholder="Ingrese su peso"/>
                                    </div>

                                </div>
                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/ObjetoServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Objeto</button>
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
