require_relative '_test_helper'

class TestLineImage < MiniTest::Test
  def setup
    @image = LineImage.new('test/images/honeybees.jpg')
  end

  def test_image_can_be_monochromed
    refute @image.raw.gray?, 'image must begin in color'
    @image = @image.monochrome
    assert @image.raw.gray?, 'image was not converted to black and white'
  end

  def test_image_can_be_monochromed_dangerous
    refute @image.raw.gray?, 'image must begin in color'
    @image.monochrome!
    assert @image.raw.gray?, 'image was not converted to black and white'
  end

  def test_image_can_be_chunked
    # test image is 640 x 480, so chunking at default 12px should return chunk
    # array 53 columns x 40 rows
    chunks = @image.chunks
    assert_equal 53, chunks.first.size, 'image must have 53 column chunks'
    assert_equal 40, chunks.size, 'image must have 40 row chunks'
  end
end
