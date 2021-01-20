module UsersHelper
  def hosting(events)
    events.each do |e|
      return e.title if e.date >= Date.today
    end
  end

  def hosted(events)
    events.each do |e|
      return e.title if e.date < Date.today
    end
  end
end
