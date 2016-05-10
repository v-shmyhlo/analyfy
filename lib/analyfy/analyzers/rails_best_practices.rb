module Analyfy
  module Analyzers
    class RailsBestPractices < AbstractAnalyzer
      def run
        analyzer_options = {
          'format' => 'html',
          'output-file' => overview_file
        }

        analyzer = ::RailsBestPractices::Analyzer.new(options.target,
                                                      analyzer_options)
        analyzer.analyze
        analyzer.output
        analyzer.runner.errors.size
      end

      def output_dir
        File.join(options.output, 'rails_best_practices')
      end
    end
  end
end
