require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "should get vote" do
    get votes_vote_url
    assert_response :success
  end

end
