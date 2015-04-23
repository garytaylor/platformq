require 'json-schema'
schema_dir = File.absolute_path('../api/schemas', __dir__)
RSpec::Matchers.define :be_valid_json_for_schema do |schema|
  match do |actual|
    errors = JSON::Validator.fully_validate(File.join(schema_dir, "#{schema}.json"), actual)
  end

end