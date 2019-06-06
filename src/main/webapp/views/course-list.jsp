<%@page import="com.academik.mvc.model.Course" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Cursos"/>
</jsp:include>

<!-- 
Etiqueta que declara el objeto list_of_students 
proveniente del StudentController, método doGet.
-->
<jsp:useBean 
    id="list_of_courses"
    scope="request" 
    class="List<Course>" />
    <h1>Información de Cursos</h1>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="students/list.jsp">Estudiantes</a>
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
            <th>Name</th>
            <th>Description</th>
            <th>Credits</th>
        </tr>
    </thead>
    <tbody>
        <% for(Course c : list_of_courses) { %> 
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getDescription() %></td>
            <td><%= c.getCredits() %></td>
            <td>
                <a class="btn btn-outline-primary" href="courses/edit?id=<%= c.getCode() %>">Editar</a>
                <a class="btn btn-outline-primary" href="courses/view?id=<%= c.getCode() %>">Ver</a>
            </td>
        </tr>
        <%}%>
    </tbody>
</table>

<%@include file="../templates/footer.jsp" %>
