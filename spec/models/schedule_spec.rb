require 'spec_helper'

describe Schedule do
  it { should validate_presence_of(:schedule_at) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:idea_id) }
end
