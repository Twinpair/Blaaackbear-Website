class Message < ApplicationRecord

  validates_presence_of :name, :email, :message

end
