require 'rubycritic'
require 'rubycritic/cli/options'
require 'rubycritic/command_factory'
require 'brakeman'
require 'rails_best_practices'
require 'launchy'

module Analyfy
  class Core
    OUTPUT_DIR = 'output'.freeze
    RUBYCRITIC_DIR = 'rubycritic'.freeze
    SCAN_TARGET = 'app'.freeze

    def initialize
      Dir.mkdir(OUTPUT_DIR) unless Dir.exist?(OUTPUT_DIR)

      brakeman
      rails_best_practices
      rubycritic
    end

    private

    def brakeman
      output_file = File.join(OUTPUT_DIR, 'brakeman.html')
      options = {
        app_path: '.',
        quiet: :command_line,
        print_report: true,
        output_formats: [:to_html],
        output_files: [output_file]
      }
      Brakeman.run options
      Launchy.open output_file
    end

    def rubycritic
      options = {
        mode: nil,
        root: File.join(OUTPUT_DIR, RUBYCRITIC_DIR),
        format: 'html',
        deduplicate_symlinks: false,
        paths: [SCAN_TARGET],
        suppress_ratings: false,
        help_text: '',
        minimum_score: 0,
        no_browser: true
      }
      reporter = Rubycritic::CommandFactory.create(options).execute
      print(reporter.status_message)
      reporter.status
      Launchy.open File.join(OUTPUT_DIR, RUBYCRITIC_DIR, 'overview.html')
    end

    def rails_best_practices
      output_file = File.join(OUTPUT_DIR, 'rails_best_practices.html')
      options = {
        'format' => 'html',
        'output-file' => output_file
      }
      analyzer = RailsBestPractices::Analyzer.new(SCAN_TARGET, options)
      analyzer.analyze
      analyzer.output
      analyzer.runner.errors.size
      Launchy.open(output_file)
    end
  end
end
