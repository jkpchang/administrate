require "administrate/base_dashboard"

class LineItemDashboard < Administrate::BaseDashboard
  ATTRIBUTES = [
    :order,
    :product,
    :quantity,
    :unit_price
  ]

  ATTRIBUTE_TYPES = {
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    order: Field::BelongsTo,
    product: Field::BelongsTo,
    quantity: Field::Number,
    total_price: Field::Currency.with_options(readonly: true),
    unit_price: Field::Currency,
  }

  COLLECTION_ATTRIBUTES = ATTRIBUTES + [:total_price]
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTES + [:total_price]
  FORM_ATTRIBUTES = ATTRIBUTES

  def display_resource(line_item)
    "Line Item #%04d" % line_item.id
  end
end
