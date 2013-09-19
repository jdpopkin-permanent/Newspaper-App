module ApplicationHelper

  def render_subscription_plan(sub_plan)
    paper_name = sub_plan.newspaper.title
    sub_type = sub_plan.daily ? "Daily" : "Weekly"
    html = "<label>#{paper_name} #{sub_type}"
    html << '<input type="checkbox" name="user[subscription_plan_ids][]" value="'
    html << sub_plan.id.to_s
    html << '"></label>'

    html.html_safe
  end


end
