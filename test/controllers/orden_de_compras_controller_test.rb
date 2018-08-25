require 'test_helper'

class OrdenDeComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_de_compra = orden_de_compras(:one)
  end

  test "should get index" do
    get orden_de_compras_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_de_compra_url
    assert_response :success
  end

  test "should create orden_de_compra" do
    assert_difference('OrdenDeCompra.count') do
      post orden_de_compras_url, params: { orden_de_compra: { cantidad: @orden_de_compra.cantidad, id_material: @orden_de_compra.id_material } }
    end

    assert_redirected_to orden_de_compra_url(OrdenDeCompra.last)
  end

  test "should show orden_de_compra" do
    get orden_de_compra_url(@orden_de_compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_de_compra_url(@orden_de_compra)
    assert_response :success
  end

  test "should update orden_de_compra" do
    patch orden_de_compra_url(@orden_de_compra), params: { orden_de_compra: { cantidad: @orden_de_compra.cantidad, id_material: @orden_de_compra.id_material } }
    assert_redirected_to orden_de_compra_url(@orden_de_compra)
  end

  test "should destroy orden_de_compra" do
    assert_difference('OrdenDeCompra.count', -1) do
      delete orden_de_compra_url(@orden_de_compra)
    end

    assert_redirected_to orden_de_compras_url
  end
end
