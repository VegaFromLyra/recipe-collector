class ExternalIdGenerator
  attr_reader :id

  MINIMUM_LENGTH = 8
  ALPHABET = "abcdefghijklmnopqrstuvwxyz0123456789"

  def initialize(id:)
    @id = id
    @hashids = Hashids.new(Rails.application.credentials.external_id_salt!, MINIMUM_LENGTH, ALPHABET)
  end

  def call
    hashids.encode(id)
  end

  private

  attr_reader :salt
  attr_reader :hashids
end
