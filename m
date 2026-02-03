Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74439E6C0;
	Tue,  3 Feb 2026 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125836; cv=none; b=RYqBDNPu+otlyOX+m3ZhYc9JqkkmeJ6SJxZg90p3GdAmP01Ad3/BhR2rtN3/HkDtQa3aVxHon0rcqByj0x3s+W8qDdrF+U21uOP1iTjZWC1fRt3qCNaPYzlBVk9NoZ3EAZoefV7qrBpiURGGDWnOOdjEfPaE3TdqidsLLmYjrXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125836; c=relaxed/simple;
	bh=rw0gSF81kWJjXjxNT4EqhGLXKLZqoCeOWsfQecAoB2Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BWFf4d5QBYjG3RN7PvDsC2RdPiT+4R+3qI5A47+3spRRKcnwhR1nfoBQBuvIlUD6tlXaPg8Y6/GY3+NHOP3xstXjo1/3bF45thkIa6BaPkGsGNsGoQpDupGOwrOgg1UdoIFcq9kH3sGLO65ybbgQuXR9iMmmVMXdEBQl2InwUvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=dusXFYlJ; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="dusXFYlJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CqubJfRKtELmBUm9z6lD8QdFSTuVtm6HzXlTGdgh7M8=;
	b=dusXFYlJNsOFxsmML1RvkhThQxRCT8ug8nHprDdaXs+xMcN0FlPKnTbasXUHao6IGCeCPnFjh
	BAoh38Ii6LRogC5j1pWP/kOueKR6kjv8kBcvjIIPDHzN36eP1X7i1z5GrhhYintx85IfBfFjC30
	PQBhGsytu85VJD6skodsgBY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f54DN6HSyzpTLr;
	Tue,  3 Feb 2026 21:32:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 13EB74056A;
	Tue,  3 Feb 2026 21:37:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<shuah@kernel.org>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <kevin.brodsky@arm.com>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <anshuman.khandual@arm.com>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<tglx@kernel.org>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Date: Tue, 3 Feb 2026 21:37:15 +0800
Message-ID: <20260203133728.848283-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Currently, x86, Riscv, Loongarch use the Generic Entry which makes
maintainers' work easier and codes more elegant. arm64 has already
successfully switched to the Generic IRQ Entry in commit
b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
time to completely convert arm64 to Generic Entry.

The goal is to bring arm64 in line with other architectures that already
use the generic entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths, such as
"Syscall User Dispatch".

This patch set is rebased on "sched/core". And the performance
was measured on Kunpeng 920 using "perf bench basic syscall" with
"arm64.nopauth selinux=0 audit=1".

On the basis of optimizing syscall_get_arguments()[1], el0_svc_common(),
the performance are below:

| Metric     | W/O Generic Entry | With Generic Entry opt| Change |
| ---------- | ----------------- | ------------------    | ------ |
| Total time | 2.487 [sec]       | 2.264 [sec]           | ↓9.0% |
| usecs/op   | 0.248780          | 0.226481              | ↓9.0% |
| ops/sec    | 4,019,620         | 4,415,383             | ↑9.8% |

Therefore, after the optimization, ARM64 System Call performance improved
by approximately 9%.

It was tested ok with following test cases on kunpeng920 and QEMU
virt platform:
 - Perf tests.
 - Different `dynamic preempt` mode switch.
 - Pseudo NMI tests.
 - Stress-ng CPU stress test.
 - Hackbench stress test.
 - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
   and all test cases in tools/testing/selftests/arm64/mte/*.
 - "sud" selftest testcase.
 - get_set_sud, get_syscall_info, set_syscall_info, peeksiginfo
   in tools/testing/selftests/ptrace.
 - breakpoint_test_arm64 in selftests/breakpoints.
 - syscall-abi and ptrace in tools/testing/selftests/arm64/abi
 - fp-ptrace, sve-ptrace, za-ptrace in selftests/arm64/fp.
 - vdso_test_getrandom in tools/testing/selftests/vDSO
 - Strace tests.

The test QEMU configuration is as follows:

	qemu-system-aarch64 \
		-M virt,gic-version=3,virtualization=on,mte=on \
		-cpu max,pauth-impdef=on \
		-kernel Image \
		-smp 8,sockets=1,cores=4,threads=2 \
		-m 512m \
		-nographic \
		-no-reboot \
		-device virtio-rng-pci \
		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1" \
		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
		-device virtio-blk-device,drive=hd0 \

[1]: https://kernel.googlesource.com/pub/scm/linux/kernel/git/akpm/mm/+/89bf683c9507c280e20c3e17b4ea15e19696ed63%5E%21/#F0

Changes in v12:
- Rebased on "sched/core", so remove the four generic entry patches.
- Move "Expand secure_computing() in place" and "Use syscall_get_arguments()
  helper" patch forward, which will group all non-functional cleanups
  at the front.
- Adjust the explanation for moving rseq_syscall() before audit_syscall_exit().
- Link to v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/

Changes in v11:
- Remove unused syscall in syscall_trace_enter().
- Update and provide a detailed explanation of the differences after
  moving rseq_syscall() before audit_syscall_exit().
- Rebased on arm64 (for-next/entry), and remove the first applied 3 patchs.
- syscall_exit_to_user_mode_work() for arch reuse instead of adding
  new syscall_exit_to_user_mode_work_prepare() helper.
- Link to v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/

Changes in v10:
- Rebased on v6.19-rc1, rename syscall_exit_to_user_mode_prepare() to
  syscall_exit_to_user_mode_work_prepare() to avoid conflict.
- Also inline syscall_trace_enter().
- Support aarch64 for sud_benchmark.
- Update and correct the commit message.
- Add Reviewed-by.
- Link to v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/

Changes in v9:
- Move "Return early for ptrace_report_syscall_entry() error" patch ahead
  to make it not introduce a regression.
- Not check _TIF_SECCOMP/SYSCALL_EMU for syscall_exit_work() in
  a separate patch.
- Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP in a separate
  patch.
- Add two performance patch to improve the arm64 performance.
- Add Reviewed-by.
- Link to v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/

Changes in v8:
- Rename "report_syscall_enter()" to "report_syscall_entry()".
- Add ptrace_save_reg() to avoid duplication.
- Remove unused _TIF_WORK_MASK in a standalone patch.
- Align syscall_trace_enter() return value with the generic version.
- Use "scno" instead of regs->syscallno in el0_svc_common().
- Move rseq_syscall() ahead in a standalone patch to clarify it clearly.
- Rename "syscall_trace_exit()" to "syscall_exit_work()".
- Keep the goto in el0_svc_common().
- No argument was passed to __secure_computing() and check -1 not -1L.
- Remove "Add has_syscall_work() helper" patch.
- Move "Add syscall_exit_to_user_mode_prepare() helper" patch later.
- Add miss header for asm/entry-common.h.
- Update the implementation of arch_syscall_is_vdso_sigreturn().
- Add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
  to keep the behaviour unchanged.
- Add more testcases test.
- Add Reviewed-by.
- Update the commit message.
- Link to v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/

Jinjie Ruan (12):
  arm64: Remove unused _TIF_WORK_MASK
  arm64/ptrace: Split report_syscall()
  arm64/ptrace: Return early for ptrace_report_syscall_entry() error
  arm64/ptrace: Refactor syscall_trace_enter/exit()
  arm64/ptrace: Expand secure_computing() in place
  arm64/ptrace: Use syscall_get_arguments() helper
  arm64: ptrace: Move rseq_syscall() before audit_syscall_exit()
  arm64: syscall: Rework el0_svc_common()
  arm64/ptrace: Not check _TIF_SECCOMP/SYSCALL_EMU for
    syscall_exit_work()
  arm64/ptrace: Do not report_syscall_exit() for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()

kemal (1):
  selftests: sud_test: Support aarch64

 arch/arm64/Kconfig                            |  2 +-
 arch/arm64/include/asm/entry-common.h         | 76 +++++++++++++++
 arch/arm64/include/asm/syscall.h              | 19 +++-
 arch/arm64/include/asm/thread_info.h          | 22 +----
 arch/arm64/kernel/debug-monitors.c            |  7 ++
 arch/arm64/kernel/ptrace.c                    | 94 -------------------
 arch/arm64/kernel/signal.c                    |  2 +-
 arch/arm64/kernel/syscall.c                   | 29 ++----
 .../syscall_user_dispatch/sud_benchmark.c     |  2 +-
 .../syscall_user_dispatch/sud_test.c          |  4 +
 10 files changed, 115 insertions(+), 142 deletions(-)

-- 
2.34.1

