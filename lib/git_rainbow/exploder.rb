module GitRainbow
  extend self

  def explode!
    if message
      exec command
    else
      puts usage!
    end
  end

  def usage!
    'USAGE: git rainbow -m "Your message here!"'
  end

  def command
    %Q{ git commit #{ammend? ? '--amend' : ''} -m "#{Painter.paint(message)}" }
  end

  def message
    ARGV.each_with_index do |arg, i|
      if arg == "-m" || arg == "--message"
        return ARGV[i+1]
      end
    end

    nil
  end

  def ammend?
    ARGV.include?("--amend")
  end
end
