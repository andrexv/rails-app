require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  
  test "Should Post Create" do
    post jobs_path, as: :json
    
    assert_send([EmailJob, :perform_later])
    assert_response :success
  end
end
