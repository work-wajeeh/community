# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  include ApplicationHelper
  with_collection_parameter :comment

  def initialize(comment:)
    @comment = comment
  end

end
