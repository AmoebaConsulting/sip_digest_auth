require 'spec_helper'

require 'base64'

describe SipDigestAuth::Util do
  describe "#create_digest" do
    it "can make a digest with arguments" do
      args = ['1', '2']
      SipDigestAuth::Util.create_digest(*args).must_equal ::Digest::MD5.hexdigest(args.join(":"))
    end

    it "can make a digest with an array" do
      args = ['1', '2']
      SipDigestAuth::Util.create_digest(args).must_equal ::Digest::MD5.hexdigest(args.join(":"))
    end
  end

  describe "#generate_nonce" do
    it "generates a 32 character string" do
      SipDigestAuth::Util.generate_nonce.length.must_equal 32
    end

    it "lets you specify the secret_key and time" do
      time = Time.now
      nonce = SipDigestAuth::Util.generate_nonce("secret", time)
      nonce.must_equal SipDigestAuth::Util.create_digest(time.to_i, "secret")
    end
  end

end