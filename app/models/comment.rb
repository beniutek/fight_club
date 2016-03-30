class Comment < ActiveRecord::Base
  belongs_to :fighter
  validates :author, :body, presence: true
end
