class Subproject < ApplicationRecord
  has_many :project_assocaitions
  has_many :projects, through: :project_assocaitions
end
