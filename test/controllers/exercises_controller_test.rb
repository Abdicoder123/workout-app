require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get exercises_search_url
    assert_response :success
  end
end
