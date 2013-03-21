package com.kelitech.sos



import org.junit.*
import grails.test.mixin.*

@TestFor(PPEController)
@Mock(PPE)
class PPEControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/PPE/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.PPEInstanceList.size() == 0
        assert model.PPEInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.PPEInstance != null
    }

    void testSave() {
        controller.save()

        assert model.PPEInstance != null
        assert view == '/PPE/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/PPE/show/1'
        assert controller.flash.message != null
        assert PPE.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/PPE/list'

        populateValidParams(params)
        def PPE = new PPE(params)

        assert PPE.save() != null

        params.id = PPE.id

        def model = controller.show()

        assert model.PPEInstance == PPE
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/PPE/list'

        populateValidParams(params)
        def PPE = new PPE(params)

        assert PPE.save() != null

        params.id = PPE.id

        def model = controller.edit()

        assert model.PPEInstance == PPE
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/PPE/list'

        response.reset()

        populateValidParams(params)
        def PPE = new PPE(params)

        assert PPE.save() != null

        // test invalid parameters in update
        params.id = PPE.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/PPE/edit"
        assert model.PPEInstance != null

        PPE.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/PPE/show/$PPE.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        PPE.clearErrors()

        populateValidParams(params)
        params.id = PPE.id
        params.version = -1
        controller.update()

        assert view == "/PPE/edit"
        assert model.PPEInstance != null
        assert model.PPEInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/PPE/list'

        response.reset()

        populateValidParams(params)
        def PPE = new PPE(params)

        assert PPE.save() != null
        assert PPE.count() == 1

        params.id = PPE.id

        controller.delete()

        assert PPE.count() == 0
        assert PPE.get(PPE.id) == null
        assert response.redirectedUrl == '/PPE/list'
    }
}
