module SchedulePage
  def schedule_is(period, children)
    with_scope("##{period}_schedule") do
      all("table tr").size.should == children.size + 1
    end
    children.each do |child|
      with_scope("##{period}_schedule") do
        page.should have_content(child[:name])
      end
    end
  end
end

World(SchedulePage)
