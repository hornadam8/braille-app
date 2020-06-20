class CohortPolicy
    attr_reader :user,:cohort

    def initialize(user,cohort)
        @user = user
        @cohort = cohort
    end

    def create?
        @user.current_role == "teacher"
    end

    def update?
        @user.current_role == "teacher"
    end

end