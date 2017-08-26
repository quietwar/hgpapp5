class AdminController < ApplicationController
  def index
    #render 'index'

  end


  def self.table_name_prefix
    'Staff'
  end
end
