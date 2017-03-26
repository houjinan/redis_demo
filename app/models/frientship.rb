class Frientship < ApplicationRecord
  belongs_to :current_user, class_name: "User", foreign_key: "current_user_id"
  belongs_to :frient_user, class_name: "User", foreign_key: "frient_user_id"

  has_many :current_users, class_name: "User", foreign_key: "current_user_id"
  has_many :frient_users, class_name: "User", foreign_key: "frient_user_id"

  has_many :frient_articles, class_name: "article", foreign_key: "frient_user_id"
end