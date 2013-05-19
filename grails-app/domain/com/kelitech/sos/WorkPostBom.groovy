package com.kelitech.sos

class WorkPostBom {
	String serialNumber
	String workPostName
	String workSection
	String workPost
	String author
	String auditor
	String approver
	Date effectiveDate;
	
	static hasMany = [mainParts:WorkPostPart, accessories: Accessory, fixtures: Fixture, tools: Tool, ppes: PPE]
	
    static constraints = {
    }
}
