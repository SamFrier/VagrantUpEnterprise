class maven {
	
	$PATH="/usr/share/puppet/modules/maven/files/"
	file { "${PATH}maven.tar.gz":
                ensure => 'present',
		source => "${PATH}maven.tar.gz",
                before => Exec['installM'],
        }

	file { "${PATH}installMaven.sh":
		ensure => 'present',
		source => "${PATH}installMaven.sh",
		owner => 'root',
		group => 'root',
		mode => '0777',
		before => Exec['installM'],
		notify => Exec['installM'],
	}

	exec { 'installM':
		cwd => $PATH,
		path => '/usr/bin',
		provider => shell,
		command => './installMaven.sh',
		logoutput => true,
	}
}
