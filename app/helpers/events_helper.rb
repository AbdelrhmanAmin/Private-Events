# rubocop:disable Style/GuardClause
module EventsHelper
  def editing_events(event)
    link_to 'Edit', edit_event_path(event) if user_signed_in? && event.creator.id == current_user.id
  end

  def old_warning
    return "THIS IS AN OLD EVENT! YOU CAN'T ATTEND IT ANYMORE" if @event.date < Date.today
  end

  def attendance_checker(user)
    if user_signed_in? && @event.created_by?(user) && !@event.included?(user) && @event.date > Date.today
      render 'attend'
    end
  end
end
# rubocop:enable Style/GuardClause
