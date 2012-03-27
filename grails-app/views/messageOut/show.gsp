
<%@ page import="com.gworks.MessageOut" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageOut.label', default: 'MessageOut')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.errorMsg.label" default="Error Msg" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "errorMsg")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.message.label" default="Message" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "message")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.msgType.label" default="Msg Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "msgType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.operator.label" default="Operator" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "operator")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.preference.label" default="Preference" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "preference")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.receivedTime.label" default="Received Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${messageOutInstance?.receivedTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.receiver.label" default="Receiver" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "receiver")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.sender.label" default="Sender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "sender")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.sentTime.label" default="Sent Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${messageOutInstance?.sentTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="messageOut.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: messageOutInstance, field: "status")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${messageOutInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
