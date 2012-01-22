class User < ActiveRecord::Base
 attr_accessible :name, :email

  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
 
 validates :name, :presence => true,
                  :length   => { :maximum => 50 },
                  :uniqueness =>true
 validates :email, :presence => true,
                   :uniqueness => { :case_sensitive => false }

 def has_email?(submitted_email)
  email == submitted_email
 end

 def self.authenticate(name, submitted_email)
    user = find_by_name(name)
    if user.nil?
       return nil
    end
   if user.has_email?(submitted_email)
     return user
   end
end
end




