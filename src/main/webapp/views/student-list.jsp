<%@page import="com.academik.mvc.model.Student" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Estudiantes"/>
</jsp:include>

<!-- 
Etiqueta que declara el objeto list_of_students 
proveniente del StudentController, método doGet.
-->
<jsp:useBean 
    id="list_of_students"
    scope="request" 
    class="List<Student>" />
  <h1>Información de estudiantes</h1>  
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="courses/list.jsp">Cursos</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="students/create">Registrar Estudiante <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="courses/create">Nuevo Curso <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav> 
<table class="table">
    <thead>
        <tr>
            <th>Estudiante</th>
            <th>Correo</th>
            <th>Encargado</th>
            <th>Contacto</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <% for(Student s : list_of_students) { %> 
        <tr>
            <td><%= s.getFullName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getGuardian() %></td>
            <td><%= s.getContactPhone() %></td>
            <td>
                <a class="btn btn-outline-primary" href="students/edit?id=<%= s.getCode() %>">Editar</a>
                <a class="btn btn-outline-primary" href="students/view?id=<%= s.getCode() %>">Ver</a>
            </td>
        </tr>
        <%}%>
    </tbody>
</table>

<%@include file="../templates/footer.jsp" %>