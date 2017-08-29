def accepts_nested_attributes_sync_for(*attr_names)
  attr_names.each do |item|
    association_name = item.keys.first
    unique_column_names = item.values.first
    if reflection = reflect_on_association(association_name)
      raise ArgumentError, "The association #{association_name} must be has_many" unless reflection.collection?
      accepts_nested_attributes_for association_name, allow_destroy: true
      nested_attributes_sync_options = self.nested_attributes_sync_options.dup
      nested_attributes_sync_options[association_name.to_sym] = {
        unique_column_names: unique_column_names.map(&:to_sym),
        associated_class_name: reflection.class_name,
      }
      self.nested_attributes_sync_options = nested_attributes_sync_options
      generate_association_sync_chain(association_name)
    else
      raise ArgumentError, "No association found for name `#{association_name}'. Has it been defined yet?"
    end
  end
end
