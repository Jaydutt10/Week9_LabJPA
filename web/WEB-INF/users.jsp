<%-- 
    Document   : users
    Created on : 12-Mar-2023, 5:15:40 PM
    Author     : jaydu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        <c:choose>
            <c:when test="${users.size() > 0}">
                <table border="1">
                    <tr>
                        <th>Email</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <c:forEach items="{users}" var="user">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.role.name}</td>
                            <td>
                                <c:url value="/user" var="editUser">
                                    <c:param name="email" value="${user.email}" />
                                    <c:param name="action" value="edit" />
                                </c:url>
                                <a href=${editUser}>Edit</a>
                            </td>
                            <td>
                                <c:url value="/user" var="deleteUser">
                                    <c:param name="email" value="${user.email}" />
                                    <c:param name="action" value="delete" />
                                </c:url>
                                <a href=${deleteUser}>Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
        </c:choose>

        <c:if test="${selectedUser ne null}">           
            <h2>Edit Users</h2>
            <form action="user" method="post">
                <input type="hidden" name="email" value="${selectedUser.email}"> 
                Email: ${selectedUser.email} <br>
                First Name: <input type="text" name="firstName" required value="${selectedUser.firstName}"> <br>
                Last Name: <input type="text" name="lastName" required value="${selectedUser.lastName}"> <br>
                Password: <input type="password" name="password" required value="${selectedUser.password}"> <br>
                Role: <select name="role">
                        <option value="system admin">system admin</option>
                        <option value="regular user">regular user</option>
                      </select> <br>
                      
                     <input type="submit" value="update">
                     <input type="hidden" name="action" value="update">
                    <a href="\user" class="button">Cancel</a>
                    
                     
                          
            <h2>Add User</h2>
            <form action="user" method="post">
                Email: <input type="text" name="email" required> <br>
                First Name: <input type="text" name="firstName" required> <br>
                Last Name: <input type="text" name="lastName" required> <br>
                Password: <input type="password" name="password" required> <br>
                Role: <select name="role">
                        <option value="system admin">system admin</option>
                        <option value="regular user">regular user</option>
                      </select> 
                      
                     <input type="submit"value="Add User">
                      <input type="hidden" name="action" value="add">
            </form>
        </c:if> 

            </form>
        </c:if>
        
    </body>
</html>