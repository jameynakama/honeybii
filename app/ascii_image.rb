require 'rmagick'
require 'optparse'

class AsciiImage
  attr_accessor :raw

  def initialize(image_filename)
    @raw = Magick::ImageList.new(image_filename)[0]
  end

  def monochrome
    clone = self.clone
    clone.raw = clone.raw.quantize(2, Magick::GRAYColorspace)
    return clone
  end

  def monochrome!
    @raw = @raw.quantize(2, Magick::GRAYColorspace)
  end

  def chunk(chunk_size=12)
    chunk_columns = @raw.columns / chunk_size
    chunk_rows = @raw.rows / chunk_size
    chunks = []
    chunk_rows.times do |row_n|
      row = []
      chunk_columns.times do |col_n|
        row << @raw.crop(col_n * chunk_size, row_n * chunk_size, chunk_size, chunk_size)
      end
      chunks << row
    end
    return chunks
  end
end
