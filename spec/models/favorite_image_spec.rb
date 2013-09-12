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
    before do
      FactoryGirl.create(:category)
      @favorite_image = FactoryGirl.build(:favorite_image)
    end

    context 'given valid attributes' do
      subject { @favorite_image }
      it { should be_valid }
    end

    context 'given nul title' do
      subject { FavoriteImage.new(:title => '') }
      it { should_not be_valid }
    end

    context 'given null ownername' do
      subject { FavoriteImage.new(:ownername => '') }
      it { should_not be_valid }
    end
  end

  # 下記はエラーが設定されているかを確認する書き方
  # it { should have(1).errors_on(:name) }

end
