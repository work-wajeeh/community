class Group < ApplicationRecord
  enum access: {"open_group"=>'Open Group', "private_group"=>'Private Group'}
  validates :access, :presence => true
  has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"

  has_many :posts


  def creator? user
    self.creator == user
  end

  def add_user user
    self.users << user
    if self.open_group?
      self.user_groups.find_by(user_id: user.id)&.joined!
    else
      self.user_groups.find_by(user_id: user.id)&.pending!
    end
  end

  def update_membership membership_id, status
    operation = {
      'accept' => 'joined!',
      'reject' => 'rejected!'
    }
    user_groups.find_by_id(membership_id)&.send(operation[status.to_s])
  end

  def approved_member? user
    self.user_groups.find_by(user_id: user.id)&.joined?
  end

end
