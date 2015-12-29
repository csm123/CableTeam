module ApplicationHelper

  ALL_USERS = {1 => "Sam", 2 => "Julie"}

  def current_user
    if cookies[:user_id].present?
      {id: cookies[:user_id].to_i, name: get_user_name(cookies[:user_id])}
    else
      nil
    end
  end

  def all_users
    ALL_USERS
  end

  private

  def get_user_name(id)
    ALL_USERS[id.to_i]
  end



end
