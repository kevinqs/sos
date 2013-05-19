package com.kelitech.sos

import grails.converters.JSON;


class WorkPostBomController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	public static final String WORK_POST_BOM_INSTANCE = "workPostBomInstance"
	
	def listAjax() {
		render(template: 'listBody')
	}
	
	def workPostBomDetails () {
		def wpbId = params.wpbId
		def id = params.id
		def author = params.author
		def workPostBoms = new WorkPostBom();
		workPostBoms.author = "Kevin Qiu"
		if (wpbId != "new") {
			workPostBoms = WorkPostBom.get(wpbId)
		}
		
		session[WORK_POST_BOM_INSTANCE] = workPostBoms
		render(view: "details", model: [workPostBomInstance : workPostBoms])
	}

	def jq_bom_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def workpostBoms = WorkPostBom.list(params)
		def jsonCells = workpostBoms.collect {
			[cell: [it.id,
					it.workPostName,
					it.workSection,
					it.workPost,
					it.serialNumber,
					it.author,
					it.auditor,
					it.approver,
					it.effectiveDate
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		render jsonData as JSON
	}

	def jq_edit_workPostBom = {
		def bom = null
		def message = ""
		def state = "FAIL"
		def id = params.id
		def idList = []
		def isEmpty = false
		if (id) {
			isEmpty = true
		}

		// determine our action
		switch (params.oper) {
			case 'add':
				bom = new WorkPostBom(params)
				if (! bom.hasErrors() && bom.save()) {
					message = "Part Added"
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
					bom = WorkPostBom.get(partId)
					if (bom) {
						// delete part
						bom.delete()
						state = "OK"
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				bom = WorkPostBom.get(params.id)
				if (bom) {
					// set the properties according to passed in parameters
					bom.properties = params
					if (! bom.hasErrors() && bom.save()) {
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
