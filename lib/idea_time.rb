class Time
  def idea_at
    "#{strftime("%d").to_i.ordinalize} #{strftime("%b")} at #{strftime("%I.%M %p")}"
  end

  def idea_date
    "#{strftime("%d").to_i.ordinalize} #{strftime("%b")}'#{strftime("%y")}"
  end
end
