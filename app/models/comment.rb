class Comment < ApplicationRecord

  has_rich_text :content
  
  belongs_to :post
  belongs_to :commentor, :class_name => "User", :foreign_key => "commentor_id"

  belongs_to :parent,  class_name: "Comment", optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
end
