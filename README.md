# Freefeed::Client

[Freefeed](https://freefeed.net) API wrapper extracted from the [Feeder](https://frf.im) project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freefeed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freefeed

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Running tests

By default all tests are running locally, with no direct interaction with a Freefeed server. API response examples are kept at [spec/fixtures/files](https://github.com/dreikanter/freefeed/tree/master/spec/fixtures/files).

To add new tests, first export `FREEFEED_TOKEN` environment variable to set Freefeed token API:

```bash
export FREEFEED_TOKEN=<YOUR-API-TOKEN>
```

Persist sample API response for further testing:

```ruby
describe Freefeed::V2::NewFeature do
  include_context "client"

  describe "#notifications" do
    subject(:response) { client.new_feature_action }

    before do
      WebMock.disable!
      json = JSON.pretty_generate(response.parse)
      path = "spec/fixtures/files/v2/new_feature/new_feature_action.json"
      File.open(path, "wt").write(json)
    end

    it { expect(response.status).to eq(200) }
  end
end
```

Use `file_fixture` helper to load sample data:

```ruby
file_fixture("v2/new_feature/new_feature_action.json")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freefeed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Freefeed project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freefeed/blob/master/CODE_OF_CONDUCT.md).
