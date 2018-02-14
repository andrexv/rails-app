require 'test_helper'

class ResourceJobsControllerTest < ActionDispatch::IntegrationTest
  
  test "Should Post Create" do
    post resource_jobs_path, as: :json
    
    assert_send([ResourceJob, :send_mail])
    assert_response :success
  end
end
