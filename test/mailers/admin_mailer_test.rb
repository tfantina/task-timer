require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "xlsx_done" do
    mail = AdminMailer.xlsx_done
    assert_equal "Xlsx done", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded

    assert_emails 1 do 
      mail.deliver_now
      end 
      
    
  end

end
