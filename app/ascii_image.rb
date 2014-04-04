require 'rmagick'

class AsciiImage
  attr_accessor :raw
  attr_accessor :shades
  attr_accessor :ascii

  def initialize(image_filename, point_size)
    @raw = Magick::ImageList.new(image_filename)[0]
    @point_size = point_size
    @ascii = Array.new
  end

  def to_s
    unless @ascii.empty?
      @ascii.map { |row| row.join }.join("\n")
    else
      super
    end
  end
end
