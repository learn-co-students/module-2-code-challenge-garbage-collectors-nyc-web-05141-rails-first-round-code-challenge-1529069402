class Heroine < ApplicationRecord
  belongs_to :power
  validates_uniqueness_of :super_name
end
