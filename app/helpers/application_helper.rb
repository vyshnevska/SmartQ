module ApplicationHelper
  def notifications(msgs, type = :success)
    msgs.collect{ |name, msg| msg if name == type.to_s}.join(' ') if msgs[type.to_s]
  end

end
