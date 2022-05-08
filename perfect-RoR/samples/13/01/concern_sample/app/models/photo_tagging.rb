# == Schema Information
#
# Table name: photo_taggings
#
#  id         :bigint           not null, primary key
#  photo_id   :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_photo_taggings_on_photo_id             (photo_id)
#  index_photo_taggings_on_photo_id_and_tag_id  (photo_id,tag_id) UNIQUE
#  index_photo_taggings_on_tag_id               (tag_id)
#

class PhotoTagging < ApplicationRecord
  belongs_to :photo
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :photo_id }
end
