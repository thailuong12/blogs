class Post < ApplicationRecord
    include Filterable

    belongs_to :user

    scope :filter_by_offset, -> (offset) { offset(offset) }
    scope :filter_by_limit, -> (limit) { limit(limit) }

    validates :body, presence: true
    validates :title, presence: true
end
