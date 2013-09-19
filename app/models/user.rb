class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :password, :subscription_plan_ids

  validates :name, presence: true
  validates :password_digest, presence: true

  has_many  :subscriptions, class_name: "Subscription", primary_key: :id,
            foreign_key: :user_id, inverse_of: :user

  has_many  :subscription_plans, through: :subscriptions,
            source: :subscription_plan, inverse_of: :users

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(name, password)
    return nil if name.blank?
    user = User.find_by_name(name)

    return nil unless user.is_password?(password)
    user
  end

  def subscription_plan_ids=(ids)
    self.subscription_plans = SubscriptionPlan.where(id: ids)
  end
end
