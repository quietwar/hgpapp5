ActiveAdmin.register Event do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :event, :notes
 menu priority: 5
 index do
   selectable_column
   id_column
   column :admin_id
   column :event
   column :notes
   column :created_at
   actions
 end

 filter :admin_id
 filter :event
 filter :notes
 filter :created_at

 form do |f|
   f.inputs do
     f.input :event
     f.input :notes

   end
   f.actions

 end#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
end
