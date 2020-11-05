require 'test_helper'

class JobInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get job_informations_new_url
    assert_response :success
  end

  test "should get create" do
    get job_informations_create_url
    assert_response :success
  end

  test "should get edit" do
    get job_informations_edit_url
    assert_response :success
  end

  test "should get update" do
    get job_informations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get job_informations_destroy_url
    assert_response :success
  end

end
