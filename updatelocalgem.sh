#! /usr/bin/env bash
gem build websautotest.gemspec
gem install websautotest
gem cleanup websautotest