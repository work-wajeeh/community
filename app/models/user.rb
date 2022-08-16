class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :group_properties, :class_name => "Group", :foreign_key => "creator_id"

  has_many :posts, :class_name => "Post", :foreign_key => "author_id"
  
  has_many :comments, :class_name => "Comment", :foreign_key => "commentor_id"

  def group_creator? group
    group.creator == self
  end

  def in_group? group
    group.users.pluck(:id).compact.include?(self.id)
  end

end
