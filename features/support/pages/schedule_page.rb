module SchedulePage
  def schedule_contains(period, children)
    children.each do |child|
      with_scope("##{period}_schedule") do
        page.should have_content(child[:name])
      end
    end
  end
end

World(SchedulePage)