class Project < ApplicationRecord
  has_many :tasks
  has_many :project_associations
  has_many :subprojects, through: :project_associations
end
