require 'test_helper'

class GestionControllerTest < ActionController::TestCase
  test "should get exporter" do
    get :exporter
    assert_response :success
  end

end
