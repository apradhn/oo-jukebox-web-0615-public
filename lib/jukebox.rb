require "pry"

class Jukebox
  attr_reader :songs
  def initialize(songs)
    @songs = songs
  end

  def call
    command = gets.strip
    case command
    when "help"
      help
    when "list"
      list
    when "play"
      play
    else
      if command.start_with?("play")
        play(command.delete("play ").gsub("-", " - "))
      end
    end
  end

  def help
    puts "help = help"
    puts "list = list"
    puts "play = play"
    puts "exit = exit"
  end

  def list
    @songs.each do |song|
      puts song
    end
  end

  def play(request="")
    if request.empty?
      command = gets.strip
      if number?(command)
        puts "Now Playing: #{@songs[command.to_i-1]}"
      else
        puts "Now Playing: #{command}"
      end
    else
      if number?(request)
        puts "Now Playing: #{@songs[request.to_i-1]}"
      else
        puts "Now Playing: #{request}"
      end
    end

  end

  def number?(string)
    string == string.to_i.to_s
  end

end
