class git {
    notify {'installing git...":}
    exec { 'install_git':
        provider => shell,
        command => 'sudo apt-get install -y git',
    }
}
