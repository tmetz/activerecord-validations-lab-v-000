class Post < ActiveRecord::Base
  #include ActiveModel::Validations
  validates :title, presence: true, clickbait: true
  #validates_with ClickbaitValidator

  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
end
