module Analyfy
  module Analyzers
    class RubyCritic < AbstractAnalyzer
      def run
        analyzer_options = {
          mode: nil,
          root: output_dir,
          format: 'html',
          deduplicate_symlinks: false,
          paths: [options.target],
          suppress_ratings: false,
          help_text: '',
          minimum_score: 0,
          no_browser: true
        }

        reporter = ::Rubycritic::CommandFactory
                   .create(analyzer_options)
                   .execute
        print(reporter.status_message)
        reporter.status
      end

      def output_dir
        File.join(options.output, 'rubycritic')
      end
    end
  end
end
