require "tco"

module GitRainbow::Painter
  extend self

  def paint(message)
    palette = build_palette(message.size)
    message.chars.map { |ch| colorize(ch, palette.shift) }.join("")
  end

  def colorize(char, color)
    Tco.fg(color, char)
  end

  def build_palette(size)
    size.times.map do |i|
      # we're basically generating a bunch of sine wave sequences
      # with a PI/2 phase shift between them to represent RGB colors
      red   = wave_value_at(i, size: size, phase:  Math::PI/2 - 1)
      green = wave_value_at(i, size: size, phase:  0          - 1)
      blue  = wave_value_at(i, size: size, phase: -Math::PI/2 - 1)
      "##{red}#{green}#{blue}"
    end
  end

  def wave_value_at(i, size: 1, phase: 0)
    sin = Math.sin(Math::PI / size * 4 * i + phase) # pure sin -1..+1 value
    int = sin * 127 + 128 # 0..255 value
    "%02x" % int # 2 symbols hex
  end
end
