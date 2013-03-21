package com.kelitech.sos



import org.junit.*
import grails.test.mixin.*

@TestFor(WorkPostBomController)
@Mock(WorkPostBom)
class WorkPostBomControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/workPostBom/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.workPostBomInstanceList.size() == 0
        assert model.workPostBomInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.workPostBomInstance != null
    }

    void testSave() {
        controller.save()

        assert model.workPostBomInstance != null
        assert view == '/workPostBom/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/workPostBom/show/1'
        assert controller.flash.message != null
        assert WorkPostBom.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/workPostBom/list'

        populateValidParams(params)
        def workPostBom = new WorkPostBom(params)

        assert workPostBom.save() != null

        params.id = workPostBom.id

        def model = controller.show()

        assert model.workPostBomInstance == workPostBom
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/workPostBom/list'

        populateValidParams(params)
        def workPostBom = new WorkPostBom(params)

        assert workPostBom.save() != null

        params.id = workPostBom.id

        def model = controller.edit()

        assert model.workPostBomInstance == workPostBom
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/workPostBom/list'

        response.reset()

        populateValidParams(params)
        def workPostBom = new WorkPostBom(params)

        assert workPostBom.save() != null

        // test invalid parameters in update
        params.id = workPostBom.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/workPostBom/edit"
        assert model.workPostBomInstance != null

        workPostBom.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/workPostBom/show/$workPostBom.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        workPostBom.clearErrors()

        populateValidParams(params)
        params.id = workPostBom.id
        params.version = -1
        controller.update()

        assert view == "/workPostBom/edit"
        assert model.workPostBomInstance != null
        assert model.workPostBomInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/workPostBom/list'

        response.reset()

        populateValidParams(params)
        def workPostBom = new WorkPostBom(params)

        assert workPostBom.save() != null
        assert WorkPostBom.count() == 1

        params.id = workPostBom.id

        controller.delete()

        assert WorkPostBom.count() == 0
        assert WorkPostBom.get(workPostBom.id) == null
        assert response.redirectedUrl == '/workPostBom/list'
    }
}
