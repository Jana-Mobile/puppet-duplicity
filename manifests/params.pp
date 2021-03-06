# == Class: duplicity::params
#
# Default values of the duplicity class.
#
# === Authors
#
# Martin Meinhold <Martin.Meinhold@gmx.de>
#
# === Copyright
#
# Copyright 2014 Martin Meinhold, unless otherwise noted.
#
class duplicity::params {
  $duplicity_package_ensure = installed
  $duplicity_package_name = 'duplicity'

  $duply_package_ensure = $::osfamily ? {
    default => 'installed',
  }
  $duply_package_name = $::osfamily ? {
    default => 'duply',
  }
  $duply_package_provider = $::osfamily ? {
    'redhat' => 'yum',
    'debian' => 'apt',
    default  => 'archive'
  }
  $duply_archive_version = '1.7.3'
  $duply_archive_md5sum = '139e36c3ee35d8bca15b6aa9c7f8939b'
  $duply_archive_package_dir = $::operatingsystem ? {
    default => '/var/cache/puppet/archives',
  }
  $duply_archive_install_dir = $::osfamily ? {
    default => '/opt',
  }
  $duply_archive_executable = $::osfamily ? {
    default => '/usr/local/sbin/duply',
  }
  $duply_config_dir = $::osfamily ? {
    default => '/etc/duply'
  }
  $duply_profile_config_name = 'conf'
  $duply_profile_filelist_name = 'exclude'
  $duply_profile_pre_script_name = 'pre'
  $duply_profile_post_script_name = 'post'
  $duply_key_dir = $::osfamily ? {
    default => '/etc/duply-keys'
  }
  $duply_public_key_dir = "${duply_key_dir}/public"
  $duply_private_key_dir = "${duply_key_dir}/private"
  $duply_log_dir = $::osfamily ? {
    default => '/var/log/duply'
  }
  $duply_log_group = $::osfamily ? {
    'redhat' => 'root',
    default  => 'adm',
  }

  $gpg_encryption_keys = []
  $gpg_signing_key = ''
  $gpg_passphrase = ''
  $gpg_options = []
  $backup_target_url = ''
  $backup_target_username = undef
  $backup_target_password = undef

  $cron_enabled = false
  $exec_path = $::osfamily ? {
    default => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
  }
}
