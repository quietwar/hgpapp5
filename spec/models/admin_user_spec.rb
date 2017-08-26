require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
def authenticate_admin!

 unless current_admin
    flash[:alert] = "Unauthorized Access: Genius, go back!"
    redirect_to root_path
  end
end
