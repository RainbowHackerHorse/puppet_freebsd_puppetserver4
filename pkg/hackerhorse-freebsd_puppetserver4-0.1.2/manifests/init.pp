# Class: freebsd_puppetserver4
# Installs and maintains configs for puppetserver 4 on FreeBSD
# Module written by Rainbow <rainbow@hacker.horse>
# Released under the 2-clause BSD license.
class freebsd_puppetserver4 {
  file { '/usr/local/etc/puppetserver/conf.d/puppetserver.conf':
    ensure  => file,
    content => template('freebsd_puppetserver4/puppetserver.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'puppet',
  }
  file { '/usr/local/etc/puppetserver/conf.d/webserver.conf':
    ensure => file,
    source => 'puppet:///modules/freebsd_puppetserver4/webserver.conf',
    mode   => '0644',
    owner  => 'root',
    group  => 'puppet',
  }
  service { 'puppetserver':
    ensure  => running,
    enable  => true,
    require => Package['puppetserver'],
  }
  package { 'puppetserver':
    ensure => latest,
  }
  package { 'rubygem-facter':
    ensure => latest,
  }
}