require "alisms/version"
require "alisms/util"
require "alisms/client"
require "alisms/util/configuration"
require 'forwardable'
require 'faraday'

module Alisms
  extend SingleForwardable

  def_delegators :configuration, :appcode, :sign_name, :template_code

  def self.configure(&block)
    yield configuration
  end

  def self.configuration
    @configuration ||= Util::Configuration.new
  end

  private_class_method :configuration
  # Your code goes here...
end
