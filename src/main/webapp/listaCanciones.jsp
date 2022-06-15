<%@ page import="Beans.Canciones" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean type="java.util.ArrayList<Beans.Canciones>" scope="request" id="listaCanciones"/>
<html>
    <jsp:include page="/static/head.jsp">
        <jsp:param name="title" value="Lista de Canciones"/>
    </jsp:include>
    <body>
        <div class='container'>
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="canciones"/>
            </jsp:include>
            <div class="pb-5 pt-4 px-3 titlecolor">
                <div class="col-lg-6">
                    <h1 class='text-light'>Lista de Canciones</h1>
                </div>
                
            </div>
            <div class="tabla">
                <table class="table table-dark table-transparent table-hover">
                    <thead>
                        <th>ID</th>
                        <th>CANCION</th>
                        <th>BANDA</th>
                        <th>Ver</th>

                    </thead>
                    <%
                        for (Canciones canciones : listaCanciones) {
                    %>
                    <tr>
                        <td><%=canciones.getIdCancion()%>
                        </td>
                        <td><%=canciones.getNombre_cancion()%>
                        </td>
                        <td><%=canciones.getBanda()%>
                        </td>
                        <td>
                            <%
                                if (Objects.equals(canciones.getEstado(), "no")) {

                            %>
                            <a href="<%=request.getContextPath()%>/listaCanciones?a=favorito&id=<%=canciones.getIdCancion()%>&estado=<%=canciones.getEstado()%>"
                               class="btn btn-success">Like</a>
                            <% }
                                else {
                            %>
                            <a  href="<%=request.getContextPath()%>/listaCanciones?a=favorito&id=<%=canciones.getIdCancion()%>&estado=<%=canciones.getEstado()%>"
                                class="btn btn-danger">Unlike</a>
                            <%
                                }
                            %>
                        </td>

                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

        </div>
        <jsp:include page="/static/scripts.jsp"/>
    </body>
</html>
