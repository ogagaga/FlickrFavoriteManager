require 'spec_helper'

describe Category do
  # pending "add some examples to (or delete) #{__FILE__}"

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

  pending ".create, .edit, .destroy examples to (or delete) #{__FILE__}"
  
end
