# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    locale = extract_locale(env)
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale if locale

    @app.call(env)
  end

  private

  def extract_locale(request)
    request['HTTP_ACCEPT_LANGUAGE'].to_s[/^[a-z]{2}/].presence&.downcase&.to_sym
  end
  # END
end
