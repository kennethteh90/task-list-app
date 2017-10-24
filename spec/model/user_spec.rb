require 'rails_helper'

RSpec.describe User, type: :model do

  let(:subject) { create(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:password).ignoring_interference_by_writer }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }
  it { is_expected.to have_many(:task_lists) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive } # 
  it { expect(subject.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) }

end
