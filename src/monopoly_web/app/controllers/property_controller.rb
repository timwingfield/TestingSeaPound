class PropertyController < ApplicationController
  def index
  end

  def list
	@properties = PropertyModel.get_all
  end

  def available
	@properties = PropertyModel.get_available
  end

end
