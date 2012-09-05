require 'test_helper'

class ChartControllerTest < ActionController::TestCase
  test "should get chart" do
    get :chart
    assert_response :success
  end

end
