# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "bundler/setup"
require "screenkit/tts/google"

require "minitest/utils"
require "minitest/autorun"

Dir["#{__dir__}/support/**/*.rb"].each do |file|
  require file
end
