namespace :db do
  desc "Import json file into ActiveRecord table"
  task :import, [:filename] => :environment do |task, args|
    file = File.read(args[:filename])
    data = JSON.parse(file)
    data.each do |d|
      pl = Player.new
      pl.name = d["Player"]
      pl.pos = d["Pos"]
      pl.att = d["Att"]
      pl.att_g = d["Att/G"]
      pl.yds = d["Yds"]
      pl.avg = d["Avg"]
      pl.yds_g = d["Yds/G"]
      pl.td = d["TD"]
      pl.lng = d["Lng"]
      pl.first = d["1st"]
      pl.first_p = d["1st%"]
      pl.twenty_plus = d["20+"]
      pl.forty_plus = d["40+"]
      pl.fum = d["FUM"]
      team = Team.find_or_create_by(abbr: d["Team"])
      pl.team = team
      pl.save
    end
  end
end
