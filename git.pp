include chocolatey

class windows::git {

  package { 'git':
    ensure => installed,
  }

}
