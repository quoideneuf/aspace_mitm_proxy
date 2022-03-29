Rails.application.config.after_initialize do
  if $proxy_port = ENV['ASPACE_PROXY_PORT']
    require_relative '../net_http_proxy.rb'
    require_relative '../jsonmodel_http_proxy.rb'
  end
end
