require 'rails_helper'

RSpec.describe 'sessions' do
  it 'will create a new user', :vcr do
    expect(User.count).to eq(0)
    post '/api/v1/users'

    response_info = JSON.parse(response.body, symbolize_names: true)
    expect(User.count).to eq(1)
  end
end
