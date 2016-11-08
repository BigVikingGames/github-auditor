# GITHUB AUDITOR

A simple Rakefile for GitHub organization policy audits. (WIP)

## Usage

### Personal Access Token

A [personal access token](https://github.com/settings/tokens) is required to use the GitHub API and retrieve information about private repos in your organization.

Create a new personal access token with the following scope:

- `repo` (all, there is no read only permission for the repository scope)
- `read:org`

### Run with Local Ruby

```
$ bundle install
$ export GITHUB_ORG=BigVikingGames
$ export GITHUB_TOKEN=yourpersonaltoken
$ rake org:members
```

### Run with Docker

```
$ docker build -t github-auditor .
$ docker run -it --rm \
    -e GITHUB_ORG=BigVikingGames \
    -e GITHUB_TOKEN=yourpersonaltoken \
    github-auditor \
    rake org:members
```

## Tasks

Tasks may be added later as needed.

```
rake org:audit            # Audit organization for members that do not meet policy guidelines
rake org:members[filter]  # List all members in organization, with optional filter
rake org:repos            # List all repositories in organization
```
