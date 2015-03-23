require 'test_helper'

class LivreursControllerTest < ActionController::TestCase
  setup do
    @livreur = livreurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:livreurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create livreur" do
    assert_difference('Livreur.count') do
      post :create, livreur: { nom: @livreur.nom, prenom: @livreur.prenom }
    end

    assert_redirected_to livreur_path(assigns(:livreur))
  end

  test "should show livreur" do
    get :show, id: @livreur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @livreur
    assert_response :success
  end

  test "should update livreur" do
    patch :update, id: @livreur, livreur: { nom: @livreur.nom, prenom: @livreur.prenom }
    assert_redirected_to livreur_path(assigns(:livreur))
  end

  test "should destroy livreur" do
    assert_difference('Livreur.count', -1) do
      delete :destroy, id: @livreur
    end

    assert_redirected_to livreurs_path
  end
end
