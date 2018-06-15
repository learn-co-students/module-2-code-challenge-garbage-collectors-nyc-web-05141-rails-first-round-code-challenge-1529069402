class Heroine < ApplicationRecord

    belongs_to :power

    validates :super_name, uniqueness: true

    #Currently there is no message sent to user indicating that they can't duplicate supernames, but it works in the back-end

    #, message: "must be a unique supername" }

    def power_name
      self.power.name
    end
end
