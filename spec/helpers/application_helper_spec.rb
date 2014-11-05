require 'spec_helper'

describe ApplicationHelper do
  it "generates sorteable links" do
    helper.stub(:params).and_return({controller: 'members', action: 'index',:sort => "name", :direction => "asc"})
    helper.sorteable('members')
  end

end
