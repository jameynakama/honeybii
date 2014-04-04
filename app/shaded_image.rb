require 'rmagick'
require_relative 'ascii_image'

class ShadedImage < AsciiImage
  attr_accessor :raw

  def initialize(image_filename, point_size = 12)
    super image_filename, point_size
    @raw = Magick::ImageList.new(image_filename).first
    @shades = ['@', '%', '8', '#', '$', 'V', 'Y', 'x', '*', '=', '+', ':', '~', '-', '.', ' ']
  end

  def grayscale
    clone = self.clone
    clone.raw = clone.raw.quantize(256, Magick::GRAYColorspace)
    return clone
  end

  def grayscale!
    @raw = @raw.quantize(256, Magick::GRAYColorspace)
  end

  def pixelate
    columns = @raw.columns / @point_size
    rows = @raw.rows / @point_size
    clone = self.clone
    clone.raw = clone.raw.resize_to_fit(columns, rows)
    return clone
  end

  def pixelate!
    columns = @raw.columns / @point_size
    rows = @raw.rows / @point_size
    @raw = @raw.resize_to_fit(columns, rows)
  end

  def to_ascii
    grayscale!
    pixelate!

    result = Array.new(@raw.rows).collect do |row|
      Array.new(@raw.columns)
    end
    
    @raw.each_pixel do |pixel, col, row|
      index = (((@shades.size - 1) * pixel.intensity).to_f / 65535.to_f).round
      char = @shades[index]
      result[row][col] = char
    end

    result.each do |row|
      row.each do |char|
        print char
      end
      print "\n"
    end
  end
end
