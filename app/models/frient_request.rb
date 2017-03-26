class FrientRequest < ApplicationRecord
  belongs_to :receiver_user, class_name: "User", foreign_key: "receiver_user_id"
  belongs_to :initiative_user, class_name: "User", foreign_key: "initiative_user_id"

  has_many :receiver_users, class_name: "User", foreign_key: "receiver_user_id"
  has_many :initiative_users, class_name: "User", foreign_key: "initiative_user_id"


  before_save :create_frientships, if: -> {is_agree_changed? && is_agree?}



  private
    def create_frientships
      initiative_user.frientships.create(current_user_id: self.initiative_user_id, frient_user_id: self.receiver_user_id)
      receiver_user.frientships.create(current_user_id: self.receiver_user_id, frient_user_id: self.initiative_user_id)
    end
end