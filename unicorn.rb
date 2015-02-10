working_directory "/machiavelli"

# Unicorn PID file location
pid "/machiavelli/tmp/pids/unicorn.pid"

# Path to logs
stderr_path "/machiavelli/log/unicorn.log"
stdout_path "/machiavelli/log/unicorn.log"

# Unicorn socket
listen "/machiavelli/tmp/sockets/unicorn.machiavelli.sock"

# Number of processes
worker_processes 2

# Time-out
timeout 30

