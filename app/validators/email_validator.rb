class EmailValidator < ActiveModel::Validator

    def validate(record)
        if record.email.present? && !(record.email.include?("@") && record.email.include?("."))
            record.errors[:email] << "Must be a valid email address"
        end
    end
end