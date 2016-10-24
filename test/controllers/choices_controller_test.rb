require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get choices_show_url
    assert_response :success
  end

end
