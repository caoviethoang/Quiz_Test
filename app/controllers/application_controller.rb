class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_admin!
  add_flash_types :info, :error, :warning
end