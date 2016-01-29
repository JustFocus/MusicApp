# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  album_type :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class AlbumsController < ApplicationController

 def index
	 render :index
 end

 def new
	 render :new
 end

 def create
	 album = Album.new(album_params)
	 if album.save
		 redirect_to album_url(album.id)
	 else
		 flash.now[:errors] = album.errors.full_messages
		 render :new
	 end
 end

 def edit
 end

 def destroy
 end

 def show
	 @album = Album.find_by(id: params[:id])
	 render :show
 end

 private
 def album_params
 	 params.require(:album).permit(:band_id, :name, :album_type)
 end


end
