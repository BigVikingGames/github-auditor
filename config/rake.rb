require 'octokit'
require 'terminal-table'

VERSION      = '0.1.0'
GITHUB_ORG   = ENV['GITHUB_ORG'] or abort('You must set the GITHUB_ORG environment variable!')
GITHUB_TOKEN = ENV['GITHUB_TOKEN'] or abort('You must set the GITHUB_TOKEN environment variable!')

Octokit.configure do |ok|
  ok.access_token  = GITHUB_TOKEN
  ok.auto_paginate = true
end
