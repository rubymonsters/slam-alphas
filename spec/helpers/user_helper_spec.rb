# coding: utf-8
require 'rails_helper'
include UsersHelper

describe UsersHelper, type: :helper do
  describe 'vimeo_id' do
    it 'should return the video id from a vimeo link' do
      url = "https://vimeo.com/89895541"
      expect(vimeo_id(url)).to eq('89895541')
    end
  end
  describe 'youtube_id' do
    it 'should return the video if from a youtube link' do
      url = 'https://www.youtube.com/watch?v=t5atbOiI8i0'
      expect(youtube_id(url)).to eq('t5atbOiI8i0')
    end
  end

  describe 'user_map_nav_class' do
    it 'returns an array of clases based on the user\'s country' do
      usercountry = 'de'
      countrystring = 'at'
      expect(user_map_nav_class(usercountry, countrystring)).to eq(['at'])

      countrystring = 'de'
      expect(user_map_nav_class(usercountry, countrystring)).to eq(['de', 'active'])
    end
  end

  describe 'user_age_category' do
    it 'returns the correct age category when given an age' do
      expect(user_age_category(16)).to eq('U18')
      expect(user_age_category(19)).to eq('U20')
      expect(user_age_category(27)).to eq('Ü20')
    end

    it 'also handles strings' do
      user_age = '12'
      expect(user_age_category(user_age)).to eq('U18')
    end
  end
end
