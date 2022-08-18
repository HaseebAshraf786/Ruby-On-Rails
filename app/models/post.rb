class Post < ApplicationRecord
  belongs_to :profile
  has_many :applicants
  has_many :skills
  enum pstatus: [:opened,:closed]
  enum progress: [:completed , :pending]
end
