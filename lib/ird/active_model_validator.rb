require 'active_model'

module ActiveModel
  module Validations
    class IrdValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if IRD::Validator.validate(value.to_s)
        record.errors.add(attribute, options[:message] || :invalid)
      end
    end
  end
end
