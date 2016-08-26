# == Class: duplicity::restore
#
# Restore a backup 
#
define duplicity::restore(
  $target                 = undef,
  $source                 = undef,
  $exec_before            = undef,
  $exec_after             = undef,
  $path                   = ['/usr/bin', '/bin', '/usr/sbin' ,'/sbin'],
  $force                  = false
) {
  
  $restored_signal_file = "${target}/.restored_do_not_delete"

  $force_option = $force ? {
    true    => '--force',
    default => '',
  }

  exec { "restore_${title}":
    command => "${exec_before} && duply ${title} restore ${target} ${force_option} >> /var/log/duply/${title}.log 2>&1 && touch ${restored_signal_file} && ${exec_after}",
    path    => $path,
    unless  => "test -f ${restored_signal_file}",
    require => Duplicity::Profile[$title],
    timeout => 0
  }

}
