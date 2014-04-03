require 'minitest/autorun'
require_relative '../app/ascii_image'

class TestAsciiImage < MiniTest::Test
  def setup
    @image = AsciiImage.new('tests/test_pattern.gif')
  end

  def test_image_can_be_created
  end

  def test_image_can_be_grayscaled
    @image.grayscale
  end
end
