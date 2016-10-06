class mysql {
    include mysql::install
}

class mysql::install {
    file { '/opt/mysql.tar':
        ensure => present,
        source => 'puppet:///modules/mysql/mysql-server-5.7.15-1ubuntu14.04_amd64.deb-bundle.tar',
        owner => 'root',
        group => 'root',
    }

    file { '/opt/install_mysql.sh':
        ensure => present,
        source => 'puppet:///modules/mysql/install_mysql.sh',
        owner => 'root',
        group => 'root',
    }

    exec { '/opt/install_mysql.sh':
        provider => shell,
        require => [File['/opt/mysql.tar'], File['/opt/install_mysql.sh']],
        # NEED ONLYIF HERE!!!!
    }
}
