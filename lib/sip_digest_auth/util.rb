require 'base64'

module SipDigestAuth
  # Utility functions for our library
  module Util
    extend self

    # args is an array of crap
    def create_digest(*args)
      ::Digest::MD5.hexdigest(args.join(":"))
    end

    def generate_nonce(secret_key = rand.to_s, time = Time.now)
      t = time.to_i
      create_digest(t, secret_key)
    end
  end
end
