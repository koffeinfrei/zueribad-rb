# encoding: utf-8

# koffeinfrei zueribad-rb
# copyright (C) 2011 alexis reigel
#
# license: gpl v3

module Zueribad
  class Application

    def baths
      if @baths.nil?
        if options.has_key?(:name)
          @baths = Bath.fetch(options[:name])
        else
          @baths = Bath.fetch
        end
      end
      @baths
    end

    def options
      if @options.nil?
        @options = {}
        OptionParser.new do |opts|
          opts.banner = "Usage: #{$0} [options]"

          opts.on("-n", "--name NAME", "Specify a bath name or any fragment of it") do |name|
            options[:name] = name
          end
          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            exit
          end
        end.parse!
      end
      @options
    end

    def max_lengths
      {
        :name => baths.collect{ |x| x.name }.sort_by(&:length).last.length,
        :open_status => baths.collect{ |x| x.open_status }.sort_by(&:length).last.length
      }
    end
  end
end
