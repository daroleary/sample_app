require 'rails_helper'

describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  context 'general' do
    it 'should be valid' do
      expect(@user.valid?).to eql(true)
    end
  end

  context 'name' do
    it 'name should be present' do
      @user.name = "      "
      expect(@user.valid?).to eql(false)
    end

    it 'name should not be too long' do
      @user.name = "a" * 51
      expect(@user.valid?).to eql(false)
    end
  end

  context 'email' do
    it 'should be present' do
      @user.email = "      "
      expect(@user.valid?).to eql(false)
    end

    it 'should not be too long' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user.valid?).to eq(false)
    end

    it 'validation should accept valid addresses' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user.valid?).to eql(true)
      end
    end

    it 'validation should reject invalid addresses' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user.valid?).to eql(false)
      end
    end

    it 'should be unique' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user.valid?).to eql(false)
    end

    it 'should be lower case' do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user.valid?).to eql(false)
    end
  end

  context 'password' do
    it 'should be present (nonblank)' do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user.valid?).to eql(false)
    end

    it 'should have a minimum length' do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user.valid?).to eql(false)
    end
  end
end
