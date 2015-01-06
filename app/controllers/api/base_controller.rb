module Api
  class BaseController < ActionController::Base
    include Devise::Controllers::Helpers
    include ActionController::StrongParameters

    acts_as_token_authentication_handler_for User

    respond_to :json

    private

    def invalid_resource(resource)
      render json: {error: "There were some errors", errors: resource.errors}.to_json, status: 422
    end

    rescue_from ActionController::ParameterMissing, ActionController::UnpermittedParameters do |parameter_missing_exception|
      error = {}
      error[parameter_missing_exception.param] = ["parameter is required"]
      response = {error: "Parameters were missing.", errors: [error] }
      respond_to do |format|
        format.json { render json: response, status: 422 }
      end
    end
  end
end
