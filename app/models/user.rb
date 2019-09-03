class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  after_create :create_tenant

  
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


private 
  def create_tenant 
    Apartment::Tenant.create(team)
  end 


end
