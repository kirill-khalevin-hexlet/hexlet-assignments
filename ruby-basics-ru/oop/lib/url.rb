# frozen_string_literal: true

# BEGIN
class Url
  attr :url

  def initialize(url)
    @url = url
  end

  def ==(other)
    url == other.url
  end

  def scheme
    @url.split('://')[0]
  end

  def host
    @url.split('://')[1].split('/')[0].split('?')[0].split(':')[0]
  end

  def query_params
    params = @url.split('?')[1]
    return {} unless params

    params.split('&').map do |param|
      splited_param = param.split('=')
      [splited_param[0].to_sym, splited_param[1]]
    end.to_h
  end

  def query_param(key, value=nil)
    query_params[key.to_sym] || value
  end
end
# END
