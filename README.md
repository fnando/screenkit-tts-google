# screenkit-tts-google

[![Tests](https://github.com/fnando/screenkit-tts-google/workflows/ruby-tests/badge.svg)](https://github.com/fnando/screenkit-tts-google)
[![Gem](https://img.shields.io/gem/v/screenkit-tts-google.svg)](https://rubygems.org/gems/screenkit-tts-google)
[![Gem](https://img.shields.io/gem/dt/screenkit-tts-google.svg)](https://rubygems.org/gems/screenkit-tts-google)
[![MIT License](https://img.shields.io/:License-MIT-blue.svg)](https://tldrlegal.com/license/mit-license)

TTS engine for ScreenKit

## Installation

```bash
gem install screenkit-tts-google
```

Or add the following line to your project's Gemfile:

```ruby
gem "screenkit-tts-google"
```

## Usage

When calling [screenkit](https://github.com/fnando/screenkit), you must provide
a your credentials JSON file prefixed by `google:` (e.g.
`google:credentials.json`).

```base
screenkit episode export --dir episodes/001* --api-key "google:credentials.json"
```

Then, add the following to your ScreenKit configuration:

```yaml
tts:
  - id: google
    engine: google
    enabled: true
    voice:
      language_code: en-US
      ssml_gender: "FEMALE"
    audio_config:
      audio_encoding: "M4A"
      speaking_rate: 1.0
```

For more info, see:

- [Google Text to Speech API](https://docs.cloud.google.com/text-to-speech/docs/reference/rest/v1/text/synthesize)

## Maintainer

- [Nando Vieira](https://github.com/fnando)

## Contributors

- https://github.com/fnando/screenkit-tts-google/contributors

## Contributing

For more details about how to contribute, please read
https://github.com/fnando/screenkit-tts-google/blob/main/CONTRIBUTING.md.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT). A copy of the license can be
found at https://github.com/fnando/screenkit-tts-google/blob/main/LICENSE.md.

## Code of Conduct

Everyone interacting in the screenkit-tts-google project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/screenkit-tts-google/blob/main/CODE_OF_CONDUCT.md).
