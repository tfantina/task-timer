class EmailSpreadsheetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sen
  end
end
