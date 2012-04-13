require 'spec_helper'

describe IdeaUser do
  it { should validate_presence_of(:user_id)}
  it { should validate_presence_of(:idea_id)}

  it { should belong_to(:user)}
  it { should belong_to(:idea)}
end
