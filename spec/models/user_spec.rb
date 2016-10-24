require 'rails_helper'

RSpec.describe User, type: :model do
  it "doesn't allow countries outside DACH" do
    user = User.new name:"Ry", city: "Berlin", email: "a@example.com", country: "gb"
    expect(user.valid?).to be(false)
  end

  it "allows countries within DACH" do
    user = User.new name:"Ry", city: "Berlin", email: "a@example.com", country: "de"
    expect(user.valid?).to be(true)
  end
end
