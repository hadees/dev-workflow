#!/usr/bin/env ruby
# encoding: utf-8
require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
require './bundle/bundler/setup.rb'
require 'alfred'
require 'titleize'


Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  dirs = `find ~/code -name 'Procfile.dev' | xargs -n1 dirname`.split("\n")

  dirs.each do |dir|
    project = File.basename(dir)

    fb.add_item({
      :uid      => "dev-#{project}",
      :title    => project.titleize,
      :subtitle => dir,
      :arg      => dir,
      :valid    => "yes",
    })
  end

  puts fb.to_alfred(ARGV)
end



