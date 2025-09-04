require "test_helper"

class PrvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = prves(:one)
  end

  test "should get index" do
    get prves_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference("profile.count") do
      post prves_url, params: { profile: { name: @profile.name, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { name: @profile.name, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference("profile.count", -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to prves_url
  end
end
