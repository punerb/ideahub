require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:idea_id) }

  it { should belong_to(:idea)}
  it { should belong_to(:user)}
end
