class ValidationsController < ApplicationController
  def new
    @validation = { social_security_number: "" }
  end

  def create
    social_security_number = params[:social_security_number].to_s.strip

    if social_security_number.empty?
      flash[:alert] = "Please enter a social security number"
      redirect_to root_path and return
    end

    result = ValidationsService.validate(social_security_number)

    if result["valid"]
      flash[:success] = "Valid: #{result['formatted']}#{result['is_coordination_number'] ? ' (Coordination Number)' : ''}"
    else
      flash[:error] = "Invalid: #{result['error']}"
    end

    redirect_to new_validation_path
  end
end
