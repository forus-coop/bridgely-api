class CustomAuthFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'json'
    self.response_body = {"success" => "false", "errors" => ["Invalid login credentials"]}.to_json
  end
end
