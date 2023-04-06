# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HealthCheck endpoint', type: :request do
  it 'checks endpoint' do
    get '/healthcheck'

    expect(response).to have_http_status(:ok)
  end
end
