From: ci_notify@linaro.org (ci_notify@linaro.org)
Date: Tue, 26 Feb 2019 22:00:24 +0000 (UTC)
Subject: next-20190226 kselftest results
Message-ID: <1552946746.675.1551218425695.JavaMail.jenkins@a6c5c67cda76>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190226220024.kQcmuCz3ocgfuc5bW3DDgg5mLhOrdg5-m9rqkJRdRCQ@z>

Summary
------------------------------------------------------------------------
kernel: 5.0.0-rc8
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: 8e7f81e2ebc4a71a8fe81bcffb72ecdc9a0bbe75
git describe: next-20190226
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190226

Regressions (compared to build next-20190225)
------------------------------------------------------------------------
hi6220-hikey - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_fields                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_fields                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190225)                                                                   
------------------------------------------------------------------------                                               
dragonboard-410c - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_fields                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         


In total:
------------------------------------------------------------------------
Ran 329 total tests in the following environments and test suites.
pass 244
fail 85
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

qemu_arm64:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sock_fields

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

x15:

hi6220-hikey:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap

juno-r2:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_progs
* kselftest/bpf_test_sock_addr.sh

dragonboard-410c:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap

x86:
* kselftest-vsyscall-mode-native/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest-vsyscall-mode-native/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-native/bpf_test_sockmap
* kselftest-vsyscall-mode-none/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-none/bpf_test_progs
* kselftest-vsyscall-mode-none/bpf_test_sock_addr.sh
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
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
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
