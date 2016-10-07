class jira {
        $FILE="puppet:///modules/jira"
        Exec {
                path => ['/usr/bin', '/bin'],
        }
        file { "$FILE/jira.bin":
                ensure => "present",
                source => "/tmp/shared/jira.bin",
                owner => vagrant,
                mode => 755,
                before => Exec['allow jira'],
        }
        file { "$FILE/response.varfile":
                ensure => "present",
                source => "/tmp/shared/response.varfile",
                owner => vagrant,
                before => Exec['allow jira'],
        }
        exec { 'allow jira':
                cwd => "$FILE",
                command => 'chmod a+x jira.bin',
                before => Exec['extract jira'],
        }
        exec { 'extract jira':
                cwd => "$FILE",
		provider => shell,
                command => './jira.bin -q -varfile response.varfile',
        }
}


