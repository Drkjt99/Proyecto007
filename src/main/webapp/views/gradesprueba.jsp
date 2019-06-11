<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.academik.mvc.model.Student"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Cursos"/>
</jsp:include>

<!-- 
Etiqueta que declara el objeto list_of_students 
proveniente del StudentController, método doGet.
-->
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
    <input type="hidden" name="_method" value="PUT"/>
    <input type="hidden" name="code" value="${single_course.code}"/>
    <div class="form-group">
    <div class="form-group">
    <label for="s_fullname">Nombre Estudiante</label>           
        <select class="form-control" name="s_fullname">
            <% for(com.academik.mvc.model.Student s : students) { %>
            <option value="<%=s.getCode()%>"><%=s.getFullName()%></option>
            <%}%>
        </select>                    
    </div>
    <div class="form-group">       
    <div class="form-group">
    <label for="c_name">Nombre Curso</label>           
        <select class="form-control" name="c_name">            
            <% for(com.academik.mvc.model.Course c : courses) { %>
            <option value="<%=c.getCode()%>"><%=c.getName()%></option>
            <%}%>
        </select>        
    </div>
    <div class="form-group">
        <label for="grade">Punteo</label>
        <input class="form-control" type="text" name="grade" value=""/>
    </div>
    <input class="btn btn-outline-primary" type="submit" value="Guardar"/>
    <%  
        String complement = request.getPathInfo();
        Integer studentsCode=0;
        Integer courseCode=0;
        double grades = 0.00;
        if("PUT".equals(request.getParameter("_method"))){
            doPut(request, response);
            return;
        }
        if("DELETE".equals(request.getParameter("_method"))){
            doDelete(request, response);
            return;
        }
        
        System.out.println("creating a new course");
        
        //studentsCode(request.getParameter("s_fullname"));
        //courseCode(request.getParameter("c_name"));
        //grades(request.getParameter("grade"));

        response.sendRedirect(request.getContextPath() + "/courses");
    
        
    
    %>
    <%         
    
    Connection conn = null;
    Statement sql = null;
    //try{
        //Class.forName("org.postgresql.Driver");
        //conn=(Connection)DriverManager.getConnection("jdbc:postgresql://localhost:5432/estudent", "postgres", "@Telus2019");
        //sql = conn.createStatement();
    //}catch (SQLException | ClassNotFoundException ex){
        //ex.printStackTrace();
    //}
    //PreparedStatement stmnt = conn.prepareStatement("INSERT INTO grades"
                   // +" (students_code, course_code, grade)"
                  //  +" VALUES (?, ?, ?)");
                   // stmnt.setInt(1, studentsCode);
                   // stmnt.setInt(2, courseCode);
                   // stmnt.setDouble(3, grades);
                    //stmnt.execute();
    %>
</form>

<%@include file="../templates/footer.jsp" %>