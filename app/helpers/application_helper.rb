module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "ROR Blog System"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def owner_post_of_comment(micropost_id)
    @user_post_id = Micropost.find_by(id: micropost_id).user_id
    if signed_in?
      current_user[:id] == @user_post_id
    else
      false
    end
  end
end