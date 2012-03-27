package com.gworks

class MessageOutController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [messageOutInstanceList: MessageOut.list(params), messageOutInstanceTotal: MessageOut.count()]
    }

    def create = {
        def messageOutInstance = new MessageOut()
        messageOutInstance.properties = params
        return [messageOutInstance: messageOutInstance]
    }

    def save = {
        def messageOutInstance = new MessageOut(params)
        if (messageOutInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), messageOutInstance.id])}"
            redirect(action: "show", id: messageOutInstance.id)
        }
        else {
            render(view: "create", model: [messageOutInstance: messageOutInstance])
        }
    }

    def show = {
        def messageOutInstance = MessageOut.get(params.id)
        if (!messageOutInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
            redirect(action: "list")
        }
        else {
            [messageOutInstance: messageOutInstance]
        }
    }

    def edit = {
        def messageOutInstance = MessageOut.get(params.id)
        if (!messageOutInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [messageOutInstance: messageOutInstance]
        }
    }

    def update = {
        def messageOutInstance = MessageOut.get(params.id)
        if (messageOutInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (messageOutInstance.version > version) {
                    
                    messageOutInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'messageOut.label', default: 'MessageOut')] as Object[], "Another user has updated this MessageOut while you were editing")
                    render(view: "edit", model: [messageOutInstance: messageOutInstance])
                    return
                }
            }
            messageOutInstance.properties = params
            if (!messageOutInstance.hasErrors() && messageOutInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), messageOutInstance.id])}"
                redirect(action: "show", id: messageOutInstance.id)
            }
            else {
                render(view: "edit", model: [messageOutInstance: messageOutInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def messageOutInstance = MessageOut.get(params.id)
        if (messageOutInstance) {
            try {
                messageOutInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'messageOut.label', default: 'MessageOut'), params.id])}"
            redirect(action: "list")
        }
    }
}
