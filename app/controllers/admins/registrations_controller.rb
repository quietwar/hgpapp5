class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  include Accessible
  # <h2 class='text-center'>Sign up</h2>
  # <div class='row'>
  #   <div class='col-md-12'>
  #     <%= form_for(resource, as: resource_name,
  #         :html => {class: "form-horizontal", role: "form"},
  #         url: registration_path(resource_name)) do |f| %>
  #       <%= devise_error_messages! %>
  #
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :first_name %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.text_field :first_name, class: 'form-control',
  #             autofocus: true %>
  #         </div>
  #       </div>
  #
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :last_name %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.text_field :last_name, class: 'form-control' %>
  #         </div>
  #       </div>
  #
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :email %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.email_field :email, class: 'form-control'  %>
  #         </div>
  #       </div>
  #
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :password %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.password_field :password, class: 'form-control',
  #             autocomplete: "off" %>
  #           <% if @minimum_password_length %>
  #             <em>(<%= @minimum_password_length %>
  #                                     characters minimum)</em>
  #           <% end %><br />
  #         </div>
  #       </div>
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :password_confirmation %>
  #         </div>
  #         <div class='col-md-9'>
  #             <%= f.password_field :password_confirmation,
  #                       class: 'form-control', autocomplete: "off" %>
  #         </div>
  #       </div>
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :title %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.text_field :title, class: 'form-control',
  #             autocomplete: "off" %>
  #         </div>
  #       </div>
  #       <div class='form-group'>
  #         <div class='control-label col-md-3'>
  #           <%= f.label :admin %>
  #         </div>
  #         <div class='col-md-9'>
  #           <%= f.check_box :admin, class: 'checkbox' %>
  #         </div>
  #       </div>
  #
  #       <div class='form-group'>
  #         <div class='col-md-offset-3 col-md-9'>
  #           <%= f.submit "Sign up", class: 'btn btn-success btn-lg' %>
  #         </div>
  #       </div>
  #     <% end %>
  #
  #     <div class='form-group'>
  #       <div class='col-md-offset-3 col-md-9'>
  #         <%= render "devise/shared/links" %>
  #       </div>
  #     </div>
  #   </div>
  # </div>

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(activeadmin)
    super(admin_dashboard_path)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
