require "test_helper"

class ItemTest < ActiveSupport::TestCase
    include ActionMailer::TestHelper

    test "sends email notifications when back in stock" do
        item = items(:tshirt)

        # Set item out of stock
        item.update(inventory_count: 0)

        assert_emails 2 do
            item.update(inventory_count: 99)
        end
    end
end
