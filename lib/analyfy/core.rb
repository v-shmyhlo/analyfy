module Analyfy
  class Core
    def initialize(options)
      @options = options
      @analyzers = [
        Analyzers::Brakeman.new(@options),
        Analyzers::RailsBestPractices.new(@options),
        Analyzers::RubyCritic.new(@options)
      ]
    end

    def run
      @analyzers.each(&:analyze)
    end
  end
end
