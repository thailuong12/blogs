class PostPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            if user.is_admin?
                Post.all
            else
                user.posts
            end
        end
    end

    def update?
        can_modify_record?
    end

    def destroy?
        can_modify_record?
    end

    def show?
        can_modify_record?
    end

    private

    def can_modify_record?
        user.is_admin? || user.posts.find_by(id: record.id).present?
    end
end