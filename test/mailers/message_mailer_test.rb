require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "become_coach" do
    mail = MessageMailer.become_coach
    assert_equal "Become coach", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
