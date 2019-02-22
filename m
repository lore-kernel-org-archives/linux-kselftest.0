From: ci_notify@linaro.org (ci_notify@linaro.org)
Date: Fri, 22 Feb 2019 19:00:29 +0000 (UTC)
Subject: next-20190222 kselftest results
Message-ID: <805591017.3149.1550862029498.JavaMail.jenkins@dc828b94788c>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222190029.S_TPAsoDBNxPetYBzbYNaDwAILDyzAXK7lQv0YKdXyM@z>

Summary
------------------------------------------------------------------------
kernel: 5.0.0-rc7
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: 94a47529a645a40ca48f185c367aa418ebad4e5c
git describe: next-20190222
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190222

Regressions (compared to build next-20190221)
------------------------------------------------------------------------
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sockmap                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190221)                                                                   
------------------------------------------------------------------------                                               
hi6220-hikey - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_maps                                                                                                         


In total:
------------------------------------------------------------------------
Ran 362 total tests in the following environments and test suites.
pass 265
fail 97
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

dragonboard-410c:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_progs
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap

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
* kselftest/bpf_test_sock_addr.sh

hi6220-hikey:
* kselftest/bpf_test_btf
* kselftest/bpf_test_libbpf.sh
* kselftest/bpf_test_lirc_mode2_user
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
* kselftest/bpf_test_sockmap

x86:
* kselftest-vsyscall-mode-native/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest-vsyscall-mode-native/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-native/bpf_test_sockmap
* kselftest-vsyscall-mode-none/bpf_test_btf
* kselftest-vsyscall-mode-none/bpf_test_libbpf.sh
* kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-none/bpf_test_progs
* kselftest-vsyscall-mode-none/bpf_test_sock_addr.sh
* kselftest-vsyscall-mode-none/bpf_test_sockmap
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


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
