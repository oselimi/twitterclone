class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    MAXIMUM_LENGTH_OF_FIRST_NAME = 50
    MAXIMUM_LENGTH_OF_LAST_NAME = 50
    MAXIMUM_LENGTH_OF_EMAIL = 50
    before_save :email_downcase
    validates :first_name, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_FIRST_NAME }
    validates :last_name, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_LAST_NAME }
    validates :email, presence: true, uniqueness: true, length: { maximum: MAXIMUM_LENGTH_OF_EMAIL },
                      format: { with: VALID_EMAIL_REGEX }


    private

    def email_downcase
        self.email = email.downcase
    end
end
