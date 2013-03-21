package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON;

class FixtureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def listAjax() {
		render(template: 'fixtureListBody')
	}

	def jq_fixture_list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def fixtures = Fixture.list(params)
		def jsonCells = fixtures.collect {
			[cell: [it.id,
					it.name,
					it.model,
					it.application
				], id: it.id]
		}
		def jsonData= [rows: jsonCells]
		render jsonData as JSON
	}

	def jq_edit_fixture = {
		def fixture = null
		def message = ""
		def state = "FAIL"
		def id
		def idList = []

		// determine our action
		switch (params.oper) {
			case 'add':
			// add instruction sent
				fixture = new Fixture(params)
				if (! fixture.hasErrors() && fixture.save()) {
					message = "Fixture Added"
					id = fixture.id
					state = "OK"
				} else {
					message = "Could Not Add Fixture"
				}

				break;
			case 'del':
			// check customer exists
				id = params.id;
				idList = id.tokenize(",")
				for (fixtureId in idList) {
					fixture = Fixture.get(fixtureId)
					if (fixture) {
						// delete fixture
						fixture.delete()
						state = "OK"
					}
				}
				break;
			default:
			// default edit action
			// first retrieve the part by its ID
				fixture = Fixture.get(params.id)
				if (fixture) {
					// set the properties according to passed in parameters
					fixture.properties = params
					if (!fixture.hasErrors() && fixture.save()) {
						id = fixture.id
						state = "OK"
					} else {
						message = "Could Not Update Fixture"
					}
				}
				break;
		}

		def response = [message:message,state:state,id:id]

		render response as JSON
	}
}
