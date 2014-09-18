MetaInstance
============

[![Gem Version](https://badge.fury.io/rb/meta-instance.svg)](http://badge.fury.io/rb/meta_instance)
[![Build Status](https://travis-ci.org/NullVoxPopuli/MetaInstance.svg)](https://travis-ci.org/NullVoxPopuli/MetaInstance)
[![Code Climate](https://codeclimate.com/github/NullVoxPopuli/MetaInstance/badges/gpa.svg)](https://codeclimate.com/github/NullVoxPopuli/MetaInstance)
[![Test Coverage](https://codeclimate.com/github/NullVoxPopuli/MetaInstance/badges/coverage.svg)](https://codeclimate.com/github/NullVoxPopuli/MetaInstance)
[![Dependency Status](https://gemnasium.com/NullVoxPopuli/MetaInstance.svg)](https://gemnasium.com/NullVoxPopuli/MetaInstance)
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
