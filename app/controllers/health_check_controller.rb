# frozen_string_literal: true

class HealthCheckController < ApplicationController
  def show
    render json: { status: healthcheck.healthy? }
  end

  private

  def healthcheck
    HealthCheck.new
  end
end
