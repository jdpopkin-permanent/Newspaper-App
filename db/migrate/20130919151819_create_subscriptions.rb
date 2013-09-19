class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, index: true
      t.integer :subscription_plan_id, index: true

      t.timestamps
    end
  end
end
