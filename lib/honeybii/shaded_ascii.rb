class ShadedAscii < AsciiImage
  class << self
    attr_accessor :gradients
    attr_accessor :styles
  end

  @gradients = [
    ['@', '%', '8', '#', '$', 'V', 'Y', 'x', '*', '=', '+', ':', '~', '-', '.', ' ', ' '],
    ['8', 'O', 'o', ':', '.', ' ', ' '],
    ['#', '+', ':', ' ', ' '],
    ['0', '1', ' ', ' '],
  ]
  @styles = [ 'relative', 'one_to_one' ]

  def initialize(image_filename, point_size = 12, gradient: 0, style: 'relative')
    super image_filename, point_size
    raise ArgumentError, "style must be one of the following: #{ShadedAscii.styles}" unless ShadedAscii.styles.include? style
    @gradient = ShadedAscii.gradients[gradient]
    @style = style
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

  def get_intensity_range
    pixels = @raw.get_pixels 0, 0, @raw.columns, @raw.rows
    intensities = pixels.map { |p| p.intensity }
    lightest_intensity = intensities.inject do |lightest, obj|
      obj > lightest ? lightest : obj
    end
    heaviest_intensity = intensities.inject do |heaviest, obj|
      obj < heaviest ? heaviest : obj
    end
    return [lightest_intensity, heaviest_intensity]
  end

  def to_ascii!
    grayscale!
    pixelate!

    ascii_array = Array.new(@raw.rows).collect do |row|
      Array.new(@raw.columns)
    end
    
    gradient_size = (@gradient.size - 1).to_f

    if @style == 'relative'
      intensity_range = get_intensity_range
      range_max = intensity_range[1] - intensity_range[0]
      @raw.each_pixel do |pixel, col, row|
        index = (gradient_size * (pixel.intensity - intensity_range[0]) / range_max).round
        ascii_array[row][col] = @gradient[index]
      end
    elsif @style == 'one_to_one'
      range_max = 65535.to_f
      @raw.each_pixel do |pixel, col, row|
        index = (gradient_size * pixel.intensity / range_max).round
        ascii_array[row][col] = @gradient[index]
      end
    end

    @ascii = ascii_array.map { |row| row.join }.join("\n")
  end
end
