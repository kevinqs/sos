package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException

class WorkPostPartController {

	static navigation = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [workPostPartInstanceList: WorkPostPart.list(params), workPostPartInstanceTotal: WorkPostPart.count()]
    }

    def create() {
        [workPostPartInstance: new WorkPostPart(params)]
    }

    def save() {
        def workPostPartInstance = new WorkPostPart(params)
        if (!workPostPartInstance.save(flush: true)) {
            render(view: "create", model: [workPostPartInstance: workPostPartInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), workPostPartInstance.id])
        redirect(action: "show", id: workPostPartInstance.id)
    }

    def show(Long id) {
        def workPostPartInstance = WorkPostPart.get(id)
        if (!workPostPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "list")
            return
        }

        [workPostPartInstance: workPostPartInstance]
    }

    def edit(Long id) {
        def workPostPartInstance = WorkPostPart.get(id)
        if (!workPostPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "list")
            return
        }

        [workPostPartInstance: workPostPartInstance]
    }

    def update(Long id, Long version) {
        def workPostPartInstance = WorkPostPart.get(id)
        if (!workPostPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (workPostPartInstance.version > version) {
                workPostPartInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workPostPart.label', default: 'WorkPostPart')] as Object[],
                          "Another user has updated this WorkPostPart while you were editing")
                render(view: "edit", model: [workPostPartInstance: workPostPartInstance])
                return
            }
        }

        workPostPartInstance.properties = params

        if (!workPostPartInstance.save(flush: true)) {
            render(view: "edit", model: [workPostPartInstance: workPostPartInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), workPostPartInstance.id])
        redirect(action: "show", id: workPostPartInstance.id)
    }

    def delete(Long id) {
        def workPostPartInstance = WorkPostPart.get(id)
        if (!workPostPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "list")
            return
        }

        try {
            workPostPartInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workPostPart.label', default: 'WorkPostPart'), id])
            redirect(action: "show", id: id)
        }
    }
}
