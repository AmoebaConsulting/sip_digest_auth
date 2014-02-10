require 'hashie/dash'

module SipDigestAuth
  class Session < ::Hashie::Dash
    # Realm *must* be set, and is the only required field when creating a session for the first time
    property :realm, required: true

    # The nonce should stay the same for a single session, and will be generated if not provided on
    # initialization. Subsequent requests within the same session should ensure nonce is set
    property :nonce, default: Util.generate_nonce

    # Opaque doesn't seem to be mandated and I'm a little confused as to why it's necessary with a
    # nonce. Rfc2617 specifies: "A string of data, specified by the server, which should be returned
    # by the client unchanged in the Authorization header of subsequent requests with URIs in the
    # same protection space." In this case, I'm going to leave it up to the caller to specify it.
    property :opaque, default: ''

    # The ha1 is generated during authentication. HA1 = MD5(username:realm:password)
    property :ha1

    # When true, assume a proxy of some kind to an upstream SIP provider. This has subtle effects on
    # how authentication takes place (for example, changing the name of the challenge headers)
    property :proxy, default: false

    # These are internal and probably not going to change, but it's possible to build more support
    # into the library later, and they really belong in the session:
    property :qop, default: 'auth,auth-int'
    property :algorithm, default: 'md5'
  end
end