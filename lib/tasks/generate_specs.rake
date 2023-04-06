# frozen_string_literal: true

require 'fileutils'

namespace :github do
  desc 'generate X specs for model'
  task :generate_model_specs, [:number] do |task, args|
    number = args[:number].to_i

    break unless number.positive?

    origin_path = Rails.root.join('spec', 'models', 'health_check_spec.rb')
    extra_path = Rails.root.join('spec', 'models', 'extra')

    FileUtils.rm_rf(extra_path)
    FileUtils.mkdir(extra_path)

    number.times do |i|
      `cp #{origin_path} ./spec/models/extra/health_check_#{i}_spec.rb`
    end
  end

  task :generate_request_specs, [:number] do |task, args|
    number = args[:number].to_i

    break unless number.positive?

    origin_path = Rails.root.join('spec', 'requests', 'health_check_spec.rb')
    extra_path = Rails.root.join('spec', 'requests', 'extra')

    FileUtils.rm_rf(extra_path)
    FileUtils.mkdir(extra_path)

    number.times do |i|
      `cp #{origin_path} ./spec/requests/extra/health_check_#{i}_spec.rb`
    end
  end

  task :split do
    ci_total = ENV['CI_TOTAL']
    ci_index = ENV['CI_INDEX'] + 1

    Dir[File.join(Rails.root, 'spec', 'models', '**', '*.rb')].sort.each { |seed| load seed }

    model_file_names = Dir[File.join(Rails.root, 'spec', 'models', '**', '*.rb')].map.with_index do |file_path, index|
      (index + 1) % ci_index == 0 ? file_path : nil
    end

    request_file_names = Dir[File.join(Rails.root, 'spec', 'requests', '**', '*.rb')].map.with_index do |file_path, index|
      (index + 1) % ci_index == 0 ? file_path : nil
    end

    file_names = model_file_names + request_file_names

    STDOUT.write file_names.compact.join(', ')
  end
end
