module JSONModel::HTTP
  class << self
    alias_method :http_conn_orig, :http_conn

    def http_conn
      @http = nil unless @overidden_http
      puts "ASPACE PROXY PLUGIN: overiding jsonmodel http conn" unless @http
      @http ||= Net::HTTP::Persistent.new 'jsonmodel_client', URI("http://localhost:#{$proxy_port}")
      @overidden_http ||= true
      http_conn_orig
    end
  end
end
