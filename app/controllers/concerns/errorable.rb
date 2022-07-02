#frozen_string_literal: true

module Errorable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error I18n.t('exception.record_not_found'), 404
    end

    rescue_from BadRequestError do |e|
      render_error e.errors, 400
    end

    rescue_from AuthenticationError do |e|
      render_error [e.errors], 401
    end
  end
end
