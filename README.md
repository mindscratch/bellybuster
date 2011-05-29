What is bellybuster?
====================

A gem to enable dynamic distribution and installation of packages (i.e. gem, ruby script, etc) to any interested
client.

Why?
====

I heard a few guys from 37 Signals give a talk at RailsConf 2011 about some of things they do to get their various applications
to communicate. For example, if an application provides an API that several other applications will use they need to know
about that API and keep up-to-date with it. It seemed like there might be a way to decouple that and make it easier.

Why call it bellybuster?
========================

As I walked to RailsConf 2011, I knew I needed a name and a friend said "bellybuster". Sorry, that's all there is to it.

See it
======

$ cd bellybuster
$ bundle
$ rabbitmq-server &
$ rspec -I spec spec/bellybuster/package_distributer_spec.rb
