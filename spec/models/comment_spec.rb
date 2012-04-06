require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:idea_id) }
end
