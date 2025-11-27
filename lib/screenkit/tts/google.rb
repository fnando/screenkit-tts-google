# frozen_string_literal: true

require "screenkit/tts/base"
require "google/cloud/text_to_speech"

module ScreenKit
  require_relative "google/version"

  EXTENSION = {
    "MP3" => ".mp3",
    "PCM" => ".pcm",
    "M4A" => ".m4a",
    "OGG_OPUS" => ".ogg",
    "LINEAR16" => ".wav",
    "MULAW" => ".wav",
    "ALAW" => ".wav"
  }.freeze

  module TTS
    class Google < Base
      def self.schema_path
        File.join(__dir__, "google/schema.json")
      end

      def self.available?(api_key: nil, **)
        api_key.to_s.start_with?(api_key_prefix)
      end

      # This method is required.
      def generate(text:, output_path:, log_path: nil, **)
        # Optional: validate options against JSON schema.
        self.class.validate!(options)

        if log_path
          File.open(log_path, "w") do |f|
            f << JSON.pretty_generate(options.merge(input: {text:}))
          end
        end

        client = ::Google::Cloud::TextToSpeech.text_to_speech do |config|
          config.credentials = api_key
          config.logger = Logger.new(log_path, level: Logger::DEBUG) if log_path
        end

        trace = ENV.fetch("GRPC_TRACE", nil)
        verbosity = ENV.fetch("GRPC_VERBOSITY", nil)

        ENV["GRPC_TRACE"] = "all"
        ENV["GRPC_VERBOSITY"] = "debug"

        audio_config = {
          audio_encoding: "MP3"
        }.merge(options[:audio_config] || {})

        output_path = Pathname(output_path)
                      .sub_ext(EXTENSION[audio_config[:audio_encoding]])

        response = client.synthesize_speech(
          input: {text:},
          voice: options[:voice],
          audio_config:
        )

        File.binwrite(output_path, response.audio_content)
      ensure
        ENV["GRPC_TRACE"] = trace if trace
        ENV["GRPC_VERBOSITY"] = verbosity if verbosity
      end
    end
  end
end
