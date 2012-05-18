class Time
  def idea_at
    "#{strftime("%d").to_i.ordinalize} #{strftime("%b")} at #{strftime("%I.%M %p")}"
  end
end
