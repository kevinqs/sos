package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON;

class AccessoryController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def listAjax() {
		render(template: 'accessoryListBody')
	}

	def jq_accessory_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def amount = params.get("amount");
		def accessories = Accessory.list(params)
		def jsonCells = accessories.collect {
			[cell: [it.id,
					it.partNumber,
					it.partName,
					it.amount,
					it.stockAlert,
					it.stationTool,
					it.applicableCarModel
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		render jsonData as JSON
	}

	def jq_edit_accessory = {
		def accessory = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []

		// determine our action
		switch (params.oper) {
			case 'add':
			// add instruction sent
				accessory = new Accessory(params)
				def amount = params.get("amount");
				accessory.amount = amount;
				if (! accessory.hasErrors() && accessory.save()) {
					message = "Accessory Added"
					id = accessory.id
					state = "OK"
				} else {
					message = "Could Not Add Accessory"
				}

				break;
			case 'del':
			// check customer exists
				id = params.id;
				idList = id.tokenize(",")
				for (accessoryId in idList) {
					accessory = Accessory.get(accessoryId)
					if (accessory) {
						// delete part
						accessory.delete()
						state = "OK"
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				accessory = Accessory.get(params.id)
				if (accessory) {
					// set the properties according to passed in parameters
					accessory.properties = params
					if (!accessory.hasErrors() && accessory.save()) {
						id = accessory.id
						state = "OK"
					} else {
						message = "Could Not Update Accessory"
					}
				}
				break;
		}

		def response = [message:message,state:state,id:id]

		render response as JSON
	}
}
