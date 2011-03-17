module SiteHelpers
  def shows_score_is(score)
    within("#scoreboard") do
      page.should have_content(score)
    end
  end
end

World(SiteHelpers)