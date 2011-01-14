module NavigationHelpers

  def go_to(page_name)
    visit path_to(page_name.to_s.gsub(/_/, ' '))
  end

  def path_to(page_name)
    case page_name

      when /(the )?home\s?page/
        '/'
      when /child registration page/
        new_child_path
      when /children page/
        children_path
      when /new booking page/
        new_booking_path
      when /bookings/
        bookings_path
      when /today's schedule page/
        schedule_path(Date.today.to_s(:db))
      when /(the )?registration page/
        new_user_registration_path
      when /(the )?login page/
        new_user_session_path


      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))

      else
        begin
          page_name =~ /the (.*) page/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue Object => e
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                    "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)
