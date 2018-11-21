From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed, 21 Nov 2018 17:34:47 +0530
Subject: selftests/bpf: libbpf: object file doesn't contain bpf program
Message-ID:
 <CA+G9fYsJB2PBN=CFKXv7w6DekLq1inGKpWAM9aomHgNREk5W1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181121120447.dC29ELsgUb9tp3i0-mvP8D9m6FdSgSHZtDSjrK66FDY@z>

The listed bpf test case failed due to,
libbpf: object file doesn't contain bpf program

We are cross compiling, installing selftests on device under test
and running tests by using run_kselftest.sh script file.

selftests: bpf: test_maps
libbpf: object file doesn't contain bpf program
Failed to load SK_SKB parse prog
not ok 1..3 selftests: bpf: test_maps [FAIL]

selftests: bpf: test_progs
libbpf: object file doesn't contain bpf program
libbpf: object file doesn't contain bpf program
libbpf: object file doesn't contain bpf program
libbpf: object file doesn't contain bpf program
libbpf: ./test_tcp_estats.o doesn't provide kernel version
libbpf: object file doesn't contain bpf program

selftests: bpf: test_tcpbpf_user
libbpf: object file doesn't contain bpf program
FAILED: load_bpf_file failed for: test_tcpbpf_kern.o
not ok 1..10 selftests: bpf: test_tcpbpf_user [FAIL]

selftests: bpf: test_tcpnotify_user
libbpf: object file doesn't contain bpf program
FAILED: load_bpf_file failed for: test_tcpnotify_kern.o
not ok 1..21 selftests: bpf: test_tcpnotify_user [FAIL]

selftests: bpf: test_flow_dissector.sh
bpffs not mounted. Mounting...
libbpf: object file doesn't contain bpf program
./flow_dissector_load: bpf_prog_load bpf_flow.o
selftests: test_flow_dissector [FAILED]

Do you see problem when running on target devices ?

Best regards
Naresh Kamboju
