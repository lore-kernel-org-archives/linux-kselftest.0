From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Wed, 21 Nov 2018 16:59:12 +0530
Subject: selftests/bpf :get_cgroup_id_user: File not found:
 /sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id
Message-ID: <CA+G9fYuruRUVVqR669UCB4vjAh5H==Ry3_sbFMQytMu+BZme7w@mail.gmail.com>

Kselftest bpf get_cgroup_id_user is failed on all devices.

selftests: bpf: get_cgroup_id_user
main:PASS:setup_cgroup_environment
main:PASS:create_and_get_cgroup
main:PASS:join_cgroup
main:PASS:bpf_prog_load
main:PASS:bpf_find_map
main:PASS:bpf_find_map
main:FAIL:open err -1 errno 2
not ok 1..15 selftests: bpf: get_cgroup_id_user [FAIL]

The strace output shows,
This expected file not found,
"/sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id"

bpf(BPF_MAP_UPDATE_ELEM, {map_fd=5, key=0x7fff0c68c138,
value=0x7fff0c68c13c, flags=BPF_ANY}, 72) = 0
open(\"/sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id\",
O_RDONLY) = -1 ENOENT (No such file or directory)
write(1, \"main:FAIL:open err -1 errno 2\n\", 30main:FAIL:open err -1 errno 2

Am I missing any pre-requirement ?

Best regards
Naresh Kamboju
