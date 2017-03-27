class User < ApplicationRecord
  has_many :articles

  has_many :initiative_users, class_name: "FrientRequest", foreign_key: "initiative_user_id"  #我邀请过的朋友
  has_many :receiver_users, class_name: "FrientRequest", foreign_key: "receiver_user_id"      #邀请过我的朋友

  #我邀请成功的朋友
  has_many :initiative_agree_users, -> { where("frient_requests.is_agree = 1") }, class_name: "FrientRequest", foreign_key: "initiative_user_id"
  #邀请过成功我的朋友
  has_many :receiver_agree_users, -> { where("frient_requests.is_agree = 1") }, class_name: "FrientRequest", foreign_key: "receiver_user_id"


  has_many :frientships, class_name: "Frientship", foreign_key: "current_user_id"

  #我所有的朋友
  has_many :frients, through: :frientships, source: :frient_user

  #我所有朋友的文章
  has_many :frient_articles, through: :frients, source: :articles





end
