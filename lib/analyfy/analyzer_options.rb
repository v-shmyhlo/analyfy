module Analyfy
  class AnalyzerOptions
    def initialize(output:, target:)
      @output = output
      @target = target
    end

    attr_reader :output, :target
  end
end
