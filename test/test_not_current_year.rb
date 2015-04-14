require 'minitest_helper'

class TestMosfetNoCurrentYear < Minitest::Spec
  before do
    Timecop.freeze DateTime.new(2001, 2, 2, 0, 0, 0)
  end

  after do
    Timecop.return
  end


  let(:start_time) { DateTime.new(2002, 2, 2, 0, 0, 0) }
  let(:start_time_plus_minute) { DateTime.new(2002, 2, 2, 0, 1, 0) }
  let(:end_time) { DateTime.new(2002, 2, 2, 1, 0, 0) }
  let(:end_time_plus_day) { DateTime.new(2002, 2, 3, 1, 0, 0) }




  it 'displays at date and time' do
    assert_equal Mosfet::TimeDisplay.new(start_time).to_s, 'Sat, February 2, 2002, 12am'
  end

  it 'displays the range with only time when stat and end are on same day' do
    assert_equal Mosfet::TimeDisplay.new(start_time, end_time).to_s, 'Sat, February 2, 2002, 12am — 1am'
  end

  it 'displays the range in full when stat and end are on different days' do
    assert_equal Mosfet::TimeDisplay.new(start_time, end_time_plus_day).to_s, 'Sat, February 2, 2002, 12am — Sun, February 3, 2002, 1am'
  end

  it 'displays the hour only when no minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time).to_s, 'Sat, February 2, 2002, 12am'
  end

  it 'displays the hour plus minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time_plus_minute).to_s, 'Sat, February 2, 2002, 12:01am'
  end

  it 'displays the hour plus minutes if any time has minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time_plus_minute, end_time).to_s, 'Sat, February 2, 2002, 12:01am — 1:00am'
  end

end
