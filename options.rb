require './environment'

def get_opts
  options = {}
  option_parser = OptionParser.new do |opts|
    executable_name = File.basename("pipetweet.rb")
    opts.banner = "Run a command, tweet its output

    Usage: #{executable_name} [options]
    "

    opts.on("-i INTERVAL", "--interval",
            "Interval between tweets (default=15)") do |i|

      unless i.to_i == 0
        options[:interval] = i.to_i
      else
        raise TypeError, "Interval must be a number"
      end
    end
  end

  option_parser.parse!
  options
end
