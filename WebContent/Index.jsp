<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    List<String[]> empleados = new ArrayList<>();
    try (Connection connection = ConexionDB.getConnection();
         Statement statement = connection.createStatement();
         ResultSet rs = statement.executeQuery("SELECT * FROM EMPLEADO")) {

        while (rs.next()) {
            String[] empleado = {rs.getString("NUMEMPLEADO"), rs.getString("NOMBRE")};
            empleados.add(empleado);
        }
    } catch (SQLException e) {
        out.println("Error al conectar con la base de datos: " + e.getMessage());
    }
%>

<html>
<head>
    <title>Lista de Empleados</title>
</head>
<body>
    <h2>Lista de Empleados</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
        </tr>
        <c:forEach var="empleado" items="<%= empleados %>">
            <tr>
                <td><c:out value="${empleado[0]}" /></td>
                <td><c:out value="${empleado[1]}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
