require_relative '_test_helper'

class TestShadedAscii < MiniTest::Test
  def setup
    @image = ShadedAscii.new('test/images/flower_bee.jpg')
  end

  def test_image_can_be_grayscaled
    assert @image.raw.gray?, 'image was not converted to grayscale'
  end

  def test_image_can_be_pixelated
    # test image is 640 x 480, so pixelating at default 12px pointsize should
    # return image 53 x 40 pixels
    assert_equal [53, 40], [@image.raw.columns, @image.raw.rows]
  end

  def test_image_can_be_converted_to_ascii
    refute @image.ascii.empty?
  end
end
