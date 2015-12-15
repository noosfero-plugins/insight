require_relative '../test_helper'

class EnvironmentTest < ActiveSupport::TestCase

  should 'extends Environment with attr insight_domain' do
    assert_respond_to Environment.new, :insight_domain
  end

  should 'extends Environment with attr insight_code' do
    assert_respond_to Environment.new, :insight_code
  end

end
