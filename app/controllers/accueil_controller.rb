class AccueilController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end
end
