# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  track_type :string           not null
#  lyrics     :text             not null
#  created_at :datetime
#  updated_at :datetime
#


class TracksController < ApplicationController

 def index
	 render :index
 end

 def new
	 render :new
 end

 def create
	 track = Track.new(track_params)
	 if track.save
		 redirect_to track_url(track.id)
	 else
		 flash.now[:errors] = track.errors.full_messages
		 render :new
	 end
 end

 def edit
 end

 def destroy
 end

 def show
	 @track = Track.find_by(id: params[:id])
	 render :show
 end

 private
 def track_params
 	 params.require(:track).permit(:album_id, :name, :lyrics)
 end


end
