class AccueilController < ApplicationController
  include AccueilHelper

  def index
    @restaurant = Restaurant.all
  end

end
