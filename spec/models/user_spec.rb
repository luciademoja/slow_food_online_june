require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Relations' do
    it {is_expected.to have_many :restaurants}
    it {is_expected.to have_many :orders}
  end
end
