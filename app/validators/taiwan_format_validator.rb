# frozen_string_literal: true

require 'tw/vat_number'

class TaiwanFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if TW::VATNumber.valid?(value)

    record.errors.add(attribute, '統一編號格式有誤')
  end
end
