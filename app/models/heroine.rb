class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: {message: "must be unique"}

end
