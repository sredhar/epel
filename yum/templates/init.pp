# Installs EPEL repo and gpg key.
# 1) Original sourcecode can be found at 
#    http://rene.bz/yum-repo-and-package-dependencies-puppet/
# 2) GPG key has been added from 
#     https://fedoraproject.org/static/0608B895.txt 
#     on date July 15th, 2013
class yum {
  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL':
    owner  => root,
    group  => root,
    mode   => '0444',
    source => 'puppet:///yum/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'
  }

  yumrepo { 'epel':
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL']
  }

}
