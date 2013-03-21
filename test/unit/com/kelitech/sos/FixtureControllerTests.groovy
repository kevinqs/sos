package com.kelitech.sos



import org.junit.*
import grails.test.mixin.*

@TestFor(FixtureController)
@Mock(Fixture)
class FixtureControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fixture/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fixtureInstanceList.size() == 0
        assert model.fixtureInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fixtureInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fixtureInstance != null
        assert view == '/fixture/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fixture/show/1'
        assert controller.flash.message != null
        assert Fixture.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fixture/list'

        populateValidParams(params)
        def fixture = new Fixture(params)

        assert fixture.save() != null

        params.id = fixture.id

        def model = controller.show()

        assert model.fixtureInstance == fixture
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fixture/list'

        populateValidParams(params)
        def fixture = new Fixture(params)

        assert fixture.save() != null

        params.id = fixture.id

        def model = controller.edit()

        assert model.fixtureInstance == fixture
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fixture/list'

        response.reset()

        populateValidParams(params)
        def fixture = new Fixture(params)

        assert fixture.save() != null

        // test invalid parameters in update
        params.id = fixture.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fixture/edit"
        assert model.fixtureInstance != null

        fixture.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fixture/show/$fixture.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fixture.clearErrors()

        populateValidParams(params)
        params.id = fixture.id
        params.version = -1
        controller.update()

        assert view == "/fixture/edit"
        assert model.fixtureInstance != null
        assert model.fixtureInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fixture/list'

        response.reset()

        populateValidParams(params)
        def fixture = new Fixture(params)

        assert fixture.save() != null
        assert Fixture.count() == 1

        params.id = fixture.id

        controller.delete()

        assert Fixture.count() == 0
        assert Fixture.get(fixture.id) == null
        assert response.redirectedUrl == '/fixture/list'
    }
}
