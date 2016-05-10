module Analyfy
  module Analyzers
    autoload :AbstractAnalyzer, 'analyfy/analyzers/abstract_analyzer'
    autoload :Brakeman, 'analyfy/analyzers/brakeman'
    autoload :RailsBestPractices, 'analyfy/analyzers/rails_best_practices'
    autoload :RubyCritic, 'analyfy/analyzers/ruby_critic'
  end
end
