When /^Marina looks at the scoreboard$/ do
  # scoreboard is always visible
end

Then /^Marina notices that the score is ([^\"]*)$/ do |score|
  shows_score_is(score)
end



