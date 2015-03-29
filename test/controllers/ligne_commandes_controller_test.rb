require 'test_helper'

class LigneCommandesControllerTest < ActionController::TestCase
  setup do
    @ligne_commande = ligne_commandes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ligne_commandes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ligne_commande" do
    assert_difference('LigneCommande.count') do
      post :create, ligne_commande: {  }
    end

    assert_redirected_to ligne_commande_path(assigns(:ligne_commande))
  end

  test "should show ligne_commande" do
    get :show, id: @ligne_commande
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ligne_commande
    assert_response :success
  end

  test "should update ligne_commande" do
    patch :update, id: @ligne_commande, ligne_commande: {  }
    assert_redirected_to ligne_commande_path(assigns(:ligne_commande))
  end

  test "should destroy ligne_commande" do
    assert_difference('LigneCommande.count', -1) do
      delete :destroy, id: @ligne_commande
    end

    assert_redirected_to ligne_commandes_path
  end
end
