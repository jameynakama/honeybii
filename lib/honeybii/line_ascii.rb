class LineAscii < AsciiImage
  attr_accessor :raw
  attr_accessor :font_map
  attr_accessor :image_chunks

  def initialize(image_filename, point_size = 12)
    # make translations from font to char size
    # e.g., 12pt is actually 8x14 or something
    # so figure out a few (6, 8, 10, 12, 14, 16, 24, 72?)
    # use CenterGravity and a slightly larger view than the font size
    super image_filename, point_size
    @chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890~`-_=+[{]}|;:'\",<.>/? "
    set_font_map!
    edge_image!
    chunk_image!
    @ascii = to_ascii
  end

  def edge_image!
    grayscale!
    @raw.write('gray-fart.png')
    #@raw = @raw.edge(5)
    #@raw = @raw.negate
    @raw.write('edge-fart.png')
  end

  def set_font_map!
    @font_map = []
    @chars.each_char.with_index do |c,i|
      letter = Magick::Image.new(@point_size, @point_size)
      text = Magick::Draw.new
      text.font_family = 'Courier New'
      text.pointsize = @point_size
      text.gravity = Magick::CenterGravity
      letter.annotate(text, @point_size, @point_size, 0, 0, c)
      @font_map << letter
    end
  end

  def chunk_image!
    chunk_columns = @raw.columns / @point_size
    chunk_rows = @raw.rows / @point_size
    @image_chunks = []
    chunk_rows.times do |row_n|
      row = []
      chunk_columns.times do |col_n|
        row << @raw.crop(col_n * @point_size, row_n * @point_size, @point_size, @point_size, true)
      end
      @image_chunks << row
    end
  end

  def to_ascii
    ascii = ''
    @image_chunks.each.with_index do |row,y|
      row.each.with_index do |chunk,x|
        closest_match = @font_map.inject do |closest, char|
          char.difference(chunk)[1] < closest.difference(chunk)[1] ? char : closest
        end
        index = @font_map.find_index(closest_match)
        ascii += @chars[index]
      end
      ascii += "\n"
    end
    return ascii
  end
end
