class Project < ApplicationRecord
  has_many :tasks
  has_many :project_assocaitions
  has_many :subprojects, through: :project_assocaitions

  validates :name, uniqueness: true 
end
