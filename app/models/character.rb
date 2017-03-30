class Character < ApplicationRecord
  has_many :families
  has_many :family_members, :through => :families
  validates :first_name, :last_name, :workplace, presence: true
  validates :first_name,:last_name, uniqueness: {scope: [:first_name,:last_name]}
  def name
    return "#{self.first_name} #{self.last_name}"
  end
end
