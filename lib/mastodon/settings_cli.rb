# frozen_string_literal: true

require_relative '../../config/boot'
require_relative '../../config/environment'
require_relative 'cli_helper'

module Mastodon
  class SettingsCLI < Thor
    option :open, type: :boolean
    option :close, type: :boolean
    desc 'registrations', 'Control registrations'
    long_desc <<-LONG_DESC
      Open or close registrations by providing either
      the --open or --close options
    LONG_DESC
    def registrations
      if options[:open]
        Setting.open_registrations = true
        say('OK', :green)
      elsif options[:close]
        Setting.open_registrations = false
        say('OK', :green)
      else
        say('No options given. Use either --open or --close', :red)
        exit(1)
      end
    end
  end
end
