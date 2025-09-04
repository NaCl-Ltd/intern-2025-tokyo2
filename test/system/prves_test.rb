require "application_system_test_case"

class PrvesTest < ApplicationSystemTestCase
  setup do
    @profile = prves(:one)
  end

  test "visiting the index" do
    visit prves_url
    assert_selector "h1", text: "Prves"
  end

  test "should create profile" do
    visit prves_url
    click_on "New profile"

    fill_in "Name", with: @profile.name
    fill_in "User", with: @profile.user_id
    click_on "Create profile"

    assert_text "profile was successfully created"
    click_on "Back"
  end

  test "should update profile" do
    visit profile_url(@profile)
    click_on "Edit this profile", match: :first

    fill_in "Name", with: @profile.name
    fill_in "User", with: @profile.user_id
    click_on "Update profile"

    assert_text "profile was successfully updated"
    click_on "Back"
  end

  test "should destroy profile" do
    visit profile_url(@profile)
    click_on "Destroy this profile", match: :first

    assert_text "profile was successfully destroyed"
  end
end
