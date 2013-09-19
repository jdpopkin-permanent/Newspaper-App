module NewspapersHelper

  def populate_plans(parameters)
    plans = []

    parameters[:subscription_plan].each do |key, val|
      val.values.each do |val2|

        unless val2.blank?
          plans << SubscriptionPlan.new(val)
          break
        end

      end
    end

    plans
  end
end
