class ExportJob < ApplicationJob
  queue_as :exports

  def perform(*args)
    puts 1 + 2
    sleep 2
  end
end
