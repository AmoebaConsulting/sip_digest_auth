require 'spec_helper'

describe SipDigestAuth do
  describe "#challenge" do
    before do
      @session = SipDigestAuth::Session.new(realm: 'test', qop: 'test', algorithm: 'test', nonce: 'test', opaque: '')
    end

    it "returns proxy-authenticate when session.proxy" do
      @session.proxy = true
      SipDigestAuth.challenge(@session)[0].must_equal 'proxy-authenticate'
    end

    it "returns www-authenticate when not session.proxy" do
      @session.proxy = false
      SipDigestAuth.challenge(@session)[0].must_equal 'www-authenticate'
    end

    it "contains the accurate session values in its return header" do
      SipDigestAuth.challenge(@session)[1].must_equal [
        'Digest',
        "realm: \"#{@session.realm}\"",
        "qop: \"#{@session.qop}\"",
        "algorithm: \"#{@session.algorithm}\"",
        "nonce: \"#{@session.nonce}\"",
        "opaque: \"#{@session.opaque}\""
      ].join(', ')
    end
  end
end