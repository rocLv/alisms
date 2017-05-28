module Alisms
  module Util
    def url_encode hash
      hash.to_a.map {|p| p.map {|e| e.to_s}.join('=')}.join('&')
    end
  end
end
