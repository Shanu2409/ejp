<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html><body>
        <h2> Core Tag Library</h2>
        <c:out value="${'Welcome to Enterprise Java'}"/>
        <br>
        <c:set var="x" value="10"/>
        <c:out value="${x}"/>

        <h2>Functions Tag Library</h2>
        <c:set var="str" value="Welcome"/>
        <c:if test="${fn:contains(str,'Welcome')}">
            <c:out value="${'Found String'}"/>
        </c:if>


        <h2>XML Tag Library</h2>  
        <c:set var="vegetable">  
        <vegetables>  
            <vegetable>  
                <name>onion</name>  
                <price>40/kg</price>  
            </vegetable>  
            <vegetable>  
                <name>Potato</name>  
                <price>30/kg</price>  
            </vegetable>  
            <vegetable>  
                <name>Tomato</name>  
                <price>90/kg</price>  
            </vegetable>  
        </vegetables>  
    </c:set>  

    <x:parse xml="${vegetable}" var="output"/>  
    <b>Name of the vegetable is</b>:  
    <x:out select="$output/vegetables/vegetable[1]/name" /><br>  
    <b>Price of the Potato is</b>:  
    <x:out select="$output/vegetables/vegetable[2]/price" />  

    
    <h2>Formatting Tag Library</h2> 
    <c:set var="Amount" value="786.970" />  
    <fmt:parseNumber var="j" type="number" value="${Amount}" />  
    <p><i>Amount is:</i>  <c:out value="${j}" /></p> 

    
    <h2>SQL Tag Library</h2>
    <sql:setDataSource var="db" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/demo" user="root"  password="root"/> 
    <sql:query dataSource="${db}" var="rs">
        SELECT * from emp  
    </sql:query> 

    <table border="2" width="100%">  
        <tr>  
            <th>Emp ID</th>  
            <th>Emp Name</th> 
            <th>Salary</th>
            <th>Age</th>
        </tr>  
        <c:forEach var="table" items="${rs.rows}">  
            <tr>  
                <td align="center"><c:out value="${table.empid}"/></td>  
                <td align="center"><c:out value="${table.ename}"/></td>  
                <td align="center"><c:out value="${table.salary}"/></td> 
                <td align="center"><c:out value="${table.age}"/></td>
            </tr>  
        </c:forEach>  
    </table>  
</body></html>
