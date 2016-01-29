# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class BandsController < ApplicationController

 def index
	 render :index
 end

 def new
	 render :new
 end

 def create
	 band = Band.new(band_params)
	 if band.save
		 redirect_to band_url(band.id)
	 else
		 flash.now[:errors] = band.errors.full_messages
		 render :new
	 end
 end

 def edit
 end

 def destroy
 end

 def show
	 @band = Band.find_by(id: params[:id])
	 render :show
 end

 private
 def band_params
 	 params.require(:band).permit(:name)
 end


end
