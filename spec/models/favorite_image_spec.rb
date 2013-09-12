require 'spec_helper'

describe FavoriteImage do

  describe '.all' do
    before do
      FactoryGirl.create(:favorite_image)
      FactoryGirl.create(:category)
    end

    subject { FavoriteImage.all }
    it { should have(1).items }
  end


end
