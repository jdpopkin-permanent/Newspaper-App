class Subscription < ActiveRecord::Base
  attr_accessible :subscription_plan_id, :user_id

  belongs_to  :subscription_plan, class_name: "SubscriptionPlan",
              foreign_key: :subscription_plan_id, primary_key: :id

  belongs_to :user, class_name: "User", foreign_key: :user_id,
  primary_key: :id, inverse_of: :subscriptions


end
