# frozen_string_literal: true

require "test_helper"

class GoogleTest < Minitest::Test
  test "marks engine as available when api key matches pattern" do
    assert ScreenKit::TTS::Google.available?(api_key: "google.json")
    assert ScreenKit::TTS::Google.available?(api_key: "google-credentials.json")
  end
end
