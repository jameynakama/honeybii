require 'rmagick'
require 'optparse'

class AsciiImage
  def initialize(image_filename)
    @raw_image = Magick::ImageList.new(image_filename)[0]
  end
end
