class Admin::BaseController < ApplicationController
  before_filter :authenticate_staffer!
  layout 'admin'
end