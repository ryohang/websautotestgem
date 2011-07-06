#! /usr/bin/env bash
gem build websautotest.gemspec
gem uninstall websautotest
gem install websautotest
gem cleanup websautotest
