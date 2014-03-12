# Class: jenkins::cli
#
# Allow Jenkins commands to be issued from the command line
#
class jenkins::cli(
  $warpath = $jenkins::cli_warpath
) {

  $jar = "${warpath}/jenkins-cli.jar"
  $extract_jar = "unzip ${warpath}/jenkins.war WEB-INF/jenkins-cli.jar"
  $move_jar = "mv WEB-INF/jenkins-cli.jar ${jar}"
  $remove_dir = 'rm -rf WEB-INF'

  exec {
    'jenkins-cli' :
      command => "${extract_jar} && ${move_jar} && ${remove_dir}",
      path    => ['/bin', '/usr/bin'],
      cwd     => '/tmp',
      creates => $jar,
      require => Package['jenkins'];
  }

}
