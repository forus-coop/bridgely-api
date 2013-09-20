class V1::Message < ActiveRecord::Base

  # TODO: Default 'direction' to outbound, only set to inbound when received via Twilio's post

  validates :company_id, :presence => true
  validates :employee_id, :presence => true
  validates :body, :presence => true

  # belongs_to :company
  # belongs_to :employee

end
