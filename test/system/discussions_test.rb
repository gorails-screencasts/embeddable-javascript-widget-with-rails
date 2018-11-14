require "application_system_test_case"

class DiscussionsTest < ApplicationSystemTestCase
  setup do
    @discussion = discussions(:one)
  end

  test "visiting the index" do
    visit discussions_url
    assert_selector "h1", text: "Discussions"
  end

  test "creating a Discussion" do
    visit discussions_url
    click_on "New Discussion"

    fill_in "Comments Count", with: @discussion.comments_count
    fill_in "Title", with: @discussion.title
    fill_in "Url", with: @discussion.url
    click_on "Create Discussion"

    assert_text "Discussion was successfully created"
    click_on "Back"
  end

  test "updating a Discussion" do
    visit discussions_url
    click_on "Edit", match: :first

    fill_in "Comments Count", with: @discussion.comments_count
    fill_in "Title", with: @discussion.title
    fill_in "Url", with: @discussion.url
    click_on "Update Discussion"

    assert_text "Discussion was successfully updated"
    click_on "Back"
  end

  test "destroying a Discussion" do
    visit discussions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discussion was successfully destroyed"
  end
end
