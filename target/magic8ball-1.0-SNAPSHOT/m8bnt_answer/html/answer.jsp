<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="answerId" value="${currentNode.parent.parent.name}_answer_${currentNode.UUID}"/>
<c:if test="${currentNode.properties.type.string == 'status1'}">
	<span class="m8b_answer" id="${answerId}" style="color: green">${fn:escapeXml(currentNode.properties.label.string)} - <fmt:message key="m8bnt_answer.type.status1"/></span>
	<br />
</c:if>
<c:if test="${currentNode.properties.type.string == 'status2'}">
	<span class="m8b_answer" id="${answerId}" style="color: red">${fn:escapeXml(currentNode.properties.label.string)} - <fmt:message key="m8bnt_answer.type.status2"/></span>
	<br />
</c:if>
<c:if test="${currentNode.properties.type.string == 'status3'}">
	<span class="m8b_answer" id="${answerId}" style="color: orange">${fn:escapeXml(currentNode.properties.label.string)} - <fmt:message key="m8bnt_answer.type.status3"/></span>
	<br />
</c:if>
