<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Cursos"/>
</jsp:include>

    <%!
    com.academik.mvc.dao.CourseDAO dao2 = new com.academik.mvc.dao.CourseDAO();
    java.util.List<com.academik.mvc.model.Course> courses = dao2.queryAll();
    com.academik.mvc.dao.StudentDAO dao = new com.academik.mvc.dao.StudentDAO();
    java.util.List<com.academik.mvc.model.Student> students = dao.queryAll();                                                                      
    %>
<h1>Información de Cursos</h1>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="students/list.jsp">Estudiantes</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>    

    <form method="POST">
    <div class="form-group">        
    <label for="s_fullname">Nombre Estudiante</label>           
        <select class="form-control" name="s_fullname">
            <% for(com.academik.mvc.model.Student s : students) { %>
            <option value="<%=s.getCode()%>"><%=s.getFullName()%></option>
            <%}%>
        </select>                    
    </div>
        
    <div class="form-group">       
    <label for="c_name">Nombre Curso</label>           
        <select class="form-control" name="c_name">            
            <% for(com.academik.mvc.model.Course c : courses) { %>
            <option value="<%=c.getCode()%>"><%=c.getName()%></option>
            <%}%>
        </select>        
    </div>
    <div class="form-group">
        <label for="g_grade">Punteo</label>
        <input class="form-control" type="text" name="g_grade" value=""/>
    </div>
    <input class="btn btn-outline-primary" type="submit" value="Guardar"/>
