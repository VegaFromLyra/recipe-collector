require "test_helper"

class ExternalIdGeneratorTest < ActiveSupport::TestCase
  test "external id is generated" do
    external_id_generator = ExternalIdGenerator.new(id: 1456)
    assert_not_nil(external_id_generator.call)
  end
end
