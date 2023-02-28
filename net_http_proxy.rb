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
