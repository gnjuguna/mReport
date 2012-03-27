

<%@ page import="com.gworks.MessageOut" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'messageOut.label', default: 'MessageOut')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageOutInstance}">
            <div class="errors">
                <g:renderErrors bean="${messageOutInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${messageOutInstance?.id}" />
                <g:hiddenField name="version" value="${messageOutInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="errorMsg"><g:message code="messageOut.errorMsg.label" default="Error Msg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'errorMsg', 'errors')}">
                                    <g:textField name="errorMsg" value="${messageOutInstance?.errorMsg}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="message"><g:message code="messageOut.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'message', 'errors')}">
                                    <g:textField name="message" value="${messageOutInstance?.message}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="msgType"><g:message code="messageOut.msgType.label" default="Msg Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'msgType', 'errors')}">
                                    <g:textField name="msgType" value="${messageOutInstance?.msgType}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="operator"><g:message code="messageOut.operator.label" default="Operator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'operator', 'errors')}">
                                    <g:textField name="operator" value="${messageOutInstance?.operator}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="preference"><g:message code="messageOut.preference.label" default="Preference" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'preference', 'errors')}">
                                    <g:textField name="preference" value="${messageOutInstance?.preference}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="receivedTime"><g:message code="messageOut.receivedTime.label" default="Received Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'receivedTime', 'errors')}">
                                    <g:datePicker name="receivedTime" precision="day" value="${messageOutInstance?.receivedTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="receiver"><g:message code="messageOut.receiver.label" default="Receiver" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'receiver', 'errors')}">
                                    <g:textField name="receiver" value="${messageOutInstance?.receiver}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sender"><g:message code="messageOut.sender.label" default="Sender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'sender', 'errors')}">
                                    <g:textField name="sender" value="${messageOutInstance?.sender}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sentTime"><g:message code="messageOut.sentTime.label" default="Sent Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'sentTime', 'errors')}">
                                    <g:datePicker name="sentTime" precision="day" value="${messageOutInstance?.sentTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="messageOut.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: messageOutInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${messageOutInstance?.status}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
