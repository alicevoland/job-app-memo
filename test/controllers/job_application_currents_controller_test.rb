require 'test_helper'

class JobApplicationCurrentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get job_application_currents_create_url
    assert_response :success
  end

end
