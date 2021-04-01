require 'test_helper'

class MegalithsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @megalith = megaliths(:one)
  end

  test "should get index" do
    get megaliths_url
    assert_response :success
  end

  test "should get new" do
    get new_megalith_url
    assert_response :success
  end

  test "should create megalith" do
    assert_difference('Megalith.count') do
      post megaliths_url, params: { megalith: { address: @megalith.address, category: @megalith.category, city: @megalith.city, description: @megalith.description, latitude: @megalith.latitude, longitude: @megalith.longitude, name: @megalith.name } }
    end

    assert_redirected_to megalith_url(Megalith.last)
  end

  test "should show megalith" do
    get megalith_url(@megalith)
    assert_response :success
  end

  test "should get edit" do
    get edit_megalith_url(@megalith)
    assert_response :success
  end

  test "should update megalith" do
    patch megalith_url(@megalith), params: { megalith: { address: @megalith.address, category: @megalith.category, city: @megalith.city, description: @megalith.description, latitude: @megalith.latitude, longitude: @megalith.longitude, name: @megalith.name } }
    assert_redirected_to megalith_url(@megalith)
  end

  test "should destroy megalith" do
    assert_difference('Megalith.count', -1) do
      delete megalith_url(@megalith)
    end

    assert_redirected_to megaliths_url
  end
end
