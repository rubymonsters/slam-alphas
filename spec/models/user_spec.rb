require 'rails_helper'

RSpec.describe User, type: :model do
  def make_user(attributes = {})
    User.create!({name:"Eva Seydel",
      city: "Berlin",
      country: "de",
      email: "mail@svejagraefen.de",
      password: "password",
      website: "http://svenjagraefen.de",
      facebook_link: "https://fb.com/svenjagraefen",
      video_link: "https://vimeo.com/89895541",
      pronouns: "sie/ihr",
      is_available_on: [0],
      custom_availability: 'Heute keine',
      year_of_birth: 1990,
      alpha: true,
      recommended_by: 1,
      will_travel: '50'}.merge(attributes))
  end

  describe "sorting by user name" do
    it "can sort users with only one name" do
      user1 = make_user(name: "Eva", email: "eva@email.com")
      user2 = make_user(name: "Sabine Sauer", email: "sabine@email.com")
      user3 = make_user(name: "Adelheit Albert", email: "adelheit@email.com")
      users = User.sort_by_name(User.all)
      expect(users[0]).to eq user3
      expect(users[1]).to eq user1
      expect(users[2]).to eq user2
    end

    it "can sort users with two first names" do
      user1 = make_user(name: "Eva Maria Mahler",email: "evamaria@email.com")
      user2 = make_user(name: "Sabine-Anna" , email: "sabinelaura@email.com")
      user3 = make_user(name: "Maria Leidenfels", email: "leidenfels@email.com")
      users = User.sort_by_name(User.all)
      expect(users[0]).to eq user3
      expect(users[1]).to eq user1
      expect(users[2]).to eq user2
    end

    it "can sort users with name affixes" do
      user1 = make_user(name: "Eva Mahler",email: "evamari@email.com")
      user2 = make_user(name: "Sabine-Anna da Vinci" , email: "sabinedavinci@email.com")
      user3 = make_user(name: "Maria de la Cotta-Leidenfels", email: "leidenfels@email.com")
      users = User.sort_by_name(User.all)
      expect(users[0]).to eq user3
      expect(users[1]).to eq user1
      expect(users[2]).to eq user2
    end
  end

  describe "are_public scope" do
    it "includes public users" do
      user1 = make_user(name: "Eva Maria Mahler",email: "evamaria@email.com", public: true)
      expect(User.are_public).to include(user1)
    end

    it "excludes non-pub users" do
      user1 = make_user(name: "Eva Maria Mahler",email: "evamaria@email.com", public: false)
      expect(User.are_public).to_not include(user1)
    end
  end
end
