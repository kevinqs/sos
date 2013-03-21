package com.kelitech.sos

class WorkPostBom {
	String author
	String auditor
	String approval
	Date effectiveDate;
	static hasMany = [mainParts:WorkPostPart]
	
    static constraints = {
    }
}
