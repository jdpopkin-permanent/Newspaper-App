class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title

  validates :editor, presence: true
  validates :title, presence: true

  has_many :subscription_plans, class_name: "SubscriptionPlan",
  primary_key: :id, foreign_key: :newspaper_id


end
