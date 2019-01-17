class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :project

  validates :comments, presence: true
  validates :time, presence: true
  validates :day, presence: true
  validates_associated :project



end
