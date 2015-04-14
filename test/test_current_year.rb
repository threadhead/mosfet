require 'minitest_helper'

class TestMosfetCurrentYear < Minitest::Spec
  before do
    Timecop.freeze DateTime.new(2001, 2, 2, 0, 0, 0)
  end

  after do
    Timecop.return
  end


  let(:start_time) { DateTime.new(2001, 2, 2, 0, 0, 0) }
  let(:start_time_plus_minute) { DateTime.new(2001, 2, 2, 0, 1, 0) }
  let(:end_time) { DateTime.new(2001, 2, 2, 1, 0, 0) }
  let(:end_time_plus_day) { DateTime.new(2001, 2, 3, 1, 0, 0) }


  def test_that_it_has_a_version_number
    refute_nil ::Mosfet::VERSION
  end


  it 'displays at date and time' do
    assert_equal Mosfet::TimeDisplay.new(start_time).to_s, 'Fri, February 2, 12am'
  end

  it 'displays the range with only time when stat and end are on same day' do
    assert_equal Mosfet::TimeDisplay.new(start_time, end_time).to_s, 'Fri, February 2, 12am — 1am'
  end

  it 'displays the range in full when stat and end are on different days' do
    assert_equal Mosfet::TimeDisplay.new(start_time, end_time_plus_day).to_s, 'Fri, February 2, 12am — Sat, February 3, 1am'
  end

  it 'displays the hour only when no minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time).to_s, 'Fri, February 2, 12am'
  end

  it 'displays the hour plus minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time_plus_minute).to_s, 'Fri, February 2, 12:01am'
  end

  it 'displays the hour plus minutes if any time has minutes' do
    assert_equal Mosfet::TimeDisplay.new(start_time_plus_minute, end_time).to_s, 'Fri, February 2, 12:01am — 1:00am'
  end



  it 'does not abbreviate month' do
    assert_equal Mosfet::TimeDisplay.new(start_time).abbr_month(false).to_s, 'Fri, February 2, 12am'
  end

  it 'abbreviates month' do
    assert_equal Mosfet::TimeDisplay.new(start_time).abbr_month(true).to_s, 'Fri, Feb 2, 12am'
    assert_equal Mosfet::TimeDisplay.new(start_time).abbr_month.to_s, 'Fri, Feb 2, 12am'
  end




  it 'shows weekday' do
    assert_equal Mosfet::TimeDisplay.new(start_time).show_weekday.to_s, 'Fri, February 2, 12am'
  end

  it 'hides weekday weekday' do
    assert_equal Mosfet::TimeDisplay.new(start_time).show_weekday(false).to_s, 'February 2, 12am'
    assert_equal Mosfet::TimeDisplay.new(start_time).hide_weekday.to_s, 'February 2, 12am'
  end

  it 'does not abbreviate weekday' do
    assert_equal Mosfet::TimeDisplay.new(start_time).abbr_weekday(false).to_s, 'Friday, February 2, 12am'
  end

end
