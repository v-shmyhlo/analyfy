module Analyfy
  module Analyzers
    class Brakeman < AbstractAnalyzer
      def run
        analyzer_options = {
          app_path: options.target,
          quiet: :command_line,
          print_report: true,
          output_formats: [:to_html],
          output_files: [overview_file]
        }

        ::Brakeman.run analyzer_options
      end

      def output_dir
        File.join(options.output, 'brakeman')
      end
    end
  end
end
