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

    if detail.present?
      result.merge!(detail: detail)
    else
      result
    end
  end
end
