class User < ActiveRecord::Base
  has_secure_password

  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :username, presence: true,
                       uniqueness: true

  def vendor?
    roles.exists?(name: "vendor")
  end

  def readonly_user?
    roles.exists?(name: "readonly_user")
  end

  def data_entry_user?
    roles.exists?(name: "data_entry_user")
  end

  def admin?
    roles.exists?(name: "admin")
  end

  def manager?
    roles.exists?(name: "manager")
  end

  def super_user?
    roles.exists?(name: "super_user")
  end
end
