class EggsController < ApplicationController
  def get_by_address

  	if params[:address].blank?
  		raise ActiveRecord::RecordNotFound, "Address not found."
  	end

  	# TODO: CONTRACT INTEGRATION
  	mock_eggs_by_address = {
  		1 => 132,
  		2 => 423,
  		0 => 1333
  	}

  	render json: mock_eggs_by_address

  end
end
