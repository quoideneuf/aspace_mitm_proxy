if $proxy_port = ENV['ASPACE_PROXY_PORT']
  require_relative '../net_http_proxy.rb'
end
