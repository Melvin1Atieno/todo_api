require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
    config.format = :json
    config.curl_host = 'http://Todosapi.dev'
    config.api_name = "Todos Api"
    config.request_headers_to_include = ["Host","Content-Type"]
    config.response_headers_to_include = ["Host","Content-Type"]
    config.keep_source_order = true
end