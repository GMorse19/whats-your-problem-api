# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'can be created' do
      user = User.create(username: "testuser",
                         email: 'test@test',
                         id: 0,
                         token: '12345',
                         password: "asdf",
                         password_confirmation: "asdf")

      expect(user).to be_valid
    end
  end
end
