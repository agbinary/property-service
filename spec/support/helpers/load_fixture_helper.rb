module LoadFixtureHelper
  def load_fixture_file(path)
    full_path = File.join(Rails.root, "spec/fixtures/#{path}")

    File.read(full_path)
  end

  def load_json_symbolized(path)
    json_content = load_fixture_file(path)

    JSON.parse(json_content, stringify_keys: true)
  end

  RSpec.configure do |config|
    config.include LoadFixtureHelper
  end
end
