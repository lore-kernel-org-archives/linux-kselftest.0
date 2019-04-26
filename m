From: ci_notify at linaro.org (ci_notify at linaro.org)
Date: Fri, 26 Apr 2019 18:00:36 +0000 (UTC)
Subject: next-20190426 kselftest results
Message-ID: <1794738227.15432.1556301637263.JavaMail.jenkins@a6c5c67cda76>

Summary
------------------------------------------------------------------------
kernel: 5.1.0-rc6
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git commit: 3ddfa8af5dc94e9a86c539036f42ff5477419164
git describe: next-20190426
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190426

Regressions (compared to build next-20190424)
------------------------------------------------------------------------
qemu_arm:                                                                                                      
 kselftest:                                                                                         
    * timers_rtcpie                                                                                                         
qemu_arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
qemu_x86_64:                                                                                                      
 kselftest:                                                                                         
    * proc_read                                                                                                         
                                                                                                          
                                                                                                                       
Fixes (compared to build next-20190424)                                                                   
------------------------------------------------------------------------                                               
juno-r2 - arm64:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
qemu_arm:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_maps                                                                                                         
                                                                                         
    * bpf_test_sock_addr.sh                                                                                                         
                                                                                         
    * cgroup_test_freezer                                                                                                         
x15 - arm:                                                                                                      
 kselftest:                                                                                         
    * bpf_test_maps                                                                                                         


In total:
------------------------------------------------------------------------
Ran 1371 total tests in the following environments and test suites.
pass 781
fail 468
xfail 0
skip 122

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
* boot-lkft-kselftests-master-508
* kselftest
* boot-lkft-kselftests-vsyscall-mode-native-master-508
* kselftest-vsyscall-mode-native


Failures
------------------------------------------------------------------------

qemu_arm64:
* kselftest/binderfs_binderfs_test
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
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tcp_check_syncookie.sh
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/bpf_test_verifier
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
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_run_netsocktests
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_tls
* kselftest/pidfd_pidfd_test
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/rtc_rtctest
* kselftest/seccomp_seccomp_bpf
* kselftest/timestamping_txtimestamp.sh

qemu_x86_64:
* kselftest/binderfs_binderfs_test
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_run_netsocktests
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_tls
* kselftest/net_xfrm_policy.sh
* kselftest/pidfd_pidfd_test
* kselftest/proc_read
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/rseq_run_param_test.sh
* kselftest/rtc_rtctest
* kselftest/seccomp_seccomp_bpf
* kselftest/timestamping_txtimestamp.sh
* kselftest/tpm2_test_smoke.sh
* kselftest/tpm2_test_space.sh
* kselftest/vm_run_vmtests
* kselftest/x86_fsgsbase_64

x15:
* kselftest/binderfs_binderfs_test
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_sysctl
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tcp_check_syncookie.sh
* kselftest/bpf_test_tcpnotify_user
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/bpf_test_verifier
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_reuseport_bpf_numa
* kselftest/net_run_netsocktests
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_tls
* kselftest/pidfd_pidfd_test
* kselftest/proc_proc-self-map-files-002
* kselftest/proc_proc-self-syscall
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/rtc_rtctest
* kselftest/seccomp_seccomp_bpf
* kselftest/timestamping_txtimestamp.sh

qemu_i386:
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs

hi6220-hikey:
* kselftest/binderfs_binderfs_test
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sock_addr.sh
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tcp_check_syncookie.sh
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/bpf_test_verifier
* kselftest/cgroup_test_core
* kselftest/dma-buf_udmabuf
* kselftest/kvm_clear_dirty_log_test
* kselftest/kvm_cr4_cpuid_sync_test
* kselftest/kvm_dirty_log_test
* kselftest/kvm_evmcs_test
* kselftest/kvm_hyperv_cpuid
* kselftest/kvm_platform_info_test
* kselftest/kvm_set_sregs_test
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_pmtu.sh
* kselftest/net_run_netsocktests
* kselftest/net_tls
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_sockmap
* kselftest/firmware_fw_run_tests.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/pidfd_pidfd_test
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/timestamping_txtimestamp.sh

x86:
* kselftest-vsyscall-mode-native/binderfs_binderfs_test
* kselftest-vsyscall-mode-native/bpf_test_flow_dissector.sh
* kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
* kselftest-vsyscall-mode-native/bpf_test_lwt_ip_encap.sh
* kselftest-vsyscall-mode-native/bpf_test_lwt_seg6local.sh
* kselftest-vsyscall-mode-native/bpf_test_netcnt
* kselftest-vsyscall-mode-native/bpf_test_progs
* kselftest-vsyscall-mode-native/bpf_test_sockmap
* kselftest-vsyscall-mode-native/bpf_test_tc_edt.sh
* kselftest-vsyscall-mode-native/bpf_test_tc_tunnel.sh
* kselftest-vsyscall-mode-native/cgroup_test_core
* kselftest-vsyscall-mode-native/dma-buf_udmabuf
* kselftest-vsyscall-mode-native/firmware_fw_run_tests.sh
* kselftest-vsyscall-mode-native/kvm_clear_dirty_log_test
* kselftest-vsyscall-mode-native/kvm_cr4_cpuid_sync_test
* kselftest-vsyscall-mode-native/kvm_dirty_log_test
* kselftest-vsyscall-mode-native/kvm_evmcs_test
* kselftest-vsyscall-mode-native/kvm_hyperv_cpuid
* kselftest-vsyscall-mode-native/kvm_platform_info_test
* kselftest-vsyscall-mode-native/kvm_set_sregs_test
* kselftest-vsyscall-mode-native/kvm_smm_test
* kselftest-vsyscall-mode-native/kvm_sync_regs_test
* kselftest-vsyscall-mode-native/kvm_vmx_close_while_nested_test
* kselftest-vsyscall-mode-native/kvm_vmx_tsc_adjust_test
* kselftest-vsyscall-mode-native/lib_bitmap.sh
* kselftest-vsyscall-mode-native/lib_prime_numbers.sh
* kselftest-vsyscall-mode-native/lib_strscpy.sh
* kselftest-vsyscall-mode-native/livepatch_test-callbacks.sh
* kselftest-vsyscall-mode-native/livepatch_test-livepatch.sh
* kselftest-vsyscall-mode-native/livepatch_test-shadow-vars.sh
* kselftest-vsyscall-mode-native/membarrier_membarrier_test
* kselftest-vsyscall-mode-native/net_fib-onlink-tests.sh
* kselftest-vsyscall-mode-native/net_ip_defrag.sh
* kselftest-vsyscall-mode-native/net_msg_zerocopy.sh
* kselftest-vsyscall-mode-native/net_pmtu.sh
* kselftest-vsyscall-mode-native/net_psock_snd.sh
* kselftest-vsyscall-mode-native/net_test_vxlan_under_vrf.sh
* kselftest-vsyscall-mode-native/net_xfrm_policy.sh
* kselftest-vsyscall-mode-native/pidfd_pidfd_test
* kselftest-vsyscall-mode-native/timestamping_txtimestamp.sh
* kselftest/binderfs_binderfs_test
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tc_tunnel.sh
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
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_xfrm_policy.sh
* kselftest/pidfd_pidfd_test

juno-r2:
* kselftest/binderfs_binderfs_test
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_tcp_check_syncookie.sh
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/bpf_test_verifier
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
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_run_netsocktests
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_tls
* kselftest/pidfd_pidfd_test
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/rtc_rtctest
* kselftest/seccomp_seccomp_bpf
* kselftest/timestamping_txtimestamp.sh

dragonboard-410c:
* boot-lkft-kselftests-master-508/dragonboard-410c

i386:
* kselftest/bpf_test_maps
* kselftest/bpf_test_progs

qemu_arm:
* kselftest/binderfs_binderfs_test
* kselftest/bpf_get_cgroup_id_user
* kselftest/bpf_test_flow_dissector.sh
* kselftest/bpf_test_lirc_mode2_user
* kselftest/bpf_test_lwt_ip_encap.sh
* kselftest/bpf_test_lwt_seg6local.sh
* kselftest/bpf_test_netcnt
* kselftest/bpf_test_progs
* kselftest/bpf_test_select_reuseport
* kselftest/bpf_test_sockmap
* kselftest/bpf_test_sysctl
* kselftest/bpf_test_tc_edt.sh
* kselftest/bpf_test_tcp_check_syncookie.sh
* kselftest/bpf_test_tcpnotify_user
* kselftest/bpf_test_tc_tunnel.sh
* kselftest/bpf_test_verifier
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
* kselftest/kvm_smm_test
* kselftest/kvm_state_test
* kselftest/kvm_sync_regs_test
* kselftest/kvm_vmx_close_while_nested_test
* kselftest/kvm_vmx_tsc_adjust_test
* kselftest/lib_bitmap.sh
* kselftest/lib_prime_numbers.sh
* kselftest/lib_printf.sh
* kselftest/lib_strscpy.sh
* kselftest/livepatch_test-callbacks.sh
* kselftest/livepatch_test-livepatch.sh
* kselftest/livepatch_test-shadow-vars.sh
* kselftest/membarrier_membarrier_test
* kselftest/net_fib-onlink-tests.sh
* kselftest/net_fib_tests.sh
* kselftest/net_ip_defrag.sh
* kselftest/net_msg_zerocopy.sh
* kselftest/net_pmtu.sh
* kselftest/net_psock_snd.sh
* kselftest/net_reuseport_bpf_numa
* kselftest/net_run_netsocktests
* kselftest/net_test_vxlan_under_vrf.sh
* kselftest/net_tls
* kselftest/pidfd_pidfd_test
* kselftest/proc_proc-self-map-files-002
* kselftest/proc_proc-self-syscall
* kselftest/pstore_pstore_tests
* kselftest/rseq_basic_percpu_ops_test
* kselftest/rseq_basic_test
* kselftest/rseq_param_test
* kselftest/rseq_param_test_benchmark
* kselftest/rseq_param_test_compare_twice
* kselftest/rtc_rtctest
* kselftest/seccomp_seccomp_bpf
* kselftest/timers_rtcpie
* kselftest/timestamping_txtimestamp.sh
* kselftest/tpm2_test_smoke.sh
* kselftest/tpm2_test_space.sh
* kselftest/vm_run_vmtests


Skips
------------------------------------------------------------------------
No skips


-- 
Linaro LKFT
https://lkft.linaro.org
