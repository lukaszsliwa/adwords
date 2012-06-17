# encoding: utf-8
module Adwords

  module Config
    extend self

    # Get the options hash
    #
    # @example
    #
    #   Adwords::Config.options[:service][:environment] = 'PRODUCTION'
    #
    # @return [Hash] All options
    #
    # @since 1.0.0
    #
    def self.options
      @options ||= {
        :authentication => {
          :method => 'ClientLogin',
          :email  => '',
          :password => '',
          :developer_token => '',
          :user_agent => ''
        },
        :service => {
          :environment => 'PRODUCTION' # or SANDBOX
        },
        :connection => {
          :enable_gzip => false
        }
      }
    end

    # Defines three methods for given key
    #
    # @example
    #
    #   Adwords::Config.option(:test, :on => :connection)
    #
    # @param [Symbol]
    # @param [Hash] opts
    # @option opts [Symbol] :on The options key
    #
    # @since 1.0.0
    #
    def self.option(name, params = {})
      on     = params[:on]
      class_eval <<-RUBY
        def #{name}
          options[:#{on}][:#{name}]
        end

        def #{name}=(value)
          options[:#{on}][:#{name}] = value
        end

        def #{name}?
          options[:#{on}].has_key?(:#{name})
        end
      RUBY
    end

    # Creates three methods for every option
    option :method,          :on => :authentication
    option :email,           :on => :authentication
    option :password,        :on => :authentication
    option :developer_token, :on => :authentication
    option :user_agent,      :on => :authentication
    option :environment,     :on => :service
    option :gzip,            :on => :connection
  end

end
