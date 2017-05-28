require 'spec_helper'

RSpec.describe Alisms do
  let(:appcode)         { '123456789' }
  let(:sign_name)       { 'Test' }
  let(:template_code)   { 'SMS_123456' }
  let(:send_url)        { 'http://sms.market.alicloudapi.com/singleSendSms' }
  let(:param_string)    { '{"code":"123456", "seconds":"59"}' }
  let(:rec_num)         { '13688889999' }

  before do
    Alisms.configure do |config|
      config.appcode = appcode
    end

    stub_request(:get, "http://sms.market.alicloudapi.com/singleSendSms?ParamsString=%7B%22code%22:%22123456%22,%20%22seconds%22:%2259%22%7D&RecNum=13688889999&SignName=Test&TemplateCode=SMS_123456").
      with(headers: {'Accept'=>'*/*',
                     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                     'Authorization'=>"APPCODE #{appcode}",
                     'User-Agent'=>'Faraday v0.12.1'}).
      to_return(status: 200, body: {success: true}.to_json, headers: {})
  end

  context 'should create a client' do
    subject(:response) { Alisms::Client.send_sms(param_string).
                         to(rec_num).
                         with_template(template_code).
                         by(sign_name) }

    it 'expect to return success' do
      expect(JSON.parse(response.body)['success']).to be true
    end
  end
end
