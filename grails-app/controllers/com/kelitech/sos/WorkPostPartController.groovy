package com.kelitech.sos

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class WorkPostPartController {

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
	
	def listAjax() {
		render(template: 'listBody')
	}
	
	def jq_part_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def workpostParts = WorkPostPart.list(params)
		def jsonCells = workpostParts.collect {
			  [cell: [it.part.id,
				  	  it.id,
					  it.part.partNumber,
					  it.part.colorCode,
					  it.part.partDescription,
					  it.amount,
					  it.stationTool,
					  it.stockAlert,
					  it.part.applicableCarModel					  
				  ], id: it.id]
		  }
		  def jsonData= [rows: jsonCells]
		  render jsonData as JSON
	}
	
	def part_list_as_options = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def parts = Part.list(params)
		def jsonCells = parts.collect {
			  [id: it.id,
			   partNumber:it.partNumber,
			   partDescription:it.partDescription
			  ]
		  }
		  def jsonData= [rows: jsonCells]
		  render jsonCells as JSON
	}

	def jq_edit_workPostpart = {
		def part = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []
  
		// determine our action
		switch (params.oper) {
		  case 'add':
			// add instruction sent
		    def partId = params.get("part.id");
			part = new WorkPostPart(params)
			if (! part.hasErrors() && part.save()) {
			  message = "PartAdded"
			  id = part.id
			  state = "OK"
			} else {
			  message = "Could Not Save Part"
			}
  
			break;
		  case 'del':
			// check customer exists
			id = params.id;
			idList = id.tokenize(",")
			for (partId in idList) {
				part = WorkPostPart.get(partId)
				if (part) {
				  // delete part
				  part.delete()
				  state = "OK"
				}
			}
			break;
		  default:
			// default edit action
			// first retrieve the part by its ID
			part = WorkPostPart.get(params.id)
			if (part) {
			  // set the properties according to passed in parameters
			  part.properties = params
			  if (! part.hasErrors() && part.save()) {
				id = part.id
				state = "OK"
			  } else {
				message = "Could Not Update Part"
			  }
			}
			break;
		}
  
		def response = [message:message,state:state,id:id]
  
		render response as JSON
	  }
  

}
