class Subproject < ApplicationRecord
  has_many :project_associations
  has_many :projects, through: :project_associations
end
