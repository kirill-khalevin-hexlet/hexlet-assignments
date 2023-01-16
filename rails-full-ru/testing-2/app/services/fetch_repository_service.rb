class FetchRepositoryService
  def initialize(owner_name, repository_name)
    @owner_name = owner_name
    @repository_name = repository_name
  end

  def call
    fetch

    repository
  end

  def fetch
    repository.update(
      description: response[:description],
      default_branch: response[:default_branch],
      watchers_count: response[:watchers],
      language: response[:language],
      repo_created_at: response[:created_at],
      repo_updated_at: response[:updated_at]
    )
  end

  def repository
    @repository ||= Repository.find_or_create_by(
      link: response[:html_url],
      owner_name: response.dig(:owner, :login),
      repo_name: response[:name]
    )
  end

  def response
    @response ||= Octokit.client.get(link)
  end

  def link
    "https://api.github.com/repos/#{@owner_name}/#{@repository_name}"
  end
end
