class Comment < ApplicationRecord
  belongs_to :discussion, counter_cache: true

  validates :name, :email, :body, presence: true
end
