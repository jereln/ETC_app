class AngularController < ApplicationController
	before_filter :not_logged_in!

  def show
  end
end