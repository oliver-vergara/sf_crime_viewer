require "sf_crime_viewer/version"
require "unirest"

module SfCrimeViewer
  class Viewer
    
    attr_reader :category, :address, :date, :time, :description, :resolution

    def initialize(hash)
      @category = hash["category"]
      @address = hash["address"]
      @date = hash["date"]
      @time = hash["time"]
      @description = hash["descript"]
      @resolution = hash["resolution"]
    end

    def self.all 
      crimes_array = Unirest.get("https://data.sfgov.org/resource/gxxq-x39z.json").body
      crimes = []
      crimes_array.each do |crime_hash|
        crimes << Viewer.new(crime_hash)
      end
      return crimes
    end
  end
end
