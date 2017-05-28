require 'spec_helper'

RSpec.describe Alisms::Util do
  include Alisms::Util

  it 'should return url encode hash' do
    hash = {a: 1, b: 2}

    expect(url_encode(hash)).to eq('a=1&b=2')
  end
end
