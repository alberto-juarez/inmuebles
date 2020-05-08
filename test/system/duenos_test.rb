require "application_system_test_case"

class DuenosTest < ApplicationSystemTestCase
  setup do
    @dueno = duenos(:one)
  end

  test "visiting the index" do
    visit duenos_url
    assert_selector "h1", text: "Duenos"
  end

  test "creating a Dueno" do
    visit duenos_url
    click_on "New Dueno"

    fill_in "Cel", with: @dueno.cel
    fill_in "Comments", with: @dueno.comments
    fill_in "Email", with: @dueno.email
    fill_in "First name", with: @dueno.first_name
    fill_in "Last name", with: @dueno.last_name
    fill_in "Property", with: @dueno.property_id
    fill_in "Tel", with: @dueno.tel
    click_on "Create Dueno"

    assert_text "Dueno was successfully created"
    click_on "Back"
  end

  test "updating a Dueno" do
    visit duenos_url
    click_on "Edit", match: :first

    fill_in "Cel", with: @dueno.cel
    fill_in "Comments", with: @dueno.comments
    fill_in "Email", with: @dueno.email
    fill_in "First name", with: @dueno.first_name
    fill_in "Last name", with: @dueno.last_name
    fill_in "Property", with: @dueno.property_id
    fill_in "Tel", with: @dueno.tel
    click_on "Update Dueno"

    assert_text "Dueno was successfully updated"
    click_on "Back"
  end

  test "destroying a Dueno" do
    visit duenos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dueno was successfully destroyed"
  end
end
