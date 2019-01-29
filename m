From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 29 Jan 2019 09:04:21 +0100
Subject: next-20190125 kselftest results
In-Reply-To: <20190128215851.GA3369@localhost.localdomain>
References: <20190128215851.GA3369@localhost.localdomain>
Message-ID:
 <CADYN=9KPpupC9sGni0-STuC3pgsDbEcuo4q3K1HgcBtgQu4pNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190129080421.M-mdWlGpXKCwLbDOq1iBd9peLRhZoHj2ECIdvkBJoKU@z>

On Mon, 28 Jan 2019@23:40, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Hi,
>
> LKFT is Linaro’s Linux Kernel Functional Test framework [1].
>
> The mission of LKFT is to perform functional regression testing on
> select Linux kernel branches in real time (as they’re updated) and
> report any regressions as quickly as possible. This is performed by
> executing a variety of functional-tests. The LKFT build uses
> OpenEmbedded to build a userspace image, along with the kernel, for each
> board and branch combination under test.
>
> We perform the testing on a variety of boards [2].
>
> Cheers,
> Anders
> [1] https://lkft.linaro.org/
> [2] https://lkft.linaro.org/boards/
>
>
> Summary
> ------------------------------------------------------------------------
> kernel: 5.0.0-rc3
> git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> git branch: master
> git commit: 494367cb57c95bca5c4b2a45e98ebf4cbf3915f3
> git describe: next-20190125
> Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190125
>
> Regressions (compared to build next-20190124)
> ------------------------------------------------------------------------
>
> hi6220-hikey - arm64:
>  kselftest:
>     * bpf_test_kmod.sh
>     * net_test_bpf.sh
>     * rseq_param_test
>     * rseq_param_test_benchmark
>     * rseq_param_test_compare_twice
>     * seccomp_seccomp_benchmark
>     * seccomp_seccomp_bpf
>     * sigaltstack_sas
>     * size_get_size
>     * splice_default_file_splice_read.sh
>     * static_keys_test_static_keys.sh
>     * sync_sync_test
>     * timers_inconsistency-check
>     * timers_mqueue-lat
>     * timers_nanosleep
>     * timers_nsleep-lat
>     * timers_posix_timers
>     * timers_raw_skew
>     * timers_rtcpie
>     * timers_set-timer-lat
>     * timers_threadtest
>     * user_test_user_copy.sh

We are investigating whats happen here on the Hikey.
Can be due to a faulty HW.
Same job runs on a different Hikey without an issue.

Cheers,
Anders

>
>
> qemu_i386:
>  kselftest:
>     * net_fib_tests.sh
>
>
> qemu_x86_64:
>  kselftest:
>     * bpf_test_maps
>     * net_fib_tests.sh
>
>
> x86_64:
>  kselftest:
>     * net_fib_tests.sh
>
>
> Fixes (compared to build next-20190124)
> ------------------------------------------------------------------------
>
> hi6220-hikey - arm64:
>  kselftest:
>     * net_pmtu.sh
>
>
>
>
> x86_64:
>  kselftest-vsyscall-mode-none:
>     * net_fib_tests.sh
>
>
> In total:
> ------------------------------------------------------------------------
> Ran 445 total tests in the following environments and test suites.
>
> Environments
> --------------
> - dragonboard-410c - arm64
> - hi6220-hikey - arm64
> - i386
> - juno-r2 - arm64
> - qemu_arm
> - qemu_arm64
> - qemu_i386
> - qemu_x86_64
> - x15 - arm
> - x86_64
>
> Test Suites
> -----------
> * kselftest
> * kselftest-vsyscall-mode-native
> * kselftest-vsyscall-mode-none
>
>
> Failures
> ------------------------------------------------------------------------
> qemu_x86_64:
>
>
>
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_libbpf.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_sockmap
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/cgroup_test_core
> * kselftest/cpufreq_main.sh
> * kselftest/dma-buf_udmabuf
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/net_xfrm_policy.sh
> * kselftest/pstore_pstore_tests
> * kselftest/timestamping_txtimestamp.sh
>
> qemu_i386:
>
>
> * kselftest/bpf_get_cgroup_id_user
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_netcnt
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_skb_cgroup_id.sh
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_socket_cookie
> * kselftest/bpf_test_sockmap
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/bpf_test_tcpnotify_user
> * kselftest/cgroup_test_core
> * kselftest/cpufreq_main.sh
> * kselftest/dma-buf_udmabuf
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/net_xfrm_policy.sh
> * kselftest/pstore_pstore_tests
> * kselftest/seccomp_seccomp_bpf
> * kselftest/size_get_size
> * kselftest/timestamping_txtimestamp.sh
>
> x15:
>
>
>
> * kselftest/bpf_get_cgroup_id_user
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_skb_cgroup_id.sh
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_socket_cookie
> * kselftest/bpf_test_sockmap
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/bpf_test_tcpnotify_user
> * kselftest/bpf_test_xdp_vlan.sh
> * kselftest/cgroup_test_core
> * kselftest/dma-buf_udmabuf
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_msg_zerocopy.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_reuseport_bpf_numa
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/pidfd_pidfd_test
> * kselftest/proc_proc-self-syscall
> * kselftest/pstore_pstore_tests
> * kselftest/seccomp_seccomp_bpf
> * kselftest/timestamping_txtimestamp.sh
> * kselftest/vm_run_vmtests
>
> dragonboard-410c:
>
>
> hi6220-hikey:
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_kmod.sh
> * kselftest/bpf_test_libbpf.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/cgroup_test_core
> * kselftest/dma-buf_udmabuf
> * kselftest/firmware_fw_run_tests.sh
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_bpf.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/pstore_pstore_tests
> * kselftest/rseq_param_test
> * kselftest/rseq_param_test_benchmark
> * kselftest/rseq_param_test_compare_twice
> * kselftest/rtc_rtctest
> * kselftest/seccomp_seccomp_benchmark
> * kselftest/seccomp_seccomp_bpf
> * kselftest/sigaltstack_sas
> * kselftest/size_get_size
> * kselftest/splice_default_file_splice_read.sh
> * kselftest/static_keys_test_static_keys.sh
> * kselftest/sync_sync_test
> * kselftest/timers_inconsistency-check
> * kselftest/timers_mqueue-lat
> * kselftest/timers_nanosleep
> * kselftest/timers_nsleep-lat
> * kselftest/timers_posix_timers
> * kselftest/timers_raw_skew
> * kselftest/timers_rtcpie
> * kselftest/timers_set-timer-lat
> * kselftest/timers_threadtest
> * kselftest/timestamping_txtimestamp.sh
> * kselftest/user_test_user_copy.sh
> * kselftest/vm_run_vmtests
>
>
>
>
> juno-r2:
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_libbpf.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/cgroup_test_core
> * kselftest/cpufreq_main.sh
> * kselftest/dma-buf_udmabuf
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/pstore_pstore_tests
> * kselftest/timestamping_txtimestamp.sh
>
>
>
>
> qemu_arm:
>
> * kselftest/bpf_get_cgroup_id_user
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_skb_cgroup_id.sh
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_socket_cookie
> * kselftest/bpf_test_sockmap
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/bpf_test_tcpnotify_user
> * kselftest/bpf_test_xdp_vlan.sh
> * kselftest/cgroup_test_core
> * kselftest/cpufreq_main.sh
> * kselftest/dma-buf_udmabuf
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_msg_zerocopy.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_reuseport_bpf_numa
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/pidfd_pidfd_test
> * kselftest/proc_proc-self-syscall
> * kselftest/pstore_pstore_tests
> * kselftest/seccomp_seccomp_bpf
> * kselftest/timestamping_txtimestamp.sh
> * kselftest/vm_run_vmtests
>
> qemu_arm64:
>
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_libbpf.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/cgroup_test_core
> * kselftest/cpufreq_main.sh
> * kselftest/dma-buf_udmabuf
> * kselftest/firmware_fw_run_tests.sh
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/pstore_pstore_tests
> * kselftest/timestamping_txtimestamp.sh
> * kselftest/vm_run_vmtests
>
> x86:
> * kselftest-vsyscall-mode-native/bpf_test_btf
> * kselftest-vsyscall-mode-native/bpf_test_flow_dissector.sh
> * kselftest-vsyscall-mode-native/bpf_test_libbpf.sh
> * kselftest-vsyscall-mode-native/bpf_test_lirc_mode2_user
> * kselftest-vsyscall-mode-native/bpf_test_lwt_seg6local.sh
> * kselftest-vsyscall-mode-native/bpf_test_progs
> * kselftest-vsyscall-mode-native/bpf_test_sock_addr.sh
> * kselftest-vsyscall-mode-native/bpf_test_tcpbpf_user
> * kselftest-vsyscall-mode-native/cgroup_test_core
> * kselftest-vsyscall-mode-native/dma-buf_udmabuf
> * kselftest-vsyscall-mode-native/net_fib-onlink-tests.sh
> * kselftest-vsyscall-mode-native/net_fib_tests.sh
> * kselftest-vsyscall-mode-native/net_pmtu.sh
> * kselftest-vsyscall-mode-native/net_psock_snd.sh
> * kselftest-vsyscall-mode-native/net_test_vxlan_under_vrf.sh
> * kselftest-vsyscall-mode-native/net_xfrm_policy.sh
> * kselftest-vsyscall-mode-native/pstore_pstore_tests
> * kselftest-vsyscall-mode-native/timestamping_txtimestamp.sh
> * kselftest-vsyscall-mode-none/bpf_test_btf
> * kselftest-vsyscall-mode-none/bpf_test_flow_dissector.sh
> * kselftest-vsyscall-mode-none/bpf_test_libbpf.sh
> * kselftest-vsyscall-mode-none/bpf_test_lirc_mode2_user
> * kselftest-vsyscall-mode-none/bpf_test_lwt_seg6local.sh
> * kselftest-vsyscall-mode-none/bpf_test_progs
> * kselftest-vsyscall-mode-none/bpf_test_sock_addr.sh
> * kselftest-vsyscall-mode-none/bpf_test_tcpbpf_user
> * kselftest-vsyscall-mode-none/cgroup_test_core
> * kselftest-vsyscall-mode-none/net_fib-onlink-tests.sh
> * kselftest-vsyscall-mode-none/net_pmtu.sh
> * kselftest-vsyscall-mode-none/net_psock_snd.sh
> * kselftest-vsyscall-mode-none/net_test_vxlan_under_vrf.sh
> * kselftest-vsyscall-mode-none/net_xfrm_policy.sh
> * kselftest-vsyscall-mode-none/pstore_pstore_tests
>
>
>
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_libbpf.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/cgroup_test_core
> * kselftest/dma-buf_udmabuf
> * kselftest/net_fib-onlink-tests.sh
> * kselftest/net_fib_tests.sh
> * kselftest/net_pmtu.sh
> * kselftest/net_psock_snd.sh
> * kselftest/net_test_vxlan_under_vrf.sh
> * kselftest/net_xfrm_policy.sh
> * kselftest/pstore_pstore_tests
> * kselftest/timestamping_txtimestamp.sh
>
>
> i386:
> * kselftest/bpf_get_cgroup_id_user
> * kselftest/bpf_test_btf
> * kselftest/bpf_test_flow_dissector.sh
> * kselftest/bpf_test_lirc_mode2_user
> * kselftest/bpf_test_lwt_seg6local.sh
> * kselftest/bpf_test_maps
> * kselftest/bpf_test_progs
> * kselftest/bpf_test_select_reuseport
> * kselftest/bpf_test_skb_cgroup_id.sh
> * kselftest/bpf_test_sock_addr.sh
> * kselftest/bpf_test_socket_cookie
> * kselftest/bpf_test_sockmap
> * kselftest/bpf_test_tcpbpf_user
> * kselftest/bpf_test_xdp_vlan.sh
> * kselftest/cgroup_test_core
> * kselftest/dma-buf_udmabuf
> * kselftest/kvm_clear_dirty_log_test
> * kselftest/kvm_cr4_cpuid_sync_test
> * kselftest/kvm_dirty_log_test
> * kselftest/kvm_evmcs_test
> * kselftest/kvm_hyperv_cpuid
> * kselftest/kvm_platform_info_test
> * kselftest/kvm_set_sregs_test
> * kselftest/kvm_state_test
> * kselftest/kvm_sync_regs_test
> * kselftest/kvm_vmx_tsc_adjust_test
>
>
>
>
>
> Skips
> ------------------------------------------------------------------------
> No skips
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
