## THIS GEM IS NO LONGER BEING MAINTAINED

[Alternate version here (Under the same name)](https://github.com/NullVoxPopuli/meta-instance) with cleaner api to meta-methods

MetaInstance
============

[![Gem Version](http://img.shields.io/gem/v/meta_instance.svg?style=flat-square)](http://badge.fury.io/rb/meta_instance)
[![Build Status](http://img.shields.io/travis/NullVoxPopuli/MetaInstance.svg?style=flat-square)](https://travis-ci.org/NullVoxPopuli/MetaInstance)
[![Code Climate](http://img.shields.io/codeclimate/github/NullVoxPopuli/MetaInstance.svg?style=flat-square)](https://codeclimate.com/github/NullVoxPopuli/MetaInstance)
[![Test Coverage](http://img.shields.io/codeclimate/coverage/github/NullVoxPopuli/MetaInstance.svg?style=flat-square)](https://codeclimate.com/github/NullVoxPopuli/MetaInstance)
[![Dependency Status](http://img.shields.io/gemnasium/NullVoxPopuli/MetaInstance.svg?style=flat-square)](https://gemnasium.com/NullVoxPopuli/MetaInstance)
[![Security](https://hakiri.io/github/NullVoxPopuli/MetaInstance/master.svg)](https://hakiri.io/github/NullVoxPopuli/MetaInstance/master)

A few helpers for manipulating methods on an instance of an object.


#### In your Gemfile

    gem 'meta_instance'

#### Usage

With a class:

    class Foo
      include MetaInstance

      def bar; "bar"; end
    end

You can do this:

    f = Foo.new
    f.bar
    # => "bar"

    f.instance_define(:bar){ "foo" }
    f.bar
    # => "foo"

    Foo.new.bar
    # => "bar"


See Specs for examples :-)
