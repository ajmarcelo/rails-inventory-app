require "test_helper"

class ItemMailerTest < ActionMailer::TestCase
    test "in_stock" do
        mail = ItemMailer.with(item: items(:tshirt), subscriber: subscribers(:david)).in_stock
        assert_equal "In stock", mail.subject
        assert_equal [ "david@example.org" ], mail.to
        assert_equal [ "from@example.com" ], mail.from
        assert_match "Good news!", mail.body.encoded
    end
end
