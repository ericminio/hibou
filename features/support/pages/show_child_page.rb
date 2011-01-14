module ShowChildPage
  def shows_child_first_name_is(first_name)
    with_scope('#first_name') do
      page.should have_content(first_name)
    end
  end

  def shows_child_last_name_is(last_name)
    with_scope('#last_name') do
      page.should have_content(last_name)
    end
  end

  def shows_child_was_born_on(birth_date)
    with_scope('#birth_date') do
      page.should have_content(I18n.l(Date.parse(birth_date), :format => :medium))
    end
  end

  def shows_child_is_allergic_to(allergies)
    with_scope('#allergies') do
      page.should have_content(allergies)
    end
  end

  def shows_child_takes_a_bottle(expects = :yes)
    with_scope('#bottle') do
      page.should have_content(I18n.t(expects))
    end
  end

  def shows_child_takes_a_snack(expects = :yes)
    with_scope('#snack') do
      page.should have_content(I18n.t(expects))
    end
  end

  def shows_child_needs_a_nap(needs = :yes)
    with_scope('#nap') do
      page.should have_content(I18n.t(needs))
    end
  end

  #todo scope
  def shows_child_public_note(note)
    page.should have_content(note)
  end

  def shows_child_private_note(note)
    page.should have_content(note)
  end
end

World(ShowChildPage)