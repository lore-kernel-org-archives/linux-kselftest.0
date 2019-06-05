From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed, 5 Jun 2019 15:26:26 +0530
Subject: selftests: bpf: test_sock_fields: Error:
 in_bpf_create_map_xattr(sk_pkt_out_cnt)Invalid
Message-ID:
 <CA+G9fYtTcV9Xa65COdNfA9O+BvZV64fWBvdaamRLZphWEn7FXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190605095626.3y5IwcjTvF4wFP3N-49K_4WBbWhKVjofVh1YD495K9Q@z>

Do you see this failure at your end?
Our environment is build on host and install them on target device and
run on Device under test (DUT).

Did i miss any kernel config fragments ?

bpf: test_sock_fields_ #
# libbpf Error in bpf_create_map_xattr(sk_pkt_out_cnt)Invalid
argument(22). Retrying without BTF.
Error: in_bpf_create_map_xattr(sk_pkt_out_cnt)Invalid #
# libbpf failed to create map (name 'sk_pkt_out_cnt') Invalid argument
failed: to_create #
# libbpf failed to load object 'test_sock_fields_kern.o'
failed: to_load #
# main(439)FAILbpf_prog_load_xattr() err-22
err-22: _ #
[FAIL] 22 selftests bpf test_sock_fields
selftests: bpf_test_sock_fields [FAIL]

Full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190605/testrun/761646/log

Config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/536/config

Test results for comparison,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_sock_fields

Best regards
Naresh Kamboju
