class User < ApplicationRecord

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    MAXIMUM_LENGTH_OF_FIRST_NAME = 50
    MAXIMUM_LENGTH_OF_LAST_NAME = 50
    MAXIMUM_LENGTH_OF_EMAIL = 50
    MINUMUM_LENGTH_OF_PASSWORD =  6

    before_save :email_downcase

    has_secure_password

    validates :first_name, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_FIRST_NAME }
    validates :last_name, presence: true, length: { maximum: MAXIMUM_LENGTH_OF_LAST_NAME }
    validates :email, presence: true, uniqueness: true, length: { maximum: MAXIMUM_LENGTH_OF_EMAIL },
                      format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: MINUMUM_LENGTH_OF_PASSWORD}

    private

    def email_downcase
        self.email = email.downcase
    end
end
