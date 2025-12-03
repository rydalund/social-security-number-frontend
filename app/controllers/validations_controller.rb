class ValidationsController < ApplicationController
  def new
    @validation = { social_security_number: "" }
  end

  def create
   @social_security_number = params[:social_security_number]

    # Call Rust-backend
    result = RustValidatorService.validate(@social_security_number)

    respond_to do |format|
      format.html do
        @result = result
        render :new
      end
      format.json { render json: result }
    end
  end
end
