class InsightPlugin < Noosfero::Plugin

  def self.plugin_name
    "Insight"
  end

  def self.plugin_description
    _("Add insight system to your Noosfero's environment")
  end

  def body_ending
    domain = context.environment.insight_domain
    code = context.environment.insight_code
    unless domain.blank? || code.blank?
      expanded_template('insight-code.rhtml',{:domain => domain, :code => code})
    end
  end

end
