# frozen_string_literal: true

module Renderable
  extend ActiveSupport::Concern

  included do
    include Errorable
  end

  def render_error(entity, status = 401)
    render json: { error: { messages: entity } }, status: status
  end

  def render_json(entity, meta_attributes={}, status = 200)
    if meta_attributes[:pagination].present?
      meta_attributes[:pagination]   = {
        current_page: meta_attributes[:pagination].current_page,
        total_pages: meta_attributes[:pagination].total_pages,
        total_count: meta_attributes[:pagination].total_count
      }
    end

    if meta_attributes.present?
      meta_attributes.merge!(meta_attributes[:meta].to_h)
      render json: { data: entity, meta: meta_attributes}, status: status
    else
      render json: { data: entity}, status: status
    end
  end
end
