class Subproject < ApplicationRecord
  has_many :project_assocaitions
  has_many :projects, through: :project_assocaitions
    validates :name, uniqueness: true, presence: true, length: {minimum: 2}
end
