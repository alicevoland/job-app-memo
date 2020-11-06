require 'test_helper'

class JobApplicationArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get job_application_archives_update_url
    assert_response :success
  end

end
