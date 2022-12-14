class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :group
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_many :comments
end
