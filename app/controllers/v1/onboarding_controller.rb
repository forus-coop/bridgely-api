class V1::OnboardingController < ApplicationController
  def create
    if @employee = V1::Employee.find_by_phone(params[:phone])
      @company = @employee.company
      V1::Message.new(company_id: @company.id, body: params[:message], direction: 'incoming').save!
      # how in the heck do we get this?
      @retirement_plan = 'ri'
      [:welcome_user_message, :benefits_summary_message, :get_started_message].each do |message|
        V1::Message.new(company_id: @company.id, body: send(message), direction: 'outgoing').save!
      end
    else
      raise "SMS coming from unknown number"
    end
    render :json => {wompwomp: true}
  end

  private

    def welcome_user_message
      "Hi #{@employee.name}.  I'm Dave.  Welcome to #{@company}! I can help you get a quick overview of your benefits."
    end

    def benefits_summary_message
      "You get a ton of great benefits here - 401(k), healthcare plans, life and disability insurance to name a few."
    end

    def get_started_message
      "Let's start with a quick look at the 401(k) benefit.  You'll be done in 90 seconds (really!). Check out: http://m.forusall.com/#{@retirement_plan}/#{@company.name}."
    end


end
