class User < ApplicationRecord
  has_many :feedbacks_given, class_name: "Feedback", foreign_key: "from"
  has_many :feedbacks_recieved, class_name: "Feedback", foreign_key: "to"
end
