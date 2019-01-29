class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :user_tasks
 has_many :tasks, through: :user_tasks


 def email_or_user_name
   if name != nil
    name
  else
    email
  end
end



end
