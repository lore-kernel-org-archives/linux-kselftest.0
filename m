From: ci_notify at linaro.org (ci_notify at linaro.org)
Date: Thu, 28 Feb 2019 11:00:24 +0000 (UTC)
Subject: next-20190228 kselftest results
Message-ID: <153471780.965.1551351625022.JavaMail.jenkins@a6c5c67cda76>

Summary
------------------------------------------------------------------------
kernel: 5.0.0-rc8
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: 42fd8df9d1d9c83046226e771a4f5f3d05a706ff
git describe: next-20190228
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190228

Regressions (compared to build next-20190227)
------------------------------------------------------------------------
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_fields                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190227)                                                                   
------------------------------------------------------------------------                                               
hi6220-hikey - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_maps                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         


In total:
------------------------------------------------------------------------
Ran 290 total tests in the following environments and test suites.
pass 214
fail 76
xfail 0
skip 0

Environments
--------------
- dragonboard-410c - arm64
- hi6220-hikey - arm64
- i386
- juno-r2 - arm64
- qemu_arm
- qemu_arm64
- qemu_i386
- qemu_x86_64
- x15 - arm
- x86_64

Test Suites
-----------
* kselftest
* kselftest-vsyscall-mode-native
* kselftest-vsyscall-mode-none


Failures
------------------------------------------------------------------------

x86:
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest/bpf_test_btf
* kselftest/bpf_test_progs
* kselftest-vsyscall-mode-none/bpf_test_btf
* kselftest-vsyscall-mode-none/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-none/bpf_test_progs
* kselftest-vsyscall-mode-none/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-none/bpf_test_sockmap

qemu_arm:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_btf
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user

qemu_x86_64:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_sock_addr.sh

qemu_i386:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_btf
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user

hi6220-hikey:
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs

x15:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_btf
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user

juno-r2:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh

qemu_arm64:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sock_fields

i386:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_btf
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
