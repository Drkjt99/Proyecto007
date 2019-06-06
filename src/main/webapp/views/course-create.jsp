<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../templates/header.jsp">
    <jsp:param name="custom-title" value="Academik | Crear Curso"/>
</jsp:include>

    <h1>Nuevo estudiante</h1>
    <form method="POST">
        <div class="form-group">
            <label for="c_name">Nombre de Curso</label>
            <input class="form-control" type="text" name="c_name"/>
        </div>
        <div class="form-group">
            <label for="c_description">Description</label>
            <input class="form-control" type="text" name="c_description"/>
        </div>
    <div class="form-group">
        <label for="c_credits">Creditos</label>
        <select class="form-control" name="c_credits">
            <option value="1 credito">1</option>
            <option value="2 creditos">2</option>
            <option value="3 creditos">3</option>
            <option value="4 creditos">4</option>
            <option value="5 creditos">5</option>
        </select>
    </div>
        <input class="btn btn-outline-primary" type="submit" value="Crear"/>
    </form>

<%@include file="../templates/footer.jsp" %>
