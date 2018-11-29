class JsonWebToken
    # secret to encode and decode token
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    def self.encode(payload, exp = 24.hours.from_now)
        # set expiry to 24hours from creation time
        payload[:exp] = exp.to_i
        # sign token with application secret
        JWT.encode(payload, HMAC_SECRET)
    end

    def self.decode(token)
        # get payload; first index in decoded Array
        body = JWT.decode(token, HMAC_SECRET)[0]
        HashWithIndifferentAccess.new body
        # rescue from all decode errors

    rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler

        raise ExceptionHandler::InvalidToken, e.message
    end
end

module ExceptionHandler
    extend ActiveSupport::Concern

    # Define custom error subclasses
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end

    included do 
        # define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: : unauthorized-request
    rescue_from ExceptionHandler::

end