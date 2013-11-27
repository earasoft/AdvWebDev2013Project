require 'test/unit'

class Has_title < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @controller = post_controller.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_has_title
    post title = 'Ruby Tutorial'
    assert_not_nil Has_title('Ruby Tutorial')

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail

    # To change this template use File | Settings | File Templates.
    fail('Not implemented')
  end
end