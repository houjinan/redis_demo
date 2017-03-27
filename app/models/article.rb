class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :one_level_comments, -> { where("comments.parent_id is null") }, class_name: "Comment", foreign_key: "article_id"



end
