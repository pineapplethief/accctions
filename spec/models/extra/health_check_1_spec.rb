# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthCheck, type: :model do
  let(:health_check) { HealthCheck.new }

  it 'checks the health' do
    expect(health_check).to be_healthy
  end
end
