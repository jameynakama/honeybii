class ShadedAscii < AsciiImage
  class << self
    attr_accessor :gradients
  end

  @gradients = [
    ['M', 'N', 'H', 'K', 'b', 'X', '6', 'Y', 'j', 'i', '+', '!', ':', '\'', '.', ' '],
    ['@', '%', '8', '#', '$', 'V', 'Y', 'x', '*', '=', '+', ':', '~', '-', '.', ' '],
    ['M', 'H', 'b', '6', 'j', '+', ':', ' '],
    ['@', '8', 'O', 'o', ':', '.', ' '],
    ['8', 'O', 'o', ':', '.', ' '],
    ['#', '+', ':', ' '],
  ]

  def initialize(image_filename, point_size = 12, gradient_level: 0)
    super image_filename, point_size
    @gradient = ShadedAscii.gradients[gradient_level]
    to_ascii!
  end

  def grayscale!
    @raw = @raw.quantize(256, Magick::GRAYColorspace)
  end

  def pixelate!
    columns = @raw.columns / @point_size
    rows = @raw.rows / (@point_size * 2)
    @raw.resize!(columns, rows)
  end

  def to_ascii!
    grayscale!
    pixelate!

    ascii_array = Array.new(@raw.rows).collect do |row|
      Array.new(@raw.columns)
    end
    
    @raw.each_pixel do |pixel, col, row|
      index = (((@gradient.size - 1) * pixel.intensity).to_f / 65535.to_f).round
      ascii_array[row][col] = @gradient[index]
    end

    @ascii = ascii_array.map { |row| row.join }.join("\n")
  end
end
