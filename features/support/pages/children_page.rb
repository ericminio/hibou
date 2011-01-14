module ChildrenPage
  def open_child_registration
    find('#add_child a').click
  end
  
  def open_child_file(first_name, last_name)
    child = Child.find_by_first_name_and_last_name(first_name, last_name)
    find("#child_#{child.id} .show").click
  end
end

World(ChildrenPage)