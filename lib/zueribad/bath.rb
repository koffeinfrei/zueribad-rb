# encoding: utf-8

# koffeinfrei zueribad-rb
# copyright (C) 2011 alexis reigel
#
# license: gpl v3

module Zueribad
  class Bath

    SERVICE_URL = 'https://www.stadt-zuerich.ch/stzh/bathdatadownload'

    attr_accessor :name
    attr_accessor :temperature
    attr_accessor :open_status
    attr_accessor :modified_at

    def initialize(params = {})
      params.each do |k,v|
        if respond_to? k
          instance_variable_set("@#{k}".to_sym, v)
        end
      end
    end

    def self.fetch(name = nil)
      doc = Nokogiri::Slop(self.download)

      baths = doc.bathinfos.baths.bath.map do |x|
        Bath.new(:name => x.title.content,
                 :temperature => x.temperatureWater.content,
                 :open_status => x.openClosedTextPlain.content,
                 :modified_at => x.dateModified.content)
      end

      if name
        baths.select {|x| x.name =~ /#{name}/i}
      else
        baths
      end
    end

    def self.download
      open(SERVICE_URL).read
    end
  end
end
