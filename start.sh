sudo semanage fcontext -a -t svirt_sandbox_file_t '/home/tumanggors/docker_compose(/.*)?'
sudo restorecon -Rv ~/docker_compose

