module Alisms
  class Client
    HOST = 'http://sms.market.alicloudapi.com/singleSendSms'.freeze
    PARAM = %w(ParamString RecNum SignName TemplateCode)

    class << self
      def to(rec_num)
        @rec_num = rec_num
        self
      end

      def send_sms(param_string)
        @param_string = param_string
        self
      end

      def with_template template_code
        @template_code = template_code
        self
      end

      def by sign_name
        @sign_name = sign_name
        execute
      end

      def execute
        conn = Faraday.new HOST
        conn.headers['Authorization'] = "APPCODE #{Alisms.appcode}"
        conn.params = {
          :ParamsString  => @param_string,
          :RecNum        => @rec_num,
          :SignName      => @sign_name,
          :TemplateCode  => @template_code
        }
        conn.get
      end
    end

  end
end
