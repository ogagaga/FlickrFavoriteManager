# -*- coding: utf-8 -*-
require 'spec_helper'

describe Category do
  # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
  # FactoryGirl.build()
  #   - サンプルデータを作成
  #   - 主に、バリデーションのテストなどに使い
  # FactoryGirl.create(:hoge)
  #   - サンプルデータを作成しテスト用のデータベースにデータをいれる
  #   - バリデーションのテストではできない、重複禁止などのテストの時に使う。
  # FactoryGirl.attributes_for(:user)
  #   - 属性のハッシュを返却

  describe '.all' do
    before do
      FactoryGirl.create(:category)
    end
    
    subject { Category.all }
    it { should have(1).items }
  end

  describe '.new' do
    context 'given valid attributes' do
      subject { Category.new(:name => 'a') }
      it { should be_valid }
    end

    context 'given null name' do
      subject { Category.new(:name => '') }
      it { should have(1).errors_on(:name) }
    end
  end

  describe '.create' do
    before do
      @category = FactoryGirl.build(:category)
    end
    context 'given valid attributes' do
      subject { @category.save }
      it { should be_true }
    end

    context 'category was not saved' do
      subject {
        @category.name = ""
        @category.save
      }
      it { should_not be_true }
    end
  end

  describe '.update' do
    before do
      @category = FactoryGirl.build(:category)
    end
    context 'name of category was not changed' do
      subject { @category.save }
      it { should be_true }
    end

    context 'name of category was changed' do
      subject {
        @category.name = "a"
        @category.save
      }
      it { should be_true }
    end
  end

  describe '.destroy' do
    before do
      @category = FactoryGirl.create(:category)
    end
    context 'category was destroyed' do
      subject { @category.destroy }
      it { should be_true }
    end

  end

end
