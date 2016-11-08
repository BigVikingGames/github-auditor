require File.join(File.dirname(__FILE__), 'config', 'rake')

namespace :org do

  desc 'Audit organization for members that do not meet policy guidelines'
  task :audit do |t|
    puts Terminal::Table.new(rows: org_audit_members())
  end

  desc 'List all members in organization, with optional filter'
  task :members, [:filter] do |t, args|
    puts Terminal::Table.new(rows: org_member_list(filter: args[:filter]))
  end

  desc 'List all repositories in organization'
  task :repos do |t|
    puts Terminal::Table.new(rows: org_repo_list())
  end

end

def org_audit_members()
  non_2fa_users = []
  Octokit.org_members(GITHUB_ORG, {filter: '2fa_disabled'}).each do |m|
    non_2fa_users << m.login
  end
  rows = []
  rows << ['USERNAME', 'REAL NAME', '2FA ENABLED?']
  rows << :separator
  Octokit.org_members(GITHUB_ORG).each do |m|
    user = Octokit.user(m.login)
    if non_2fa_users.include? m.login
      rows << [m.login, user.name, false]
    elsif user.name.nil?
      rows << [m.login, user.name, true]
    end
  end
  return rows
end

def org_member_list(options = {})
  rows = []
  rows << ['USERNAME', 'REAL NAME', 'EMAIL ADDRESS']
  rows << :separator
  Octokit.org_members(GITHUB_ORG, options).each do |m|
    user = Octokit.user(m.login)
    rows << [m.login, user.name, user.email]
  end
  return rows
end

def org_repo_list()
  rows = []
  rows << ['REPOSITORY', 'PRIVATE?', 'FORK?', 'COLLABORATORS']
  rows << :separator
  Octokit.org_repos(GITHUB_ORG).each do |r|
    col = []
    Octokit.collaborators(r.full_name).each do |c|
      col << [c.login]
    end
    rows << [r.full_name, r.private, r.fork, col.join(',')]
  end
  return rows
end
