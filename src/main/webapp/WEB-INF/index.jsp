<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->

    <!-- Minty cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <!-- want to add a list of all the burgers -->
    <h1 class="text-center">Burger Tracker</h1>
        <!-- make a table here -->
    <table class="table container table-hover text-center table-striped">
        <thead>
            <th>Name</th>
            <th>Restaurant Name</th>
            <th>Rating (out of 5)</th>
        </thead>
        <tbody>
            <c:forEach var="burger" items="${burgers}">
                <tr>
                    <td>${burger.name}</td>
                    <td>${burger.restaurantName}</td>
                    <td>${burger.rating}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    

    <!--  
    -> follow restful routing of wireframe 
    -> using form:form we need to add modelAttribute
    -> for validations form:form works better
    -> need to send it an empty burger to create -> modelAttribute in controllers
    -->
    <form:form class="container center" action="/burgers" method="post" modelAttribute="burger">
        <!-- now need everthing burger has -->
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="name">Name: </form:label>
            <form:errors class="text-danger" path="name"></form:errors>
            <form:input class="form-control" path="name"></form:input>
        </div>

        <div class="gap-1 mb-2 col-8 d-flex">
            <form:label path="restaurantName">Restaurant Name</form:label>
            <form:errors class="text-danger" path="restaurantName"></form:errors>
            <form:input class="form-control" path="restaurantName"></form:input>
        </div>
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="rating">Rating</form:label>
            <form:errors class="text-danger" path="rating"></form:errors>
            <form:input class="form-control" path="rating"></form:input>
        </div>
        <div class="gap-2 mb-2 col-8 d-flex">
            <form:label path="notes">Notes</form:label>
            <form:errors class="text-danger" path="notes"></form:errors>
            <form:input class="form-control" path="notes"></form:input>
        </div>

        <input type="submit" value="create burger" >
    </form:form>
</body>
</html>