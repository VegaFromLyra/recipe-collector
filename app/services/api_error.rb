class ApiError
  attr_reader :pointer
  attr_reader :title
  attr_reader :detail

  def initialize(pointer:, title:, detail: nil)
    @pointer = pointer
    @title = title
    @detail = detail
  end

  def as_json
    result = {
      source: { pointer: pointer },
      title: title,
    }

    result.merge(detail: detail) if detail.present?
  end
end
