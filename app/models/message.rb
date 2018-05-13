class Message
	include ActiveModel::Model
	attr_accessor :fname, :phone, :email, :body
	validates :fname, :phone, :email, :body, presence: true
end
