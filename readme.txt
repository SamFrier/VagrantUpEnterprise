Description of files in this repo:

- Vagrantfile: sets up the master VM and 3 agent VMs on a single machine.
- bootstrap_master.sh: does any relevant setup on the master VM
- bootstrap_agent.sh: does any relevant setup on any and all agent VMs
- response.varfile: required to set up Jira without user input
- shared: the shared folder that will be loaded onto the master VM
    - shared/modules: Puppet modules that will be copied into the master's Puppet directory

IMPORTANT THINGS TO NOTE:
- This repository currently doesn't contain the tar files needed to install the software as these are too large to upload, but these will be added before submitting
- The MySQL database(s) created do not have any root password set

NB: find out the versions of Vagrant and VirtualBox on Aaron's computer!
Also work out how to put the chad-thompson/ubuntu files in the right place on Aaron's machine
