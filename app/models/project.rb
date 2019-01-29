class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :project_assocaitions
  has_many :subprojects, through: :project_assocaitions

  validates :name, uniqueness: true, presence: true, length: {minimum: 2}

  def name_length
    if name.length > 30
      name.truncate(30)
    end
  end


end
