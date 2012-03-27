
<%@ page import="com.gworks.MessageOut" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageOut.label', default: 'MessageOut')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'messageOut.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="errorMsg" title="${message(code: 'messageOut.errorMsg.label', default: 'Error Msg')}" />
                        
                            <g:sortableColumn property="message" title="${message(code: 'messageOut.message.label', default: 'Message')}" />
                        
                            <g:sortableColumn property="msgType" title="${message(code: 'messageOut.msgType.label', default: 'Msg Type')}" />
                        
                            <g:sortableColumn property="operator" title="${message(code: 'messageOut.operator.label', default: 'Operator')}" />
                        
                            <g:sortableColumn property="preference" title="${message(code: 'messageOut.preference.label', default: 'Preference')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${messageOutInstanceList}" status="i" var="messageOutInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${messageOutInstance.id}">${fieldValue(bean: messageOutInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: messageOutInstance, field: "errorMsg")}</td>
                        
                            <td>${fieldValue(bean: messageOutInstance, field: "message")}</td>
                        
                            <td>${fieldValue(bean: messageOutInstance, field: "msgType")}</td>
                        
                            <td>${fieldValue(bean: messageOutInstance, field: "operator")}</td>
                        
                            <td>${fieldValue(bean: messageOutInstance, field: "preference")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${messageOutInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
