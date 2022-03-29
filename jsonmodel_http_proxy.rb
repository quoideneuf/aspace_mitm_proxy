module JSONModel::HTTP
  class << self
    alias_method :http_conn_orig, :http_conn

    def http_conn
      puts "overidden jsonmodel http conn"
      @http ||= Net::HTTP::Persistent.new 'jsonmodel_client', URI("http://localhost:#{$proxy_port}")
      http_conn_orig
    end
  end
end
