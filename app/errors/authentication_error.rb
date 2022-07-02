# frozen_string_literal: true

class AuthenticationError < ApplicationError
  def initialize(errors = nil)
    super(errors || :unauthorized)
  end
end
