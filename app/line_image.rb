# NOT DONE
require 'rmagick'
require_relative 'ascii_image'

class LineImage < AsciiImage
  attr_accessor :raw

  def initialize(image_filename, point_size = 12)
    # make translations from font to char size
    # e.g., 12pt is actually 8x14 or something
    # so figure out a few (6, 8, 10, 12, 14, 16, 24, 72?)
    # use CenterGravity and a slightly larger view than the font size
    super image_filename, point_size
    @chars = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m n o p q r s t u v w x y z
1 2 3 4 5 6 7 8 9 0]
    @chars += ['~', '`', '-', '_', '=', '+', '[', '{', ']', '}', '\\\\', '|']
    @chars += [';', ':', '\'', '"', ',', '<', '.', '>', '/', '?']
  end

  def monochrome
    clone = self.clone
    clone.raw = clone.raw.quantize(2, Magick::GRAYColorspace)
    return clone
  end

  def monochrome!
    @raw = @raw.quantize(2, Magick::GRAYColorspace)
  end

  def chunks()
    chunk_columns = @raw.columns / @point_size
    chunk_rows = @raw.rows / @point_size
    chunks = []
    chunk_rows.times do |row_n|
      row = []
      chunk_columns.times do |col_n|
        row << @raw.crop(col_n * @point_size, row_n * @point_size, @point_size, @point_size, true)
      end
      chunks << row
    end
    return chunks
  end
end
