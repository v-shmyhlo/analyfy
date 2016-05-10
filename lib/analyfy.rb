require 'rubycritic'
require 'rubycritic/cli/options'
require 'rubycritic/command_factory'
require 'brakeman'
require 'rails_best_practices'
require 'launchy'

module Analyfy
  autoload :CLI, 'analyfy/cli'
  autoload :VERSION, 'analyfy/version'
  autoload :Core, 'analyfy/core'
  autoload :Analyzers, 'analyfy/analyzers'
  autoload :AnalyzerOptions, 'analyfy/analyzer_options'
end
