class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.validates_uniqueness(*attr_names)
   # Set the default configuration
   configuration = { attribute_name: :name , message: I18n.t('validations.duplicate') }

   # Update defaults with any supplied configuration values
   configuration.update(attr_names.extract_options!)

   validates_each(attr_names) do |record, record_attr_name, value|
      duplicates = Set.new
      attr_name = configuration[:attribute_name]
    #     value.map do |obj|
    #     #be sure to not count the destroyed objects
    #     unless obj.marked_for_destruction?
    #       cur_attr_value = obj.try(attr_name)
    #       if duplicates.member?(cur_attr_value)
    #         # mark the record as in error so validation will detect a failure
    #         record.errors.add(record_attr_name, '')
    #         obj.errors.add(attr_name, configuration[:message])
    #       else
    #      duplicates.add(cur_attr_value)
    #    end
    #   end
    #  end
   end
 end
end
