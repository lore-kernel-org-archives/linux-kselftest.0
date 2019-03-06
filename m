From: ci_notify@linaro.org (ci_notify@linaro.org)
Date: Wed, 6 Mar 2019 10:00:28 +0000 (UTC)
Subject: next-20190306 kselftest results
Message-ID: <815468790.1962.1551866428934.JavaMail.jenkins@a6c5c67cda76>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306100028.ZNGTwN-POY2Ql3wbPVvEuM6RsKlOlq3S1H_HyAYjz6o@z>

Summary
------------------------------------------------------------------------
kernel: 5.0.0
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: cf08baa29613dd899954089e7cc7dba1d478b365
git describe: next-20190306
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190306

Regressions (compared to build next-20190305)
------------------------------------------------------------------------
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190305)                                                                   
------------------------------------------------------------------------                                               
No fixes

In total:
------------------------------------------------------------------------
Ran 351 total tests in the following environments and test suites.
pass 257
fail 94
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
* kselftest/bpf_test_sockmap

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

x86:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap
* kselftest-vsyscall-mode-none/bpf_test_btf
* kselftest-vsyscall-mode-none/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-none/bpf_test_progs
* kselftest-vsyscall-mode-none/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-none/bpf_test_sockmap
* kselftest-vsyscall-mode-native/bpf_test_btf
* kselftest-vsyscall-mode-native/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest-vsyscall-mode-native/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-native/bpf_test_sockmap

qemu_arm64:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap

hi6220-hikey:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh

juno-r2:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap

i386:
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

dragonboard-410c:


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
