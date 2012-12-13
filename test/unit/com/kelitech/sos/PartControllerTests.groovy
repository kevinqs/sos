package com.kelitech.sos



import org.junit.*
import grails.test.mixin.*

@TestFor(PartController)
@Mock(Part)
class PartControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/part/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.partInstanceList.size() == 0
        assert model.partInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.partInstance != null
    }

    void testSave() {
        controller.save()

        assert model.partInstance != null
        assert view == '/part/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/part/show/1'
        assert controller.flash.message != null
        assert Part.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/part/list'

        populateValidParams(params)
        def part = new Part(params)

        assert part.save() != null

        params.id = part.id

        def model = controller.show()

        assert model.partInstance == part
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/part/list'

        populateValidParams(params)
        def part = new Part(params)

        assert part.save() != null

        params.id = part.id

        def model = controller.edit()

        assert model.partInstance == part
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/part/list'

        response.reset()

        populateValidParams(params)
        def part = new Part(params)

        assert part.save() != null

        // test invalid parameters in update
        params.id = part.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/part/edit"
        assert model.partInstance != null

        part.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/part/show/$part.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        part.clearErrors()

        populateValidParams(params)
        params.id = part.id
        params.version = -1
        controller.update()

        assert view == "/part/edit"
        assert model.partInstance != null
        assert model.partInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/part/list'

        response.reset()

        populateValidParams(params)
        def part = new Part(params)

        assert part.save() != null
        assert Part.count() == 1

        params.id = part.id

        controller.delete()

        assert Part.count() == 0
        assert Part.get(part.id) == null
        assert response.redirectedUrl == '/part/list'
    }
}
