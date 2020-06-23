require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)
require "zplugin/sitebk"

module Dummy
  class Application < Rails::Application
  end
end

module Zomeki
  NAME = 'zomeki'
end
