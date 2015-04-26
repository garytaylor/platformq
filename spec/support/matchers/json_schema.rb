require 'json-schema'
schema_dir = File.absolute_path('../api/schemas', __dir__)
RSpec::Matchers.define :be_valid_json_for_schema do |schema|
  match do |actual|
    data = actual
    data = actual.body if actual.is_a? ActionDispatch::Response  #So we can use a response directly as well as a string
    @errors = JSON::Validator.fully_validate(File.join(schema_dir, "#{schema}.json"), data, strict: true)
    @errors.empty?
  end
  failure_message do |actual|
    data = actual
    data = actual.body if actual.is_a? ActionDispatch::Response  #So we can use a response directly as well as a string
    "Expected #{data.inspect} to be valid according to the schema <<INSERT SCHEMA HERE>>.  Below are the errors :- \n#{@errors.join("\n")}"
  end

end