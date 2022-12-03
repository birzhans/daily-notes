# frozen_string_literal: true

class RecordFieldComponent < ViewComponent::Base
  def initialize(record:, field:)
    @record = record
    @field = field
    @field_name = field.to_s.humanize
    @value = record.public_send(field)
  end

end
