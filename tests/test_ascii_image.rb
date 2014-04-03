require_relative 'helper'
require_relative '../app/ascii_image'

class TestAsciiImage < MiniTest::Test
  def setup
    @image = AsciiImage.new('tests/test_pattern.gif')
  end

  def test_image_can_be_grayscaled
    refute @image.raw.gray?, 'image must begin in color'
    @image = @image.grayscale
    assert @image.raw.gray?, 'image was not converted to black and white'
  end

  def test_image_can_be_grayscaled_dangerous
    refute @image.raw.gray?, 'image must begin in color'
    @image.grayscale!
    assert @image.raw.gray?, 'image was not converted to black and white'
  end
end
