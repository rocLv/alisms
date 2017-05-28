require "spec_helper"

RSpec.describe Alisms do
  it "has a version number" do
    expect(Alisms::VERSION).not_to be nil
  end

  it "does something useful" do
    Alisms.configure do |config|
      config.appcode = 'somecode'
    end

    expect(Alisms.appcode).to eq('somecode')
  end
end
