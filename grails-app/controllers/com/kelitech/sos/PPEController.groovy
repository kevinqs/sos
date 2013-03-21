package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.JSON;

class PPEController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def listAjax() {
		render(template: 'fixtureListBody')
	}

	def jq_PPE_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def ppes = PPE.list(params)
		def jsonCells = ppes.collect {
			[cell: [it.id,
					it.name,
					it.consumption
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		render jsonData as JSON
	}

	def jq_edit_PPE = {
		def ppe = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []

		// determine our action
		switch (params.oper) {
			case 'add':
			// add instruction sent
				ppe = new PPE(params)
				if (! ppe.hasErrors() && ppe.save()) {
					message = "PPE Added"
					id = ppe.id
					state = "OK"
				} else {
					message = "Could Not Add PPE"
				}

				break;
			case 'del':
			// check customer exists
				id = params.id;
				idList = id.tokenize(",")
				for (ppeId in idList) {
					ppe = PPE.get(ppeId)
					if (ppe) {
						// delete fixture
						ppe.delete()
						state = "OK"
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				ppe = PPE.get(params.id)
				if (ppe) {
					// set the properties according to passed in parameters
					ppe.properties = params
					if (!ppe.hasErrors() && ppe.save()) {
						id = ppe.id
						state = "OK"
					} else {
						message = "Could Not Update PPE"
					}
				}
				break;
		}

		def response = [message:message,state:state,id:id]

		render response as JSON
	}
}
