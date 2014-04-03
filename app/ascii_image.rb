require 'rmagick'
require 'optparse'

class AsciiImage
  attr_accessor :raw

  def initialize(image_filename)
    @raw = Magick::ImageList.new(image_filename)[0]
  end

  def grayscale
    clone = self.clone
    clone.raw = clone.raw.quantize(2, Magick::GRAYColorspace)
    return clone
  end

  def grayscale!
    @raw = @raw.quantize(2, Magick::GRAYColorspace)
  end
end
