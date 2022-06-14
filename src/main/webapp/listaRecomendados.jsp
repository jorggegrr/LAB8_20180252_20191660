<%@ page import="Beans.Cancion" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 13/06/2022
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Cancion> listaRecomendados = (ArrayList<Cancion>) request.getAttribute("listaRecomendados");

%>
<html>
<!--Colocar como value: nombre de la presente página -->
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Lista Recomendados"/>
</jsp:include>
<body>
<div class='container'>
    <!--Colocar como value: artistas, canciones, bandas, tours o tpc  (dependiendo de la pagina a la que corresponda) -->
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="cancion"/>
    </jsp:include>
    <div class="pb-5 pt-4 px-3 titlecolor d-flex justify-content-between align-items-center">
        <div class="col-lg-6">
            <h1 class='text-light'>Lista de Canciones Recomendadas</h1>
        </div>
    </div>
    <%= listaRecomendados.size()%>
    <div class="tabla">
        <table class="table table-dark table-transparent table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>CANCION</th>
                <th>BANDA</th>
                <th>Ver</th>
            </tr>
            </thead>

            <tbody>
            <% int i = 1;

                for (Cancion cancion : listaRecomendados) { %>
            <tr>
                <td><%=cancion.getIdCancion() %>
                </td>
                <td><%=cancion.getNombre_cancion() %>
                </td>
                <td><%=cancion.getBanda()%>
                </td>
                <td><a class="btn btn-success" href="<%=request.getContextPath()%>/listaCancionesporbanda?action=cancionporbanda&id=<%=cancion.getBanda()%>" style="float: right">Más de la banda</a>
                </td>
            </tr>
            <% i++;
            } %>

            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>