module RSpec
  module Matchers
    def each(expected)
      Matcher.new :each, expected do |_expected_|
        match do |actual|
          actual.all? { |element| _expected_.matches?(element) }
        end

        description do
          "all items #{_expected_.description}"
        end

        failure_message_for_should do |actual|
          "expected each element of #{actual.inspect} to #{_expected_.description}"
        end
      end
    end
  end
end

