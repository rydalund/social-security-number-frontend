class ValidationsService
  include HTTParty

  # Change the base_uri to point to your Rust-backend server
  base_uri "http://10.0.1.4:3030"

  def self.validate(social_security_number)
    response = post("/api/validate",
      body: { social_security_number: social_security_number }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    if response.success?
      response.parsed_response
    else
      { error: "Failed to validate: #{response.code}", valid: false }
    end
  rescue => e
    { error: "Connection error: #{e.message}", valid: false }
  end
end
