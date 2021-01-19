module UsersHelper
  def hosting
     @user.events.each do |e| 
        if e.date >= Date.today 
          return e.title
        end
     end 
  end
  def hosted
     @user.events.each do |e| 
        if e.date < Date.today 
          return e.title
        end
     end 
  end
end
