module EventsHelper
  def indexingEvents(event)
    if user_signed_in? 
       if event.creator.id == current_user.id 
        link_to 'Edit', edit_event_path(event)
       end
    end
  end

  def old_warning
     if @event.date < Date.today
        return "THIS IS AN OLD EVENT! YOU CAN'T ATTEND IT ANYMORE"
      end
  end
  
  def attendance_checker(user)
     if user_signed_in? && @event.created_by?(user) && !@event.is_included?(user) && @event.date > Date.today
      render 'attend'
    end
  end
end
