require_relative 'spec_helper'
require 'json'

describe 'Check if service root is valid' do
  it 'should return ok' do
    get '/'
    last_response.must_be :ok?
  end
end
