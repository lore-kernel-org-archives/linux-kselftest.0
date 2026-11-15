Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761104;
	b=SiuZmG0AxnzX/mRQewVA6a5sYTFRibKTqIx+mc8SagGKWBOlYoe6f/MDxd0UAaxJDuzh
	 vbq+w420RJUTXJc9VDR9cSwuNCsyyvp9DM4tRa8CxlUjm1ZXlb7xTEbutSq3uJ29pC3oX
	 inX0qBYuaUa5ZycTFhLZV+ibHRjJtVZdXH2hi65M7pUEk8K4fBOfQKa05ZKAWWsyjTDrp
	 onzwBA+KjHoYxIisqj7I9Qbi48zz/ChtG0ASlGbaRUWKgZ04CP5/D8hNMULQOE0iO46qk
	 3lgoSJu0Z+xZCmbu5VIuFIQdTdZg32F51tN/XJ7/L85xEp1/FnGHOg+kd1rgKYDq8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761104;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=juY0mzYvsBTBUOwp4m6lM/3wla3CNWs/VBXtTEzxbWc=;
	b=3ZmmKRKBYHrG2u4dddl//ltPHQsY+z9I/C5BzYLADPnYVJi9ByngBsdcrO7aIQkzjVEJ
	 hyTcPt9XsikLh0UWCsGaRpHoCyuGArFOjzKvbAEOAM1aLtMiGBgRfBwtY73LQ0UDHftUu
	 h9fUHoxou4MjVx4k627yc5PlqQ18cbttjqKp5C9I2ZDM3u0Qafnz+RPLgN0mwsZX8BkQP
	 ULPEpXgqjbYatOAXAOntApPk3GGXNUJG09hhRG1kpXlkXhGi4sjJQnYzjcrzijhMHG46l
	 yJ6eIXMq5wpYRzCHadS8cZg5++48S4lkjW3D7wGMl87XlUlrUugnRVsgk89ga5kgLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b="Q95DQ6/B";
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C7606A339
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9C7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Q95DQ6/B
X-KPN-MessageId: e38137c2-e113-11f1-ba8e-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e38137c2-e113-11f1-ba8e-005056999439;
	Sun, 15 Nov 2026 17:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=juY0mzYvsBTBUOwp4m6lM/3wla3CNWs/VBXtTEzxbWc=;
	b=Q95DQ6/BLSfcyjcyVvee3iDXFsb0BhEKYW3arMOLyaRSgnnd2gkVvsfp8/DlIvRcjRICVqVz4ZLJW
	 oNor8kzGnc3CE7h9/8FWOUTHmndoRk1nJ+s2uBmzZOgRS+2mLn9G3cyp9sYox7WfoTbNPWpJ1HrzQG
	 H+NFc/gW+qeq8QDxtceeLFfXupVfxj+0XvlwoQ5HU8HZ1JzLzsE8cmEZgtVsDyZZ6VzOYOWIFEWEe5
	 nsTV7HdU7Xq8LG6crnylSE/dSlDoua0QPobFAW3MyjbIcNwcLMC4sgMJK4cvRk0ZImyZ0XZxMf2aXp
	 9D9dd7TlnQAPOhrE3L2v5nVYoxRVNMA==
X-KPN-MID: 33|/Kwvtx6aJd58jQblhUEJmQitGuzlLbZKtYetxg1WH4AsTGONeKQUIakN+3U3OJl
 jtuyMqjsGuzSfJZyykexEqulUqho0ctwqEtwx3MPirio=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|wWdDexN4+vN6fi6ZdgYKt62Axd7xchL9tLyhIeBEuRNHG2/NI//PZkxZ/08cWqu
 QZOJ3JrfAgtEtRNGnwu7H3Q==
Received: from [10.56.187.180] (unknown [83.172.175.28])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id e3574436-e113-11f1-9bd1-00505699d6e5;
	Sun, 15 Nov 2026 17:44:56 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Sun, 15 Nov 2026 11:44:47 -0500
Subject: [PATCH 2/3] selftests: move the default target list into
 TARGETS_LIST
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ksft-targets-wildcard-v1-2-7512a50d0976@xs4all.nl>
References: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
In-Reply-To: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

The selftests Makefile builds its list of all targets by appending to
TARGETS. When the user sets TARGETS, make ignores those appends, so the
full list is not available to the Makefile. This makes it impossible to,
for example, select targets by matching against the list.

Collect the targets in a separate TARGETS_LIST variable instead and use
it as the default value of TARGETS. TARGETS given on the command line
behaves exactly as before.

A side effect is that TARGETS taken from the environment now replaces
the default list rather than being prepended to it, so that

  $ export TARGETS=ptrace; make -C tools/testing/selftests run_tests

runs only the ptrace tests, the same as passing TARGETS=ptrace on the
command line.

Update kselftest_deps.sh, which greps the Makefile for the target list,
and the documentation accordingly.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 Documentation/dev-tools/kselftest.rst     |   8 +-
 tools/testing/selftests/Makefile          | 305 +++++++++++++++---------------
 tools/testing/selftests/kselftest_deps.sh |   4 +-
 3 files changed, 160 insertions(+), 157 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 0772525cbc62..44da142a67b8 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -118,8 +118,8 @@ dedicated skiplist::
 
   $  make TARGETS="breakpoints size timers" SKIP_TARGETS=size kselftest
 
-See the top-level tools/testing/selftests/Makefile for the list of all
-possible targets.
+See TARGETS_LIST in the top-level tools/testing/selftests/Makefile for
+the list of all possible targets.
 
 Requiring all targets to build successfully
 ===========================================
@@ -367,9 +367,9 @@ Contributing new tests (details)
  * Create a .gitignore file inside test directory and add all generated objects
    in it.
 
- * Add new test name in TARGETS in selftests/Makefile::
+ * Add new test name in TARGETS_LIST in selftests/Makefile::
 
-    TARGETS += android
+    TARGETS_LIST += android
 
  * All changes should pass::
 
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 458300dcb702..4c223bcd2449 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -1,160 +1,163 @@
 # SPDX-License-Identifier: GPL-2.0
-TARGETS += acct
-TARGETS += alloc_tag
-TARGETS += alsa
-TARGETS += amd-pstate
-TARGETS += arm64
-TARGETS += bpf
-TARGETS += breakpoints
-TARGETS += cachestat
-TARGETS += capabilities
-TARGETS += cgroup
-TARGETS += clone3
-TARGETS += connector
-TARGETS += core
-TARGETS += cpu-hotplug
-TARGETS += cpufreq
-TARGETS += damon
-TARGETS += dax
-TARGETS += devices/error_logs
-TARGETS += devices/probe
-TARGETS += dmabuf-heaps
-TARGETS += drivers/dma-buf
-TARGETS += drivers/net
-TARGETS += drivers/net/bonding
-TARGETS += drivers/net/netconsole
-TARGETS += drivers/net/team
-TARGETS += drivers/net/virtio_net
-TARGETS += drivers/ntsync
-TARGETS += drivers/platform/x86/intel/ifs
-TARGETS += drivers/s390x/uvdevice
-TARGETS += dt
-TARGETS += efivarfs
-TARGETS += exec
-TARGETS += fchmodat2
-TARGETS += filesystems
-TARGETS += filesystems/binderfs
-TARGETS += filesystems/configfs
-TARGETS += filesystems/empty_mntns
-TARGETS += filesystems/epoll
-TARGETS += filesystems/eventfd
-TARGETS += filesystems/failfs
-TARGETS += filesystems/fat
-TARGETS += filesystems/file_stressor
-TARGETS += filesystems/freeze
-TARGETS += filesystems/fscontext_ns
-TARGETS += filesystems/fsmount_ns
-TARGETS += filesystems/fuse
-TARGETS += filesystems/mntns_unbindable
-TARGETS += filesystems/mount-notify
-TARGETS += filesystems/mount_cycle
-TARGETS += filesystems/move_mount
-TARGETS += filesystems/nsfs
-TARGETS += filesystems/openat2
-TARGETS += filesystems/open_tree_ns
-TARGETS += filesystems/overlayfs
-TARGETS += filesystems/statmount
-TARGETS += filesystems/umount_propagation
-TARGETS += filesystems/xattr
-TARGETS += firmware
-TARGETS += fpu
-TARGETS += ftrace
-TARGETS += futex
-TARGETS += gpio
-TARGETS += hid
-TARGETS += intel_pstate
-TARGETS += iommu
-TARGETS += ipc
-TARGETS += ir
-TARGETS += kcmp
-TARGETS += kexec
-TARGETS += kselftest_harness
-TARGETS += kvm
-TARGETS += landlock
-TARGETS += lib
-TARGETS += livepatch
-TARGETS += liveupdate
-TARGETS += lkdtm
-TARGETS += lsm
-TARGETS += membarrier
-TARGETS += memfd
-TARGETS += memory-hotplug
-TARGETS += mincore
-TARGETS += mm
-TARGETS += mount
-TARGETS += mount_setattr
-TARGETS += move_mount_set_group
-TARGETS += mqueue
-TARGETS += mseal_system_mappings
-TARGETS += nci
-TARGETS += net
-TARGETS += net/af_unix
-TARGETS += net/can
-TARGETS += net/forwarding
-TARGETS += net/hsr
-TARGETS += net/mptcp
-TARGETS += net/netfilter
-TARGETS += net/openvswitch
-TARGETS += net/ovpn
-TARGETS += net/packetdrill
-TARGETS += net/ppp
-TARGETS += net/rds
-TARGETS += net/tcp_ao
-TARGETS += nfsd
-TARGETS += nolibc
-TARGETS += pcie_bwctrl
-TARGETS += pci_endpoint
-TARGETS += perf_events
-TARGETS += pidfd
-TARGETS += pid_namespace
-TARGETS += pipe
-TARGETS += powerpc
-TARGETS += power_supply
-TARGETS += prctl
-TARGETS += proc
-TARGETS += pstore
-TARGETS += ptrace
-TARGETS += rdma
-TARGETS += resctrl
-TARGETS += riscv
-TARGETS += rlimits
-TARGETS += rseq
-TARGETS += rtc
-TARGETS += rust
-TARGETS += sched_ext
-TARGETS += seccomp
-TARGETS += sgx
-TARGETS += signal
-TARGETS += size
-TARGETS += sparc64
-TARGETS += splice
-TARGETS += static_keys
-TARGETS += sync
-TARGETS += syscall_user_dispatch
-TARGETS += sysctl
-TARGETS += tc-testing
-TARGETS += tdx
-TARGETS += thermal/intel/power_floor
-TARGETS += thermal/intel/workload_hint
-TARGETS += timens
+TARGETS_LIST += acct
+TARGETS_LIST += alloc_tag
+TARGETS_LIST += alsa
+TARGETS_LIST += amd-pstate
+TARGETS_LIST += arm64
+TARGETS_LIST += bpf
+TARGETS_LIST += breakpoints
+TARGETS_LIST += cachestat
+TARGETS_LIST += capabilities
+TARGETS_LIST += cgroup
+TARGETS_LIST += clone3
+TARGETS_LIST += connector
+TARGETS_LIST += core
+TARGETS_LIST += cpu-hotplug
+TARGETS_LIST += cpufreq
+TARGETS_LIST += damon
+TARGETS_LIST += dax
+TARGETS_LIST += devices/error_logs
+TARGETS_LIST += devices/probe
+TARGETS_LIST += dmabuf-heaps
+TARGETS_LIST += drivers/dma-buf
+TARGETS_LIST += drivers/net
+TARGETS_LIST += drivers/net/bonding
+TARGETS_LIST += drivers/net/netconsole
+TARGETS_LIST += drivers/net/team
+TARGETS_LIST += drivers/net/virtio_net
+TARGETS_LIST += drivers/ntsync
+TARGETS_LIST += drivers/platform/x86/intel/ifs
+TARGETS_LIST += drivers/s390x/uvdevice
+TARGETS_LIST += dt
+TARGETS_LIST += efivarfs
+TARGETS_LIST += exec
+TARGETS_LIST += fchmodat2
+TARGETS_LIST += filesystems
+TARGETS_LIST += filesystems/binderfs
+TARGETS_LIST += filesystems/configfs
+TARGETS_LIST += filesystems/empty_mntns
+TARGETS_LIST += filesystems/epoll
+TARGETS_LIST += filesystems/eventfd
+TARGETS_LIST += filesystems/failfs
+TARGETS_LIST += filesystems/fat
+TARGETS_LIST += filesystems/file_stressor
+TARGETS_LIST += filesystems/freeze
+TARGETS_LIST += filesystems/fscontext_ns
+TARGETS_LIST += filesystems/fsmount_ns
+TARGETS_LIST += filesystems/fuse
+TARGETS_LIST += filesystems/mntns_unbindable
+TARGETS_LIST += filesystems/mount-notify
+TARGETS_LIST += filesystems/mount_cycle
+TARGETS_LIST += filesystems/move_mount
+TARGETS_LIST += filesystems/nsfs
+TARGETS_LIST += filesystems/openat2
+TARGETS_LIST += filesystems/open_tree_ns
+TARGETS_LIST += filesystems/overlayfs
+TARGETS_LIST += filesystems/statmount
+TARGETS_LIST += filesystems/umount_propagation
+TARGETS_LIST += filesystems/xattr
+TARGETS_LIST += firmware
+TARGETS_LIST += fpu
+TARGETS_LIST += ftrace
+TARGETS_LIST += futex
+TARGETS_LIST += gpio
+TARGETS_LIST += hid
+TARGETS_LIST += intel_pstate
+TARGETS_LIST += iommu
+TARGETS_LIST += ipc
+TARGETS_LIST += ir
+TARGETS_LIST += kcmp
+TARGETS_LIST += kexec
+TARGETS_LIST += kselftest_harness
+TARGETS_LIST += kvm
+TARGETS_LIST += landlock
+TARGETS_LIST += lib
+TARGETS_LIST += livepatch
+TARGETS_LIST += liveupdate
+TARGETS_LIST += lkdtm
+TARGETS_LIST += lsm
+TARGETS_LIST += membarrier
+TARGETS_LIST += memfd
+TARGETS_LIST += memory-hotplug
+TARGETS_LIST += mincore
+TARGETS_LIST += mm
+TARGETS_LIST += mount
+TARGETS_LIST += mount_setattr
+TARGETS_LIST += move_mount_set_group
+TARGETS_LIST += mqueue
+TARGETS_LIST += mseal_system_mappings
+TARGETS_LIST += nci
+TARGETS_LIST += net
+TARGETS_LIST += net/af_unix
+TARGETS_LIST += net/can
+TARGETS_LIST += net/forwarding
+TARGETS_LIST += net/hsr
+TARGETS_LIST += net/mptcp
+TARGETS_LIST += net/netfilter
+TARGETS_LIST += net/openvswitch
+TARGETS_LIST += net/ovpn
+TARGETS_LIST += net/packetdrill
+TARGETS_LIST += net/ppp
+TARGETS_LIST += net/rds
+TARGETS_LIST += net/tcp_ao
+TARGETS_LIST += nfsd
+TARGETS_LIST += nolibc
+TARGETS_LIST += pcie_bwctrl
+TARGETS_LIST += pci_endpoint
+TARGETS_LIST += perf_events
+TARGETS_LIST += pidfd
+TARGETS_LIST += pid_namespace
+TARGETS_LIST += pipe
+TARGETS_LIST += powerpc
+TARGETS_LIST += power_supply
+TARGETS_LIST += prctl
+TARGETS_LIST += proc
+TARGETS_LIST += pstore
+TARGETS_LIST += ptrace
+TARGETS_LIST += rdma
+TARGETS_LIST += resctrl
+TARGETS_LIST += riscv
+TARGETS_LIST += rlimits
+TARGETS_LIST += rseq
+TARGETS_LIST += rtc
+TARGETS_LIST += rust
+TARGETS_LIST += sched_ext
+TARGETS_LIST += seccomp
+TARGETS_LIST += sgx
+TARGETS_LIST += signal
+TARGETS_LIST += size
+TARGETS_LIST += sparc64
+TARGETS_LIST += splice
+TARGETS_LIST += static_keys
+TARGETS_LIST += sync
+TARGETS_LIST += syscall_user_dispatch
+TARGETS_LIST += sysctl
+TARGETS_LIST += tc-testing
+TARGETS_LIST += tdx
+TARGETS_LIST += thermal/intel/power_floor
+TARGETS_LIST += thermal/intel/workload_hint
+TARGETS_LIST += timens
 ifneq (1, $(quicktest))
-TARGETS += timers
+TARGETS_LIST += timers
 endif
-TARGETS += tmpfs
-TARGETS += tpm2
-TARGETS += tty
-TARGETS += ublk
-TARGETS += uevent
-TARGETS += user_events
-TARGETS += vDSO
-TARGETS += vfio
-TARGETS += x86
-TARGETS += x86/bugs
-TARGETS += zram
-#Please keep the TARGETS list alphabetically sorted (LC_ALL=C sort -f)
+TARGETS_LIST += tmpfs
+TARGETS_LIST += tpm2
+TARGETS_LIST += tty
+TARGETS_LIST += ublk
+TARGETS_LIST += uevent
+TARGETS_LIST += user_events
+TARGETS_LIST += vDSO
+TARGETS_LIST += vfio
+TARGETS_LIST += x86
+TARGETS_LIST += x86/bugs
+TARGETS_LIST += zram
+#Please keep TARGETS_LIST alphabetically sorted (LC_ALL=C sort -f)
 # Run "make quicktest=1 run_tests" or
 # "make quicktest=1 kselftest" from top level Makefile
 
+# Build and run all targets unless the user asks for specific ones.
+TARGETS ?= $(TARGETS_LIST)
+
 TARGETS_HOTPLUG = cpu-hotplug
 TARGETS_HOTPLUG += memory-hotplug
 
diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/selftests/kselftest_deps.sh
index 70b834361cb7..8567f7a64e25 100755
--- a/tools/testing/selftests/kselftest_deps.sh
+++ b/tools/testing/selftests/kselftest_deps.sh
@@ -115,8 +115,8 @@ pass_trgts=()
 pass_libs=()
 pass_cnt=0
 
-# Get all TARGETS from selftests Makefile
-targets=$(grep -E "^TARGETS +|^TARGETS =" Makefile | cut -d "=" -f2)
+# Get all TARGETS_LIST entries from selftests Makefile
+targets=$(grep -E "^TARGETS_LIST +|^TARGETS_LIST =" Makefile | cut -d "=" -f2)
 
 # Initially, in LDLIBS related lines, the dep checker needs
 # to ignore lines containing the following strings:

-- 
2.56.0

