# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  artwork_id :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
    validate :comment_or_artwork?

    belongs_to :liker,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork,
        optional: true

    belongs_to :comment,
        primary_key: :id,
        foreign_key: :comment_id,
        class_name: :Comment,
        optional: true    

    def comment_or_artwork?
       unless comment_id.nil? ^ artwork_id.nil?
            errors[:results] << "Comment or artwork needs to be present, one or another!"
       end
    end
    
end
