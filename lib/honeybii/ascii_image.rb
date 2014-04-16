require 'RMagick'

class AsciiImage
  attr_accessor :raw
  attr_accessor :ascii

  def initialize(image_filename, point_size)
    @raw = Magick::ImageList.new(image_filename).first
    @point_size = point_size
    @ascii = ''
  end

  def grayscale
    raw_clone = @raw.clone
    raw_clone = raw_clone.quantize(256, Magick::GRAYColorspace)
    return raw_clone
  end

  def grayscale!
    @raw = @raw.quantize(256, Magick::GRAYColorspace)
  end

  def to_s
    unless @ascii.empty?
      @ascii
    else
      super
    end
  end
end
