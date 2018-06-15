class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def self.search(search)
    where("power LIKE ?", "%#{search}%")
  end
end
