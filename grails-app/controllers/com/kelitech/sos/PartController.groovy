package com.kelitech.sos

import grails.converters.JSON

import org.json.XML
import groovy.xml.XmlUtil


class PartController {


	static navigation = [
		title:'Part',
		action:'list'
	]
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def xml = new XmlSlurper().parse(new File("src/config/navigation.xml"))
		def xmlStr = XmlUtil.serialize(xml)
		def json = XML.toJSONObject(XmlUtil.serialize(xml))
		def navTree = json.getJSONObject("navigationtree").get("children")

		[partInstanceList: Part.list(params),
							partInstanceTotal: Part.count(),
							selectedMenu: "parts",
							navigationTree: navTree,
							pageTemplate: "/part/partListBody"]
	}

	def listAjax() {
		render(template: 'partListBody')
	}

	def jq_part_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def parts = Part.list(params)
		def jsonCells = parts.collect {
			[cell: [it.partNumber,
					it.partDescription,
					it.colorCode,
					it.applicableCarModel,
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		JSON json = jsonData as JSON;
		render jsonData as JSON
	}


	def save() {
		def partInstance = new Part(params)
		if (!partInstance.save(flush: true)) {
			render(view: "create", model: [partInstance: partInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'part.label', default: 'Part'), partInstance.id])
		redirect(action: "show", id: partInstance.id)
	}

	def jq_edit_part = {
		def part = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []

		// determine our action
		switch (params.oper) {
			case 'add':
			// add instruction sent
				part = new Part(params)
				if (! part.hasErrors() && part.save()) {
					message = "Part  ${part.partNumber} Added"
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
					part = Part.get(partId)
					if (part) {
						try {
							// delete part
							part.delete(flush:true)
							message = "Part ${part.partNumber} Deleted"
							state = "OK"
						} catch (Exception sqle) {
							message = "Cannot delete part:${part.partNumber},  it's in use"
							state = "Error"
						}
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				part = Part.get(params.id)
				if (part) {
					// set the properties according to passed in parameters
					part.properties = params
					if (! part.hasErrors() && part.save()) {
						message = "Part ${part.partNumber} Updated"
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
