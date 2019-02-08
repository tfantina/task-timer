class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :user_tasks
 has_many :tasks, through: :user_tasks
 belongs_to :teams


 def email_or_user_name
   if name != nil
    name
  else
    email
  end
end


  def is_member(team)
    if team_id == team.ids
      return true
    end
  end


end
