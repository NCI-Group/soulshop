require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get checkout_checkout_url
    assert_response :success
  end

end
