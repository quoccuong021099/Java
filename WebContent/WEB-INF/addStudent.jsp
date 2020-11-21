
<%-- 
 Document : index
 Created on : Nov 21, 2015, 3:06:24 PM
 Author : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title>
 </head>
 <body>
 ${add}
 <h1>Add Student</h1>
 <form action="InsertStudent" method="POST">
   <table>
      <tr>
        <td>Name</td>
        <td><input type="text" name="txtName" value="" /></td>
     </tr>
     <tr>
        <td>Age</td>
        <td><input type="text" name="txtAge" value="" /></td>
     </tr>
     <tr>
        <td>Address</td>
        <td><input type="text" name="txtAddress" value="" /></td>
     </tr>
     <tr>
        <td></td>
        <td><input type="submit" value="Add" /></td>
    </tr>
  </table>
 </form>
 </body>
</html>