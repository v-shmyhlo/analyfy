module Analyfy
  module Analyzers
    class AbstractAnalyzer
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def analyze
        FileUtils.mkdir_p(output_dir) unless Dir.exist?(output_dir)
        run
        Launchy.open(overview_file)
      end

      private

      def run
        raise NotImplementedError
      end

      def output_dir
        raise NotImplementedError
      end

      def overview_file
        File.join(output_dir, 'overview.html')
      end
    end
  end
end
