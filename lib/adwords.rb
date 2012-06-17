# encoding: utf-8
require "config"

module Adwords

  VERSION = :v201109

  # Sets Adwords configuration options.
  #
  # @examples
  #
  #   Adwords.configure do |config|
  #     config.environment = 'sandbox'
  #   end
  #
  # @return [Config] The configuration
  #
  # @since 1.0.0
  #
  def self.configure
    block_given? ? yield(Config) : Config
  end

  # Checks that SANDBOX is set
  #
  # @example
  #
  #   puts 'Sandbox is set' if Adwords.sandbox?
  #
  # @return [true, false]
  #
  # @since 1.0.0
  #
  def self.sandbox?
    configure.environment == 'SANDBOX'
  end

  # Checks that PRODUCTION is set
  #
  # @example
  #
  #   puts 'Production is set' if Adwords.production?
  #
  # @return [true, false]
  #
  # @since 1.0.0
  #
  def self.production?
    configure.environment == 'PRODUCTION'
  end

end
