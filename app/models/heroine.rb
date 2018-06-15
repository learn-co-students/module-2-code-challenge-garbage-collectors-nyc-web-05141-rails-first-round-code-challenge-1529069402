class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def search=(search)
    @search = search
  end

  def search
    @search
  end

  def self.search(search)
    if search
      superpower = Power.find_by(name: search)
      if superpower
        self.where(power_id: superpower)
      else
        Heroine.all
      end
    else
      Heroine.all
    end
  end

end
