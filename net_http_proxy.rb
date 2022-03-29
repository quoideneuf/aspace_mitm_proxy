Net::HTTP.class_eval do
  class << self
    alias_method :start_orig, :start

    def start(host, port, opts)
      start_orig(host, port, 'localhost', $proxy_port, opts) do |http|
        puts "overridden Net::HTTP::start"
        yield http
      end
    end
  end
end


# module JSONModel::HTTP
#   class << self
#     alias_method :http_conn_orig, :http_conn

#     def http_conn
#       puts "overidden jsonmodel http conn"
#       @http ||= Net::HTTP::Persistent.new 'jsonmodel_client', URI("http://localhost:#{$proxy_port}")
#       http_conn_orig
#     end
#   end
# end
