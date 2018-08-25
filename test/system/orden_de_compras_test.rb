require "application_system_test_case"

class OrdenDeComprasTest < ApplicationSystemTestCase
  setup do
    @orden_de_compra = orden_de_compras(:one)
  end

  test "visiting the index" do
    visit orden_de_compras_url
    assert_selector "h1", text: "Orden De Compras"
  end

  test "creating a Orden de compra" do
    visit orden_de_compras_url
    click_on "New Orden De Compra"

    fill_in "Cantidad", with: @orden_de_compra.cantidad
    fill_in "Id Material", with: @orden_de_compra.id_material
    click_on "Create Orden de compra"

    assert_text "Orden de compra was successfully created"
    click_on "Back"
  end

  test "updating a Orden de compra" do
    visit orden_de_compras_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @orden_de_compra.cantidad
    fill_in "Id Material", with: @orden_de_compra.id_material
    click_on "Update Orden de compra"

    assert_text "Orden de compra was successfully updated"
    click_on "Back"
  end

  test "destroying a Orden de compra" do
    visit orden_de_compras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orden de compra was successfully destroyed"
  end
end
