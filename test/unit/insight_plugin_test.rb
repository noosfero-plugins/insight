require_relative '../test_helper'

class InsightPluginTest < ActiveSupport::TestCase

  def setup
    @plugin = InsightPlugin.new
    @context = mock()
    @plugin.context = @context
    @environment = Environment.new
    @context.stubs(:environment).returns(@environment)
  end

  attr_accessor :plugin, :environment

  should 'add content at the body ending unless domain and site_id are blank' do
    environment.insight_domain = 'insight.domain.example.com'
    environment.insight_code = 5
    plugin.stubs(:expanded_template).returns('content')
    assert_equal 'content', plugin.body_ending
  end

  should 'not add any content at the body ending if domain is blank' do
    environment.insight_domain = nil
    environment.insight_code = 5
    plugin.stubs(:expanded_template).returns('content')
    assert_equal nil, plugin.body_ending
  end

  should 'not add any content at the body ending if site_id is blank' do
    environment.insight_domain = 'insight.domain.example.com'
    environment.insight_code = nil
    plugin.stubs(:expanded_template).returns('content')
    assert_equal nil, plugin.body_ending
  end

end
