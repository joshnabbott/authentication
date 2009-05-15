class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :name_first, :name_last
end
