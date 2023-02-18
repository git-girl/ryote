require 'listen'

class ApplicationController < ActionController::Base
  before_action :file_listener

  def file_listener
    @file_listener ||= FileListener.new
    @file_listener.listener.start unless @file_listener.listener.processing?
    @file_listener
  end
end
