require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "should be present" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe "minimum or maximum length" do
    it { should validate_length_of(:title).is_at_most(Article::MAXIMUM_LENGTH_OF_TITLE) }
    it { should validate_length_of(:body).is_at_most(Article::MAXIMUM_LENGTH_OF_BODY) }
  end
end
