class User < ApplicationRecord
    after_initialize :set_privilege_default, if: :new_record?
    has_secure_password

    has_one :user_privilege
    has_one :privilege, through: :user_privilege

    validates :nome, presence: true
    validates :email, presence: true
    validates :password, presence: true

    private

    def set_privilege_default
        self.privilege ||= Privilege.estagiario
    end

end
