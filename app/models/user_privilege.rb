class UserPrivilege < ApplicationRecord
  belongs_to :user
  belongs_to :privilege
end
