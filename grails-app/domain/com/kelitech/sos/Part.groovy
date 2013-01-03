package com.kelitech.sos

class Part {

	String partNumber
	String partDescription
	String colorCode
	String applicableCarModel
 	
    static constraints = {
    }
	
	static enum Type {
		DIRECT,INDIRECT
	}

}
