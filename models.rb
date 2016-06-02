class User < ActiveRecord::Base
  has_many :user_classses
  has_many :classses, through: :user_classses
  has_one :profile
  has_many :notes 
end

class Classs < ActiveRecord::Base
  has_many :user_classses
  has_many :users, through: :user_classses
  has_many :notes
end

class UserClasss < ActiveRecord::Base
  belongs_to :user
  belongs_to :classs
end

class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :classs
end

class Profile < ActiveRecord::Base
  belongs_to :user
end