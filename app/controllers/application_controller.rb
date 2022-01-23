class ApplicationController < ActionController::Base
  before_action :authencate_user!
  include Pagy::Backend
end
