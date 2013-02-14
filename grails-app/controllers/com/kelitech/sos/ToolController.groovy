package com.kelitech.sos

import grails.converters.JSON;

class ToolController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def listAjax() {
		render(template: 'toolListBody')
	}

	def jq_tool_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def tools = Tool.list(params)
		def jsonCells = tools.collect {
			[cell: [it.id,
					it.sku,
					it.name,
					it.model,
					it.parameter,
					it.consumption
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		render jsonData as JSON
	}

	def jq_edit_tool = {
		def tool = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []

		// determine our action
		switch (params.oper) {
			case 'add':
			// add instruction sent
				tool = new Tool(params)
				if (! tool.hasErrors() && tool.save()) {
					message = "Tool Added"
					id = tool.id
					state = "OK"
				} else {
					message = "Could Not Add Tool"
				}

				break;
			case 'del':
			// check customer exists
				id = params.id;
				idList = id.tokenize(",")
				for (toolId in idList) {
					tool = Tool.get(toolId)
					if (tool) {
						// delete part
						tool.delete()
						state = "OK"
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				tool = Tool.get(params.id)
				if (tool) {
					// set the properties according to passed in parameters
					tool.properties = params
					if (!tool.hasErrors() && tool.save()) {
						id = tool.id
						state = "OK"
					} else {
						message = "Could Not Update Tool"
					}
				}
				break;
		}

		def response = [message:message,state:state,id:id]

		render response as JSON
	}
}
