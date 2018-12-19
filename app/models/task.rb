class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  #before_save {self.day = Date.parse(day)}
end
