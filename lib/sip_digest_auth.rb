require 'sip_digest_auth/util'
require 'sip_digest_auth/session'
require 'sip_digest_auth/version'

module SipDigestAuth
  extend self

  def challenge(session)
    header_name = session.proxy ? 'proxy-authenticate' : 'www-authenticate'

    header_values = [
      "Digest",
      "realm: #{q(session.realm)}",
      "qop: #{q(session.qop)}",
      "algorithm: #{q(session.algorithm)}",
      "nonce: #{q(session.nonce)}",
      "opaque: #{q(session.opaque)}"
    ]

    [header_name, header_values.join(', ')]
  end

  # Credentials are optional if the session is established. When specified, it is a hash containing
  # either :user & :password OR the key :hash. Required on the first call to cache h1 in session.
  def authenticate_request(session, request, credentials=nil)
    #TODO: Implement
  end

  protected

  def q(str)
    if str && str[0] != '"'
      str = "\"#{str}\""
    end
    str
  end

end
