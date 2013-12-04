<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<template:addResources type="javascript" resources="jquery.min.js,magic8ball.js"/>
<template:addResources type="css" resources="magic8ball.css"/>

<h3 class="title"><fmt:message key="m8b_magic8ball"/></h3>
<div class="magic8ballForm${currentNode.identifier}">
	<c:choose>
		<c:when test="${renderContext.editMode}">
			<div class="addanswers">
				<span><fmt:message key="m8b_addAnswers"/></span>
				<template:list path="answers" listType="m8bnt:answerList" editable="true"/>
			</div>
		</c:when>
		<c:otherwise>
			<div class="m8bContainer">
				<div class="m8bImage">
					<img src="<c:url value='${url.currentModule}/img/magic_eight_ball.png'/>" alt="Magic 8 Ball" />
					<span class="m8bAnswerContainer" id="m8bAnswerContainer_${currentNode.identifier}"></span>
				</div>
				<br />
				<form id="form_${currentNode.identifier}" name="form_${currentNode.identifier}" class="formM8B">
					<span id="required_${currentNode.identifier}" class="m8bRequired"><fmt:message key='m8b_placeholderRequired'/></span>
					<br />
					<input type="hidden" class="m8bIdentifier" value="${currentNode.identifier}" />
					<input type="hidden" id="m8bPath_${currentNode.identifier}" value="<c:url value="${url.base}${currentNode.path}"/>" />
					<input class="text-input m8bQuestionInput" id="m8bQuestionInput_${currentNode.identifier}" type="text" value="" placeholder="<fmt:message key='m8b_placeholder'/>" />
					<button class="button" type="submit"><fmt:message key='m8b_question'/></button>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</div>
