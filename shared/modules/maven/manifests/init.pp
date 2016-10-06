class maven {
	
	$PATH="/usr/share/puppet/modules/maven/files/"
	file { "/opt/maven.tar.gz":
                ensure => 'present',
		source => "/tmp/shared/maven.tar.gz",
                before => Exec['installM'],
        }

	file { "/opt/installMaven.sh":
		ensure => 'present',
		source => "/tmp/shared/installMaven.sh",
		owner => 'root',
		group => 'root',
		mode => '0777',
		before => Exec['installM'],
		notify => Exec['installM'],
	}

	exec { 'installM':
		cwd => '/opt',
		path => '/usr/bin',
		provider => shell,
		command => './installMaven.sh',
	}
}
