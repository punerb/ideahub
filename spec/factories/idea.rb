Factory.define :idea, :class => Idea do |i|
  i.title "Test Idea"
  i.description "This is a test idea"
  i.users {|user| [user.association(:user)]}
  i.comments {|comment| comment.association(:comment)}
  i.schedules {|schedule| schedule.association(:schedule)}
  i.categories {|category| category.association(:category)}
end
