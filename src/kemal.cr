require "kemal"

require "raven"
require "raven/integrations/kemal"

Kemal.config.logger = Raven::Kemal::LogHandler.new(Kemal::LogHandler.new)

Kemal.config.env = "production"

add_handler Raven::Kemal::ExceptionHandler.new
add_handler Raven::Kemal::UserFeedbackHandler.new

get "/404" do |env|
  halt env, status_code: 404
end

get "/" do
  "Hello World!"
end

Kemal.config.port = 40666

Kemal.run
