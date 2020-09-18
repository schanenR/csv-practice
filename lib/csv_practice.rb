require 'csv'
require 'awesome_print'

#ID,Name,Sex,Age,Height,Weight,Team,NOC,Games,Year,Season,City,Sport,Event,Medal
# REQUIRED_OLYMPIAN_FIELDS = %w[ID Name Height Team Year City Sport Event Medal]
def get_all_olympic_athletes(filename)
  olympic_athletes = []
  total_data =  CSV.read(filename, headers: true).map {|row| row.to_h}
  total_data.each do |athlete|
    olympic_athletes << athlete.select {|key, value| REQUIRED_OLYMPIAN_FIELDS.include? (key)}
  end
  return olympic_athletes
end

# olympic data is an array of hashes

def total_medals_per_team(olympic_data)
  team_hash = {}

  olympic_data.each do |athlete|
    if team_hash.key? (athlete[:"Team"])
      team_hash[:"Team"] += athlete[:"Medal"]
    else
      team_hash[athlete[:"Team"]] = athlete[:"Medal"]
    end
  end

  return team_hash

end

def get_all_gold_medalists(olympic_data)
end
