require 'rails_helper'

RSpec.describe "subscriptions/edit", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      :receipt_number => "MyString",
      :mode_of_payment => "MyString",
      :amount_paid => "9.99",
      :balance => "9.99",
      :discount => "9.99",
      :status => "MyString",
      :customer => nil,
      :plan => nil
    ))
  end

  it "renders the edit subscription form" do
    render

    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do

      assert_select "input[name=?]", "subscription[receipt_number]"

      assert_select "input[name=?]", "subscription[mode_of_payment]"

      assert_select "input[name=?]", "subscription[amount_paid]"

      assert_select "input[name=?]", "subscription[balance]"

      assert_select "input[name=?]", "subscription[discount]"

      assert_select "input[name=?]", "subscription[status]"

      assert_select "input[name=?]", "subscription[customer_id]"

      assert_select "input[name=?]", "subscription[plan_id]"
    end
  end
end
