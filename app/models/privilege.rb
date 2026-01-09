class Privilege < ApplicationRecord
    has_many :user_privileges
    has_many :user, through: :user_privileges

    def self.estagiario
        find_by(action: "estagiario")
    end
end
