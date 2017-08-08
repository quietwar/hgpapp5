Kaminari.configure do |config|
 #Draper::CollectionDecorator.send :delegate, :per_page_kaminari

  config.page_method_name = :per_page_kaminari
end
