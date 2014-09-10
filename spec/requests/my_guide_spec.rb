require 'spec_helper'

describe "My Guide" do
  context "User sends sms message with first name to Dave" do
    before :each do
      # Create a mock User
      @admin_user = FactoryGirl.create(:admin, name: 'kikuchiyo', email: 'john@forusall.com', password: 'blipblipblau')
      @company    = FactoryGirl.create(:company, name: 'Org')
      @employee   = FactoryGirl.create(:employee, name: 'Joe Smith', phone: '6509182453', company_id: @company.id)

      # Create a mock Advisor "Dave"
      # @advisor    = FactoryGirl.create(:advisor)
      # Create a mock RetirementPlan for User
      #   How the heck do I do this?
      #   This is a part of the forus application, so our service knows noting about it
      # Stub   a message from a user to Dave
      #   How the heck do I do this?

      @user_incoming_message = nil
      @welcome_outgoing_message = nil
      @benefits_outgoing_message = nil
      @get_started_outgoing_message = nil

      visit "/v1/onboarding?phone=#{@employee.phone}&message=John Jimenez"
    end

    it "respods with three core messages" do
      @company.messages.count.should == 4
      @company.messages[0].should == @user_incoming_message
      @company.messages[1].should == @welcome_outgoing_message
      @company.messages[2].should == @benefits_outgoing_message
      @company.messages[3].should == @get_started_outgoing_message

      # Sends a message "Hi #{first_name}.  I'm Dave.  Welcome to #{company}! I can help you get a quick overview of your benefits.
      # Sends a message "You get a ton of great benefits here - 401(k), healthcare plans, life and disability insurance to name a few.
      # Sends a message "Let's start with a quick look at the 401(k) benefit.  You'll be done in 90 seconds (really!). Check out: http://m.forusall.com/#{retirement_plan}/#{company.name}.
    end 
  end

  context "User sends a question to Dave" do
    before :each do
      # Stub a second message from a user to Dave
    end
    it "is received by Dave" do
    end 

    context "Dave sends a response" do
      before :each do
        # Stub a response from Dave
      end
      it "is sent to User" do
      end
    end
  end

  context "User sends sms message without a first name to Dave" do
    before :each do
      # Create a mock an advisor "Dave"
      # Create a mock a user
      # Create a mock a company
      # Create a mock some company retirement_plans
      # Stub   a message from a user to Dave
    end
    it "responds with a default error message" do
    end 
  end
end
