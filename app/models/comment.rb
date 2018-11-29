class Comment < ApplicationRecord
  belongs_to :discussion

  validates :name, :email, :body, presence: true
end
