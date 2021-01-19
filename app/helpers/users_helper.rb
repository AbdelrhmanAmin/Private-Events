module UsersHelper
  def hosting
    @user.events.each do |e|
      return e.title if e.date >= Date.today
    end
  end

  def hosted
    @user.events.each do |e|
      return e.title if e.date < Date.today
    end
  end
end
