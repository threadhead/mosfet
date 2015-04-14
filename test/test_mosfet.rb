require 'minitest_helper'

class TestMosfet < Minitest::Spec
  before do
    Timecop.freeze DateTime.new(2001, 2, 2, 0, 0, 0)
  end

  after do
    Timecop.return
  end


  let(:start_time) { DateTime.new(2001, 2, 2, 0, 0, 0) }
  let(:end_time) { DateTime.new(2001, 2, 2, 1, 0, 0) }


  def test_that_it_has_a_version_number
    refute_nil ::Mosfet::VERSION
  end


  it 'displays at date and time' do
    assert_equal Mosfet::TimeDisplay.new(start_time).to_s, 'Fri, February 2, 12am'
  end

  it 'displays the range with only time when stat and end are on same day' do
    assert_equal Mosfet::TimeDisplay.new(start_time, end_time).to_s, 'Fri, February 2, 12am — 1am'
  end


end
