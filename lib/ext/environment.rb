require_dependency 'environment'

class Environment
  settings_items :insight_domain
  settings_items :insight_code
  attr_accessible :insight_domain, :insight_code
end
