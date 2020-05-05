require "application_system_test_case"

class ProspectosTest < ApplicationSystemTestCase
  setup do
    @prospecto = prospectos(:one)
  end

  test "visiting the index" do
    visit prospectos_url
    assert_selector "h1", text: "Prospectos"
  end

  test "creating a Prospecto" do
    visit prospectos_url
    click_on "New Prospecto"

    fill_in "Comment", with: @prospecto.comment
    fill_in "Email", with: @prospecto.email
    fill_in "First name", with: @prospecto.first_name
    fill_in "Last name", with: @prospecto.last_name
    fill_in "Status", with: @prospecto.status
    fill_in "Statuscomment", with: @prospecto.statuscomment
    fill_in "Tel", with: @prospecto.tel
    click_on "Create Prospecto"

    assert_text "Prospecto was successfully created"
    click_on "Back"
  end

  test "updating a Prospecto" do
    visit prospectos_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @prospecto.comment
    fill_in "Email", with: @prospecto.email
    fill_in "First name", with: @prospecto.first_name
    fill_in "Last name", with: @prospecto.last_name
    fill_in "Status", with: @prospecto.status
    fill_in "Statuscomment", with: @prospecto.statuscomment
    fill_in "Tel", with: @prospecto.tel
    click_on "Update Prospecto"

    assert_text "Prospecto was successfully updated"
    click_on "Back"
  end

  test "destroying a Prospecto" do
    visit prospectos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prospecto was successfully destroyed"
  end
end
