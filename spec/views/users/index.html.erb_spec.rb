require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :role => "Role",
        :password_digest => "Password Digest"
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :role => "Role",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
