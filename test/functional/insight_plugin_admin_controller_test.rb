require_relative '../test_helper'

class InsightPluginAdminControllerTest < ActionController::TestCase

  def setup
    @environment = Environment.default
    user_login = create_admin_user(@environment)
    login_as(user_login)
    @environment.enabled_plugins = ['InsightPlugin']
    @environment.save!
  end

  should 'access index action' do
    get :index
    assert_template 'index'
    assert_response :success
  end

  should 'update insight plugin settings' do
    assert_nil @environment.reload.insight_domain
    assert_nil @environment.reload.insight_code
    post :index, :environment => { :insight_domain => 'http://something', :insight_code => 'salsdfkldsjflw43rewr' }
    assert_not_nil @environment.reload.insight_domain
    assert_not_nil @environment.reload.insight_code
  end

end
