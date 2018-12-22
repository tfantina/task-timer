class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :project

  #before_save {self.day = Date.parse(day)}
end
