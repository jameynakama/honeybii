require_relative '_test_helper'

class TestShadedImage < MiniTest::Test
  def setup
    @image = ShadedImage.new('tests/images/flower_bee.jpg')
  end

  def test_image_can_be_grayscaled_safe
    test_image_can_be_grayscaled { @image = @image.grayscale }
  end

  def test_image_can_be_grayscaled_dangerous
    test_image_can_be_grayscaled { @image.grayscale! }
  end

  def test_image_can_be_pixelated_safe
    # test image is 640 x 480, so pixelating at default 12px pointsize should
    # return image 53 x 40 pixels
    test_image_can_be_pixelated { @image = @image.pixelate }
  end

  def test_image_can_be_pixelated_dangerous
    # test image is 640 x 480, so pixelating at default 12px pointsize should
    # return image 53 x 40 pixels
    test_image_can_be_pixelated { @image.pixelate! }
  end

  private

  def test_image_can_be_grayscaled
    refute @image.raw.gray?, 'image must begin in color'
    assert @image.raw.number_colors > 256, 'image must begin with more than 256 colors'
    yield
    assert @image.raw.gray?, 'image was not converted to grayscale'
    assert @image.raw.number_colors <= 256, 'image must have fewer than 256 colors'
  end

  def test_image_can_be_pixelated
    # test image is 640 x 480, so pixelating at default 12px pointsize should
    # return image 53 x 40 pixels
    yield
    assert_equal [53, 40], [@image.raw.columns, @image.raw.rows]
  end
end
