From: ci_notify at linaro.org (ci_notify at linaro.org)
Date: Wed, 20 Mar 2019 10:00:43 +0000 (UTC)
Subject: next-20190320 kselftest results
Message-ID: <2068117060.4104.1553076044320.JavaMail.jenkins@a6c5c67cda76>

Summary
------------------------------------------------------------------------
kernel: 5.1.0-rc1
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: 835727301ed31a91cfd7fb57163cda722646ced6
git describe: next-20190320
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190320

Regressions (compared to build next-20190319)
------------------------------------------------------------------------
juno-r2 - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
qemu_arm:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                         
    * timers_rtcpie                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
qemu_i386:                                                                                                      
 kselftest:                                                                                         
    * net_pmtu.sh                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
x15 - arm:                                                                                                      
 kselftest:                                                                                         
    * net_pmtu.sh                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_netcnt                                                                                                         
                                                                                         
    * net_pmtu.sh                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190319)                                                                   
------------------------------------------------------------------------                                               
hi6220-hikey - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_maps                                                                                                         
i386:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
juno-r2 - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
qemu_arm:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
qemu_i386:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         
x86_64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-native:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         
                                                                                                      
 kselftest-vsyscall-mode-none:                                                                                         
    * bpf_test_btf                                                                                                         
                                                                                         
    * bpf_test_libbpf.sh                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * bpf_test_sockmap                                                                                                         


In total:
------------------------------------------------------------------------
Ran 1424 total tests in the following environments and test suites.
pass 937
fail 298
xfail 0
skip 189

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
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/cgroup_test_core
* kselftest/cpufreq_main.sh
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_xfrm_policy.sh
* kselftest/pstore_pstore_tests
* kselftest/timestamping_txtimestamp.sh

qemu_i386:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_maps
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_skb_cgroup_id.sh
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user
* kselftest/bpf_test_xdp_vlan.sh
* kselftest/cgroup_test_core
* kselftest/cpufreq_main.sh
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_xfrm_policy.sh
* kselftest/pstore_pstore_tests
* kselftest/seccomp_seccomp_bpf
* kselftest/size_get_size
* kselftest/timestamping_txtimestamp.sh

juno-r2:
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/cgroup_test_core
* kselftest/cpufreq_main.sh
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/pstore_pstore_tests
* kselftest/timestamping_txtimestamp.sh

x15:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_skb_cgroup_id.sh
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_xdp_vlan.sh
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_reuseport_bpf_numa
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/pidfd_pidfd_test
* kselftest/proc_proc-self-syscall
* kselftest/pstore_pstore_tests
* kselftest/seccomp_seccomp_bpf
* kselftest/timestamping_txtimestamp.sh

qemu_arm64:
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_maps
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap
* kselftest/cgroup_test_core
* kselftest/cpufreq_main.sh
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/pstore_pstore_tests
* kselftest/timestamping_txtimestamp.sh

qemu_arm:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_maps
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_skb_cgroup_id.sh
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sock_fields
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_tcpnotify_user
* kselftest/bpf_test_xdp_vlan.sh
* kselftest/cgroup_test_core
* kselftest/cpufreq_main.sh
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_reuseport_bpf_numa
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/pidfd_pidfd_test
* kselftest/proc_proc-self-syscall
* kselftest/pstore_pstore_tests
* kselftest/seccomp_seccomp_bpf
* kselftest/timers_rtcpie
* kselftest/timestamping_txtimestamp.sh
* kselftest/tpm2_test_smoke.sh
* kselftest/tpm2_test_space.sh
* kselftest/vm_run_vmtests

dragonboard-410c:

x86:
* kselftest-vsyscall-mode-native/bpf_test_align
* kselftest-vsyscall-mode-native/bpf_test_flow_dissector.sh
* kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-native/bpf_test_lwt_ip_encap.sh
* kselftest-vsyscall-mode-native/bpf_test_lwt_seg6local.sh
* kselftest-vsyscall-mode-native/bpf_test_netcnt
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest-vsyscall-mode-native/cgroup_test_core
* kselftest-vsyscall-mode-native/dma-buf_udmabuf
* kselftest-vsyscall-mode-native/firmware_fw_run_tests.sh
* kselftest-vsyscall-mode-native/net_fib-onlink-tests.sh
* kselftest-vsyscall-mode-native/net_ip_defrag.sh
* kselftest-vsyscall-mode-native/net_pmtu.sh
* kselftest-vsyscall-mode-native/net_psock_snd.sh
* kselftest-vsyscall-mode-native/net_test_vxlan_under_vrf.sh
* kselftest-vsyscall-mode-native/net_xfrm_policy.sh
* kselftest-vsyscall-mode-native/pstore_pstore_tests
* kselftest-vsyscall-mode-none/bpf_test_align
* kselftest-vsyscall-mode-none/bpf_test_flow_dissector.sh
* kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-none/bpf_test_lwt_ip_encap.sh
* kselftest-vsyscall-mode-none/bpf_test_lwt_seg6local.sh
* kselftest-vsyscall-mode-none/bpf_test_netcnt
* kselftest-vsyscall-mode-none/bpf_test_progs
* kselftest-vsyscall-mode-none/cgroup_test_core
* kselftest-vsyscall-mode-none/dma-buf_udmabuf
* kselftest-vsyscall-mode-none/firmware_fw_run_tests.sh
* kselftest-vsyscall-mode-none/net_fib-onlink-tests.sh
* kselftest-vsyscall-mode-none/net_ip_defrag.sh
* kselftest-vsyscall-mode-none/net_pmtu.sh
* kselftest-vsyscall-mode-none/net_psock_snd.sh
* kselftest-vsyscall-mode-none/net_test_vxlan_under_vrf.sh
* kselftest-vsyscall-mode-none/net_xfrm_policy.sh
* kselftest-vsyscall-mode-none/pstore_pstore_tests
* kselftest-vsyscall-mode-none/timestamping_txtimestamp.sh
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_xfrm_policy.sh
* kselftest/pstore_pstore_tests
* kselftest/timestamping_txtimestamp.sh

hi6220-hikey:

i386:
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_align
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs
* kselftest/bpf_test_skb_cgroup_id.sh
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_socket_cookie
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tcpbpf_user
* kselftest/bpf_test_xdp_vlan.sh
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/firmware_fw_run_tests.sh
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
