package com.gworks

class MessageInController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [messageInInstanceList: MessageIn.list(params), messageInInstanceTotal: MessageIn.count()]
    }

    def create = {
        def messageInInstance = new MessageIn()
        messageInInstance.properties = params
        return [messageInInstance: messageInInstance]
    }

    def save = {
        def messageInInstance = new MessageIn(params)
        if (messageInInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), messageInInstance.id])}"
            redirect(action: "show", id: messageInInstance.id)
        }
        else {
            render(view: "create", model: [messageInInstance: messageInInstance])
        }
    }

    def show = {
        def messageInInstance = MessageIn.get(params.id)
        if (!messageInInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
            redirect(action: "list")
        }
        else {
            [messageInInstance: messageInInstance]
        }
    }

    def edit = {
        def messageInInstance = MessageIn.get(params.id)
        if (!messageInInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [messageInInstance: messageInInstance]
        }
    }

    def update = {
        def messageInInstance = MessageIn.get(params.id)
        if (messageInInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (messageInInstance.version > version) {
                    
                    messageInInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'messageIn.label', default: 'MessageIn')] as Object[], "Another user has updated this MessageIn while you were editing")
                    render(view: "edit", model: [messageInInstance: messageInInstance])
                    return
                }
            }
            messageInInstance.properties = params
            if (!messageInInstance.hasErrors() && messageInInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), messageInInstance.id])}"
                redirect(action: "show", id: messageInInstance.id)
            }
            else {
                render(view: "edit", model: [messageInInstance: messageInInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def messageInInstance = MessageIn.get(params.id)
        if (messageInInstance) {
            try {
                messageInInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageIn.label', default: 'MessageIn'), params.id])}"
            redirect(action: "list")
        }
    }
}
