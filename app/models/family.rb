class Family < ApplicationRecord
  belongs_to :character
  belongs_to :family_member, :class_name => "Character"

  def family2waycreate
end
