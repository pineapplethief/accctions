# frozen_string_literal: true

class HealthCheck
  def check!
    sleep 3
    @healthy = true
  end

  def healthy?
    check! unless defined?(@healthy)

    !!@healthy
  end
end
