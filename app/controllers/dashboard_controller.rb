class DashboardController < ApplicationController
  include Secured

  def show
    @friends = User.all
  end
end
