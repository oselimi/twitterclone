class Article < ApplicationRecord
    belongs_to :user
    MAXIMUM_LENGTH_OF_TITLE = 50
    MAXIMUM_LENGTH_OF_BODY = 200

    validates :title, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_TITLE }
    validates :body, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_BODY }

    default_scope { order(created_at: :desc) }
end
