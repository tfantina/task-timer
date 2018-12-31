class ProjectAssocaition < ApplicationRecord
  belongs_to :project
  belongs_to :subproject
end
