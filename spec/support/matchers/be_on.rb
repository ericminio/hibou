require 'chronic'

module RSpec
  module Matchers
    def be_on(expected)
      Matcher.new :be_on, expected do |_expected_|
        match do |actual|
          match_date(actual) && match_period(actual)
        end

        chain :after_noon do
          @period = 'PM'
        end

        chain :before_noon do
          @period = 'AM'
        end

        description do
          "be on #{to_date(_expected_)} #@period"
        end

        failure_message_for_should do |actual|
          "expected #{actual.inspect} to be on #{to_date(_expected_)} #@period"
        end

        define_method :match_date do |actual|
          to_date(_expected_) == actual.date
        end

        define_method :match_period do |actual|
          actual.period == @period
        end

        def to_date(date_or_string)
          date_or_string.instance_of?(String) ? Chronic.parse(date_or_string).to_date : expected
        end
      end
    end
  end
end

