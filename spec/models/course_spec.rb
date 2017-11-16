require 'rails_helper'

RSpec.describe Course do
  it "can have many students" do
    course = Course.create!
    alice = User.create!
    course.users << alice
    expect(course.reload.users).to eq([alice])
  end
end
