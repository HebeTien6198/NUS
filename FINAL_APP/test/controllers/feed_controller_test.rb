require 'test_helper'

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get feed_feed_url
    assert_response :success
  end

end
