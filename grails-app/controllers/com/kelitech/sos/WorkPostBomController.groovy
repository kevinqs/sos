package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException

class WorkPostBomController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [workPostBomInstanceList: WorkPostBom.list(params), workPostBomInstanceTotal: WorkPostBom.count()]
    }

    def create() {
        [workPostBomInstance: new WorkPostBom(params)]
    }

    def save() {
        def workPostBomInstance = new WorkPostBom(params)
        if (!workPostBomInstance.save(flush: true)) {
            render(view: "create", model: [workPostBomInstance: workPostBomInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), workPostBomInstance.id])
        redirect(action: "show", id: workPostBomInstance.id)
    }

    def show(Long id) {
        def workPostBomInstance = WorkPostBom.get(id)
        if (!workPostBomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "list")
            return
        }

        [workPostBomInstance: workPostBomInstance]
    }

    def edit(Long id) {
        def workPostBomInstance = WorkPostBom.get(id)
        if (!workPostBomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "list")
            return
        }

        [workPostBomInstance: workPostBomInstance]
    }

    def update(Long id, Long version) {
        def workPostBomInstance = WorkPostBom.get(id)
        if (!workPostBomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (workPostBomInstance.version > version) {
                workPostBomInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workPostBom.label', default: 'WorkPostBom')] as Object[],
                          "Another user has updated this WorkPostBom while you were editing")
                render(view: "edit", model: [workPostBomInstance: workPostBomInstance])
                return
            }
        }

        workPostBomInstance.properties = params

        if (!workPostBomInstance.save(flush: true)) {
            render(view: "edit", model: [workPostBomInstance: workPostBomInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), workPostBomInstance.id])
        redirect(action: "show", id: workPostBomInstance.id)
    }

    def delete(Long id) {
        def workPostBomInstance = WorkPostBom.get(id)
        if (!workPostBomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "list")
            return
        }

        try {
            workPostBomInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workPostBom.label', default: 'WorkPostBom'), id])
            redirect(action: "show", id: id)
        }
    }
}
