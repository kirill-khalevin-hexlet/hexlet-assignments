# frozen_string_literal: true

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_url
    assert_response :success
  end
end
