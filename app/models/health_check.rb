# frozen_string_literal: true

class HealthCheck
  INTEGRATION_DELAY = 12

  def check!
    sleep 3
    @healthy = true
  end

  def healthy?
    check! unless defined?(@healthy)

    !!@healthy
  end
end
