require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Banos", with: @property.banos
    fill_in "Colonia", with: @property.colonia
    fill_in "Id", with: @property.id
    fill_in "Mconst", with: @property.mConst
    fill_in "Mterreno", with: @property.mTerreno
    fill_in "Precio", with: @property.precio
    fill_in "Recamaras", with: @property.recamaras
    fill_in "Zona", with: @property.zona
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Banos", with: @property.banos
    fill_in "Colonia", with: @property.colonia
    fill_in "Id", with: @property.id
    fill_in "Mconst", with: @property.mConst
    fill_in "Mterreno", with: @property.mTerreno
    fill_in "Precio", with: @property.precio
    fill_in "Recamaras", with: @property.recamaras
    fill_in "Zona", with: @property.zona
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
