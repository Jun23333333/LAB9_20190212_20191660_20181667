<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 21/06/2022
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Agregar variante</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
                        <h2 class="my-2">Registrar Virus</h2>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/VirusServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="virus">Virus</label>
                                        <input name="virus"
                                               type="text"
                                               id="virus"
                                               class="form-control"
                                               placeholder="Ingrese virus"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="variante">Variante</label>
                                        <input name="variante"
                                               type="text"
                                               id="variante"
                                               class="form-control"
                                               placeholder="Ingrese variante"/>
                                    </div>

                                </div>


                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/VirusServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Virus</button>
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
