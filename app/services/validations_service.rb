class ValidatorsService
  include HTTParty
  base_uri 'http://localhost:3030'

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
