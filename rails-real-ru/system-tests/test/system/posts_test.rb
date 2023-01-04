# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit posts_url
  end

  test 'visiting the new' do
    visit new_post_url
  end
end
# END
