include ActionView::Helpers::UrlHelper
module GroupsHelper
  def access_types
    Group.accesses.map {|k, v| [k.titleize, v]}
  end

  def access_icon group
    icon_class = {
      'open_group' => 'fa fa-globe',
      'private_group' => 'fa fa-lock'
    }
    icon_class[group.access]
  end

  def group_relation_badge group, user
    badge_class = 'rounded-md py-2 px-3 text-[0.8125rem] font-base leading-4 text-white float-right'
    if group.creator?(user)
      return "
        <a rel='nofollow' class='#{badge_class} bg-blue-500 ml-2 hover:bg-blue-400' data-method='post' href='#{edit_group_path(group)}'>Edit Group</a>
        <a rel='nofollow' class='#{badge_class} bg-red-500 hover:bg-red-400' data-method='delete' href='#{group_path(group)}'>Delete Group</a>
      ".html_safe
    end
    membership = group.user_groups.find_by(user_id: user.id)
    link = '#'
    status = ''
    if membership.present?
      membership_message = {"joined"=>'Joined', "pending"=>'Requested to Join', "removed" => "Removed", "rejected" => "Rejected"}
      badge_bg = {"joined"=>'bg-green-400', "pending"=>'bg-yellow-500', "removed" => "bg-gray-800", "rejected" => "bg-gray-800"}
      status = (membership_message[membership.status]).to_s
      badge_class = badge_class + ' ' + badge_bg[membership.status].to_s
    else
      href = join_group_path(group)
      badge_class = badge_class + ' bg-green-400'
      status = 'Join Group'
    end
    "<a rel='nofollow' class='#{badge_class}' data-method='post' href='#{href}'>#{status}</a>".html_safe
  end
end
