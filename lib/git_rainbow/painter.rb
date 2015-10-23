module GitRainbow::Painter
  extend self

  def paint(message)
    palette = build_palette(message.size)

    message.chars.map { |ch| colorize(char, palette.shift) }.join("")
  end

  def build_palette(size)
    []
  end

  def colorize(char, color)
    "\e[32m#{char}\e[0m"
  end
end
