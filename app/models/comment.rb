class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', foreign_key: "parent_id", optional: true
  has_many :childrens, class_name: 'Comment', foreign_key: "parent_id"
  has_many :sub_childrens, class_name: 'Comment', foreign_key: "root_id"

  after_create :set_root_id

  after_save :clear_article_comments_cache

  def self.root_comment_id comment_id
    if find_by_id(comment_id).try(:parent_id).present?
      return Comment.root_comment_id(find_by_id(comment_id).try(:parent_id))
    else
      return comment_id
    end
  end
  private
    def set_root_id
      return if parent.blank?
      self.root_id = Comment.root_comment_id(id)
      self.save
    end

    def clear_article_comments_cache
      $redis.del "article_#{article.id}_comments"
    end
end
