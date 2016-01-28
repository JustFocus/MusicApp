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

class Track < ActiveRecord::Base
	validates :album_id, presence: true, uniqueness: true
	validates :name, presence: true
	validates :track_type, presence: true
	validates :lyrics, presence: true

	belongs_to 'album'
	dependent: :destroy

end
