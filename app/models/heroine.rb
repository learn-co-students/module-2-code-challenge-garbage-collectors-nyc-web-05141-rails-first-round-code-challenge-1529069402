class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: {message: "must be unique"}

  before_save :capitalize_name

  def capitalize_name
      self.name.capitalize!
  end

  def self.search(search)

    if search.present?
      Heroine.all.select {|heroine| heroine.power.name == search}
    else
      Heroine.all
    end
  end

end
