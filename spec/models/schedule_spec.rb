require 'spec_helper'

describe Schedule do
  it { should validate_presence_of(:scheduled_at) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:idea_id) }

  it { should belong_to(:idea)}
end
