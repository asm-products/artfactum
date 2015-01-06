class CustomFailure < Devise::FailureApp

  def respond
    if http_auth?
      # So devise responds with JSON when requesting over
      # an API and the auth failed.
      self.status = 401
      self.content_type = "application/json"
      self.response_body = { error: "Could not authenticate", errors: "Invalid email or password." }.to_json
    else
      redirect
    end
  end
end
