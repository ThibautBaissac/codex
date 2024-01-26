namespace :journal_og do
  task add_year: :environment do
    last_year = nil
    File.open("resources/journal_og.txt", "r+") do |file|
      lines = file.each_line.to_a
      file.rewind
      file.truncate(0)
      lines.each do |line|
        if line =~ /^\d{4}$/
          last_year = line.strip
          puts last_year
        elsif line =~ /^\d{1,2} \w+$/
          line = line.strip + " " + last_year
          puts line
        end
        file.puts line
      end
    end
  end

  task remove_lines_with_year_only: :environment do
    filename = "resources/journal_og.txt"
    File.open(filename, "r+") do |file|
      lines = file.readlines
      file.rewind
      lines.each do |line|
        file.puts(line) unless line.strip =~ /^\d{4}$/
      end
      file.truncate(file.pos)
    end
  end

  task create_writings: :environment do
    require "date"

    file_path = "resources/journal_og.txt"
    artist = Artist.first
    content = ""
    date = nil

    File.readlines(file_path).each do |line|
      if line =~ /^\d{4}-\d{2}-\d{2}$/
        unless date.nil?
          artist.writings.create(date:, content: content.strip)
          content = ""
        end
        date = Date.strptime(line.strip, "%Y-%m-%d")
      else
        content += line
      end
    end

    # Create the last writing
    artist.writings.create(date:, content: content.strip) unless date.nil?
  end
end
