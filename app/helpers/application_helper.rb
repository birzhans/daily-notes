module ApplicationHelper
  def inline_error_for(resource, field)
    return unless resource.errors[field].any?

    html = []
    html << resource.errors[field].map do |message|
      tag.div(message, class: "text-danger")
    end

    html.join.html_safe
  end

  def record_field(record, field)
    return unless record.respond_to?(field)

    render RecordFieldComponent.new(record: record, field: field) 
  end
end
