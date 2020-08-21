# require 'active_support'
# module Concerns
#   module ImageUrl
#     extend ActiveSupport::Concern
#     include Rails.application.routes.url_helpers

#     included do
#       Rails.application.routes.default_url_options[:host] = 'your_host'
#     end
#   end
# end