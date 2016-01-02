module ApplicationHelper
  def super_user?
    current_user && current_user.super_user?
  end

  def manager?
    current_user && current_user.manager?
  end

  def admin?
    current_user && current_user.admin?
  end

  def data_entry_user?
    current_user && current_user.data_entry_user?
  end

  def readonly_user?
    current_user && current_user.readonly_user?
  end

  def vendor?
    current_user && current_user.vendor?
  end
end
