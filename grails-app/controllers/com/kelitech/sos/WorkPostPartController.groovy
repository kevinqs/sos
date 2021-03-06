package com.kelitech.sos

import grails.converters.JSON;


class WorkPostPartController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
