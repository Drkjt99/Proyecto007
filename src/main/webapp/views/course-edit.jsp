<%@page import="com.academik.mvc.utils.TimeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean 
    id="single_course" 
    scope="request" 
    class="com.academik.mvc.model.Course"/>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Editar curso"/>
</jsp:include>

<h1>Editar estudiante</h1>
<form method="POST">
    <input type="hidden" name="_method" value="PUT"/>
    <input type="hidden" name="code" value="${single_course.code}"/>
    <div class="form-group">
        <label for="c_name">Nombre</label>
        <input class="form-control" type="text" name="c_Name" value="${single_course.name}"/>
    </div>
    <div class="form-group">
        <label for="c_descrition">Description</label>
        <input class="form-control" type="text" name="c_description" value="${single_course.description}"/>
    </div>
    <div class="form-group">
        <label for="c_creditos">Creditos</label>
        <input class="form-control" type="text" name="c_creditos" value="${single_course.credits}"/>
    </div>
    <input class="btn btn-outline-primary" type="submit" value="Guardar"/>
</form>

<%@include file="../templates/footer.jsp" %>
