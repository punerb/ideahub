class Setting < ActiveRecord::Base
  attr_accessible :name, :value
  
  def self.method_missing(identifier, args = nil)
    identifier = identifier.to_s.gsub '=', ''
    set = Setting.where(name: identifier).first
    if args.nil? and !set.nil?
      return set.value
    elsif !args.nil?
      set ||= Setting.new(name: identifier)
      set.value = args
      set.save!
    else
      super identifier, args
    end
  end
end
