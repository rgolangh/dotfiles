#!/bin/bash

bpftrace -e '
tracepoint:syscalls:sys_enter_read {
    @fd_to_path[pid, args->fd] = (args->fd);
}
tracepoint:syscalls:sys_exit_read {
    if (@fd_to_path[pid, args->fd]) {
        printf("PID %d, FD %d, Filename: %s\n", pid, args->fd, str(fd_to_path(pid, args->fd)));
        delete(@fd_to_path[pid, args->fd]);
    }
}'

