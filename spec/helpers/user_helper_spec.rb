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
end
