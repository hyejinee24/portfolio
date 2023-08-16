<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${empty id}">
        <c:redirect url="loginpage.jsp" />
    </c:when>
    <c:otherwise>
        <c:redirect url="Mypage" />
    </c:otherwise>
</c:choose>
