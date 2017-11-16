require 'rails_helper'

RSpec.describe User do
  it "can have many students" do
    physics = Course.create!
    alice = User.create!
    alice.courses << physics
    expect(alice.reload.courses).to eq([physics])
  end
end
