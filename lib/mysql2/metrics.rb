require 'mysql2'
require 'mysql2/metrics/ltsv_formatter'
require 'logger'

module Mysql2
  class Metrics
    def self.logger=(logger)
      @logger = logger
    end

    def self.logger
      @logger ||= Logger.new($stdout).tap {|log|
        log.formatter = ::Mysql2::Metrics::LtsvFormatter.new
      }
    end

    def self.add_tracer(method)
      klass = ::Mysql2::Client
      unless klass.method_defined?("#{method}_without_metrics")
        klass.__send__(:alias_method, "#{method}_without_metrics", method)
        klass.__send__(:define_method, "#{method}_with_metrics") do |*args|
          query = args.first
          ::Mysql2::Metrics.measure_time(query) do
            send("#{method}_without_metrics", *args)
          end
        end
        klass.__send__(:alias_method, method, "#{method}_with_metrics")
      end
    end

    def self.measure_time(query, &block)
      start = Time.now
      ret = yield
      elapsed = Time.now - start
      logger = Mysql2::Metrics.logger
      logger.info({ query: query, elapsed: elapsed.to_f })
      ret
    end
  end
end

# open class
module Mysql2
  class Client
    # mysql2-cs-bind
    if method_defined?(:xquery)
      ::Mysql2::Metrics.add_tracer :xquery
    else
      ::Mysql2::Metrics.add_tracer :query
    end
  end
end
