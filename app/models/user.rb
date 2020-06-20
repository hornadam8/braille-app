class User < ApplicationRecord
    has_secure_password

    has_many UserRoles
    has_many Roles, through: UserRoles

    def role?(role)
        roles.any? { |r| r.name.underscore.to_sym == role }
    end
end
