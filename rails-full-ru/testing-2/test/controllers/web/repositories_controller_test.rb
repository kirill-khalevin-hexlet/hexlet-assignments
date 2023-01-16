# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create' do
    stub_request(:get, 'https://api.github.com/repos/kirill-khalevin-hexlet/rails-project-65')
      .to_return(
        headers: { 'Content-Type' => 'application/json' },
        body: {
          description: nil,
          default_branch: 'main',
          watchers: 0,
          language: 'Ruby',
          created_at: '01-01-2023',
          updated_at: '01-01-2023',
          html_url: 'https://github.com/kirill-khalevin-hexlet/rails-project-65',
          name: 'rails-project-65',
          owner: { login: 'kirill-khalevin-hexlet' }
        }.to_json
      )
    post repositories_url(
      owner_name: 'kirill-khalevin-hexlet',
      repo_name: 'rails-project-65'
    )

    assert_response :success
    assert Repository.find_by(owner_name: 'kirill-khalevin-hexlet').present?
  end
  # END
end
