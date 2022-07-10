require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: nil, photo: nil, bio: 0, posts_counter: -1) }

  before { subject.save }

  it 'name should be present' do
    expect(subject).to_not be_valid
  end

  it 'photo should be present' do
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be present' do
    expect(subject).to_not be_valid
  end
end
