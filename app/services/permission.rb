class Permission
  extend Forwardable

  attr_reader :user, :controller, :action

  def_delegators :user, :vendor?, :readonly_user?,
                 :data_entry_user?, :admin?, :manager?,
                 :super_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when super_user? then super_user_permissions
    when manager? then manager_permissions
    when admin? then admin_permissions
    when data_entry_user? then data_entry_permissions
    when readonly_user? then readonly_user_permissions
    when vendor? then vendor_permissions
    else
      base_permissions
    end
  end

  private

    def super_user_permissions
      return true
    end

    def manager_permissions
      return true if controller == "sessions"
      return true if controller == "units" && action.in?(%w(index show))
    end

    def admin_permissions
      return true if controller == "sessions"
    end

    def data_entry_user_permissions
      return true if controller == "sessions"
    end

    def readonly_user_permissions
      return true if controller == "sessions"
    end

    def vendor_permissions
      return true if controller == "sessions"
    end

    def base_permissions
      return true if controller == "sessions"
    end
end
