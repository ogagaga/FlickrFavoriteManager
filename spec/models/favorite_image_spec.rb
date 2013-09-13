# -*- coding: utf-8 -*-
require 'spec_helper'

describe FavoriteImage do

  describe '.all' do
    before do
      FactoryGirl.create(:category)
      FactoryGirl.create(:favorite_image)
    end

    subject { FavoriteImage.all }
    it { should have(1).items }
  end

  describe '.new' do

    context 'given valid attributes' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
      end
      subject { @favorite_image }
      it { should be_valid }
    end

    context 'given nul title' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
        @favorite_image.title = ''
      end
      subject { @favorite_image }
      it { should_not be_valid }
      it { should have(1).errors_on(:title) }
    end

    context 'given null ownername' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
        @favorite_image.ownername = ''
      end
      subject { @favorite_image }
      it { should_not be_valid }
      it { should have(1).errors_on(:ownername) }
    end

    context 'given null ownername' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
        @favorite_image.flickr_user_id = ''
      end
      subject { @favorite_image }
      it { should_not be_valid }
      it { should have(1).errors_on(:flickr_user_id) }
    end

    context 'given null web_page_url' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
        @favorite_image.web_page_url = ''
      end
      subject { @favorite_image }
      it { should_not be_valid }
      it { should have(1).errors_on(:web_page_url) }
    end

    context 'given null photo_source_url_n' do
      before do
        FactoryGirl.create(:category)
        @favorite_image = FactoryGirl.build(:favorite_image)
        @favorite_image.photo_source_url_n = ''
      end
      subject { @favorite_image }
      it { should_not be_valid }
      it { should have(1).errors_on(:photo_source_url_n) }
    end

  end

end
