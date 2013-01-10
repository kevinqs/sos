package com.kelitech.sos

import org.springframework.dao.DataIntegrityViolationException
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
		
        [partInstanceList: Part.list(params), partInstanceTotal: Part.count(), selectedMenu: "parts", navigationTree: navTree]
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
		  render jsonData as JSON
	}
  

    def create() {
        [partInstance: new Part(params)]
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

    def show(Long id) {
        def partInstance = Part.get(id)
        if (!partInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "list")
            return
        }

        [partInstance: partInstance]
    }

    def edit(Long id) {
        def partInstance = Part.get(id)
        if (!partInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "list")
            return
        }

        [partInstance: partInstance]
    }

    def update(Long id, Long version) {
        def partInstance = Part.get(id)
        if (!partInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (partInstance.version > version) {
                partInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'part.label', default: 'Part')] as Object[],
                          "Another user has updated this Part while you were editing")
                render(view: "edit", model: [partInstance: partInstance])
                return
            }
        }

        partInstance.properties = params

        if (!partInstance.save(flush: true)) {
            render(view: "edit", model: [partInstance: partInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'part.label', default: 'Part'), partInstance.id])
        redirect(action: "show", id: partInstance.id)
    }

    def delete(Long id) {
        def partInstance = Part.get(id)
        if (!partInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "list")
            return
        }

        try {
            partInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'part.label', default: 'Part'), id])
            redirect(action: "show", id: id)
        }
    }
	
	// return JSON list of customers
	def jq_customer_list = {
	  def sortIndex = params.sidx ?: 'partNumber'
	  def sortOrder  = params.sord ?: 'asc'

	  def maxRows = Integer.valueOf(params.rows)
	  def currentPage = Integer.valueOf(params.page) ?: 1
	  def rowOffset = currentPage == 1 ? 0 : (currentPage - 1) * maxRows

	  def parts = Part.createCriteria().list(max:maxRows, offset:rowOffset) {

			// first name case insensitive where the field begins with the search term
			if (params.partNumber)
				ilike('partNumber',params.partNumber + '%')

			// last name case insensitive where the field begins with the search term
			if (params.partDescription)
				ilike('partDescription',params.partDescription + '%')

			// age search where the age Equals the search term
			if (params.colorCode)
				eq('age', Integer.valueOf(params.colorCode))

		
			// set the order and direction
			order(sortIndex, sortOrder).ignoreCase()
	  }

	  def totalRows = parts.totalCount
	  def numberOfPages = Math.ceil(totalRows / maxRows)

	  def jsonCells = parts.collect {
			[cell: [it.firstName,
					it.lastName,
					it.age,
					it.emailAddress
				], id: it.id]
		}
		def jsonData= [rows: jsonCells,page:currentPage,records:totalRows,total:numberOfPages]
		render jsonData as JSON
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
				// delete part
				part.delete()
				message = "Part ${part.partNumber} Deleted"
				state = "OK"
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
