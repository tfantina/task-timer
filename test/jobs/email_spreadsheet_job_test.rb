require 'test_helper'

class EmailSpreadsheetJobTest < ActiveJob::TestCase
  test "email sends" do
    EmailSpreadsheetJob.preform_now
  end

end
