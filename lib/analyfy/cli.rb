require 'commander'

module Analyfy
  class CLI
    include Commander::Methods

    def run
      program :name, Analyfy
      program :version, Analyfy::VERSION
      program :description, 'Rails code analyzer bundle'

      default_command :analyze

      command :analyze do |c|
        c.option '-O', '--output DIR', String, 'Output directory'
        c.option '-T', '--target DIR', String, 'Target directory'
        c.description = 'Analyze rails project using all analyzers'
        c.action do |args, options|
          options.default output: './analyfy_output', target: '.'

          output = File.expand_path(options.output)
          target = options.target

          analyzer_options = AnalyzerOptions.new(output: output,
                                                 target: target)
          Core.new(analyzer_options).run
        end
      end

      run!
    end
  end
end
