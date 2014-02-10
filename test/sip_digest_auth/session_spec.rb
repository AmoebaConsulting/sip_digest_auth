require 'spec_helper'

describe SipDigestAuth::Session do
  before do
    @session = SipDigestAuth::Session.new(realm: "test")
  end

  it "lets you pass all arguments on initializer" do
    session = SipDigestAuth::Session.new({
      realm: 'test',
      nonce: 'test',
      opaque: 'test',
      ha1: 'test',
      proxy: true
    })

    %w(realm nonce opaque ha1).each do |field|
      session.send(field).must_equal 'test'
    end
    session.proxy.must_equal true
  end

  it "requires a realm" do
    proc {
      session = SipDigestAuth::Session.new
    }.must_raise ArgumentError
  end

  it "has a nonce by default" do
    @session.nonce.wont_be_empty
  end

  it "has a blank opaque by default" do
    @session.opaque.must_be_empty
  end

  it "has no default ha1" do
    @session.ha1.must_be_nil
  end

  it "lets you set a ha1" do
    @session.ha1 = "test"
    @session.ha1.must_equal "test"
  end

  it "defaults to no proxy mode" do
    @session.proxy.must_equal false
  end

  it "lets you set the proxy" do
    @session.proxy = true
    @session.proxy.must_equal true
  end

  it "deafults qop properly" do
    @session.qop.must_equal 'auth,auth-int'
  end

  it "defaults algorithm property" do
    @session.algorithm.must_equal 'md5'
  end

  it "has a nc of 0 by default" do
    @session.nc.must_equal 0
  end

  it "can increment nc" do
    nc = @session.nc
    @session.increment_nc!
    @session.nc.must_equal nc+1
  end


end