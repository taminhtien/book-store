module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end

	def admin?
		if !current_user.nil? && current_user.admin
			true
		else
			false
		end
	end
end
