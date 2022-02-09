require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before '' do
      @user = User.new(
        name: 'John Doe',
        email: 'test@email.com',
        password: 'abcd',
        password_confirmation: 'abcd'
      )
    end

    it 'saves a user successfully' do
      @user.save!
      expect(@user.errors.full_messages).to be_empty
    end

    it 'does not save a user with empty name' do
      @user.name = nil
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'does not save a user with empty email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not save non unique emails' do
      @user2 = User.new(
        name: 'John Doe',
        email: 'test@email.com',
        password: 'abcd',
        password_confirmation: 'abcd'
      )
      @user.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should pass with spaces before or after email' do
      @user3 = User.new(
        name: 'John Doe',
        email: '  test@email.com',
        password: 'abcd',
        password_confirmation: 'abcd'
      )
      @user.save
      @user3.email = @user3.email.downcase.strip
      @user3.save
      expect(@user3.errors.full_messages).to include("Email has already been taken")
    end
  end
end