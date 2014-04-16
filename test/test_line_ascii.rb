require_relative '_test_helper'

class TestLineAscii < MiniTest::Test
  def setup
    @image = LineAscii.new('test/images/honeybees.jpg', 200)
  end

  def test_font_map_can_be_created
    assert @image.instance_variable_defined? :@font_map
  end

  def test_image_can_be_chunked
    # test image is 640 x 480, so chunking at default 12px should return chunk
    # array 53 columns x 40 rows
    chunks = @image.image_chunks
    assert_equal 53, chunks.first.size, 'image must have 53 column chunks'
    assert_equal 40, chunks.size, 'image must have 40 row chunks'
  end

  def test_image_can_be_grayscaled
    assert @image.grayscale.gray?, 'image was not converted to grayscale'
  end

  def test_image_can_be_converted_to_ascii
    refute @image.ascii.empty?
    assert @image.ascii.class == String, "ascii class must be String but was #{@image.ascii.class}"
  end
end
