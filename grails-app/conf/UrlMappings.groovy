class UrlMappings {

	static mappings = {
		"/workPostMaterialList/materialList"(view:"/workPostMaterialList/materialList")
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
