Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ED03B6BF0;
	Wed, 30 Sep 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763427; cv=none; b=AhO92TRgwO4UwRquklXVWkfhWvWKFIIX928Vabf4gS7k7cWCGXJ3ACm7IU7TsFO7MSlASleLc4ytbSJTKSzTy5z9yRWlhGKE0qzKLRwpAlCN78gbDIpyAAyANe5k6khIq8K7GZEpj2BbuM8J5Rz7gJYeEcjuQWM5q5WfJkX3l1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763427; c=relaxed/simple;
	bh=JSw9Nz+MGmQmtYIG92Y7QlWSZnn2BmA6cKMlmjefhWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p6gFHP6sQYupXi8ciQM+cL/vABeLu9EBdH/u4khpfHm424T0LKpfE3CrhhTJ8b40FJbJS/HoB26srWjz6tv2FRt0soUTs2XN2zUXxIhbri6/GPbl9fa6M0oxJWx6JknhKj6YRRQktzPhgIjCvc5j8rUveT8SDBLM6HpUzkVGdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ULoAa90S; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ULoAa90S"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c2ItHlZv67ryiAvxfgEtZ7xKwS9LdOH8OfnQd4sDZNs=;
	b=ULoAa90Ssgha+sMHyAWZFbUErAgCL6IsFYyBmrEIbNTcu66VGVw0FapR+Zp9Bz5vnSBxyalin
	0zUJI7zGPTGJQlIKEB/Hk2K8WPHSbRQ806jxE9LOq2QdLzv+4v8db+NY5r8eeQetXEX7buFZWT2
	VU6e+5Kn1UBBOrJhZNnjxug=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hvrHy5b4RzLlTm;
	Wed, 30 Sep 2026 18:04:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D31140586;
	Wed, 30 Sep 2026 18:16:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
Date: Wed, 30 Sep 2026 18:17:50 +0800
Message-ID: <20260930101805.1770358-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

This series converts arm64 to the generic entry infrastructure.

Currently, architectures such as x86, RISC-V, LoongArch, PowerPC
and s390 use generic entry, which significantly reduces maintenance
burden and improves code elegance.  arm64 already adopted generic IRQ
entry in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
making it the right time to complete the conversion.

This work brings arm64 in line with other major architectures,
reducing duplicated code and enabling future improvements like
Syscall User Dispatch and rseq time slice extension optimizations.

The series is rebased on v7.3-rc4 and has been tested with stress-ng,
hackbench, kselftests (ptrace, breakpoints, arm64/abi, arm64/fp, vDSO),
ptrace stress test, Pseudo-NMI load test, and the rr test suite [1].

A new kselftest ("selftests/arm64: Add ptrace SYSEMU/single-step tests")
is included at the end of the series, covering the syscall-exit
pseudo-step and single-step behaviour touched by this work.

Observable (non-ABI) changes worth calling out:

- The traceable functions on the syscall path change: syscall_trace_enter,
  syscall_trace_exit and el0_svc_common.constprop.0 are replaced by
  trace_syscall_enter, trace_syscall_exit and syscall_enter_audit, the
  same names x86, RISC-V, LoongArch and s390 already expose.

- CONFIG_DEBUG_RSEQ becomes unselectable on arm64 once GENERIC_ENTRY is
  set (rseq_syscall() becomes a no-op stub), so the earlier rseq_syscall()
  reordering is only temporary and the equivalent is handled by
  __rseq_debug_syscall_return().

On gVisor with systrap mode, the Syscall User Dispatch (SUD) feature
yields a slightly lower performance gain on arm64 (3% ~ 5%), similar to
that on x86 [2].

Result: the average over 1M getpid calls, ns/op

	| KVM VM Configuration | SUD    | no-SUD | Savings % |
	| -------------------  | -----  | -------| --------- |
	| 2 vCPU, pinned       | 4269.8 | 4509.5 | 5.3%      |
	| 4 vCPU, pinned       | 4175.4 | 4369.1 | 4.4%      |
	| 8 vCPU, pinned       | 4352.6 | 4485.4 | 3.0%      |

Note that this series does not yet enable SUD or the rseq time slice
extension on arm64: SUD additionally needs
ARCH_SUPPORTS_SYSCALL_USER_DISPATCH [3] and the rseq slice extension needs
HAVE_GENERIC_TIF_BITS [4], neither of which arm64 selects today.  The
numbers above are the motivation for enabling them in a follow-up.

Testing follow-up that still requires real hardware:

- MTE: run the MTE selftests on real hardware; part of them do not run
  under QEMU.

[1]: https://github.com/rr-debugger/rr/wiki/Building-And-Installing#tests
[2]: https://github.com/google/gvisor/commit/a45d6227b521012109cde9a942d644d778eb773b
[3]: https://lore.kernel.org/all/20260721081858.1169276-16-ruanjinjie@huawei.com/
[4]: https://lore.kernel.org/all/20260320104222.1381274-1-ruanjinjie@huawei.com/

Changes in v20:
- Add a kselftest covering the syscall-exit pseudo-step
  and single-step behaviour.
- Reword the first patch: it skips the pseudo-step for the emulated
  syscall rather than "fixing a redundant exit stop", and drop the
  Fixes: tag and Reviewed-by.
- Add Tested-by.
- Cover letter: document the observable changes and the testing
  follow-ups.
- Link to v19: https://lore.kernel.org/all/20260922035510.1090299-1-ruanjinjie@huawei.com/

Changes in v19:
- Rebased on v7.3-rc4.
- Fix build problem as Karl pointed out.
- Remove has_syscall_work() later to make it more clear.
- Add gvisor test data.
- Link to v18: https://lore.kernel.org/all/20260902095537.602517-2-ruanjinjie@huawei.com/

Changes in v18:
- Rebased on v7.3-rc1.
- Drop the SUD patch as Mark suggeted.
- Update the commit message.
- Add Reviewed-by.
- Link to v17: https://lore.kernel.org/all/20260721081858.1169276-1-ruanjinjie@huawei.com/

For changes in v7 to v16, please refer to the individual patch threads:
- v16: https://lore.kernel.org/all/20260629130616.642022-1-ruanjinjie@huawei.com/
- v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/
- v14: https://lore.kernel.org/all/20260320102620.1336796-1-ruanjinjie@huawei.com/
- v13: https://lore.kernel.org/all/20260317082020.737779-1-ruanjinjie@huawei.com/
- v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
- v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
- v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
- v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
- v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
- v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/



Jinjie Ruan (15):
  arm64: ptrace: Drop redundant pseudo-single-step for SYSEMU_SINGLESTEP
  arm64: ptrace: Rework audit_syscall_entry()
  arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
  arm64: ptrace: Rename and clean up syscall_trace_enter()
  arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
  arm64: syscall: Rework the syscall exit path in el0_svc_common()
  arm64: ptrace: Pass thread flags to trace enter/exit
  arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
  arm64: ptrace: Align syscall exit work semantics with generic entry
  arm64: syscall: Use exit-specific flags check in el0_svc_common()
  arm64: syscall: Simplify el0_svc_common() syscall exit path
  arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()
  selftests/arm64: Add ptrace SYSEMU/single-step tests

 arch/arm64/Kconfig                            |   2 +-
 arch/arm64/include/asm/entry-common.h         |  77 ++++++++++
 arch/arm64/include/asm/syscall.h              |   5 +-
 arch/arm64/include/asm/thread_info.h          |  16 +--
 arch/arm64/kernel/debug-monitors.c            |   8 ++
 arch/arm64/kernel/entry-common.c              |   2 +-
 arch/arm64/kernel/ptrace.c                    | 115 ---------------
 arch/arm64/kernel/signal.c                    |   2 +-
 arch/arm64/kernel/syscall.c                   |  34 ++---
 tools/testing/selftests/arm64/Makefile        |   2 +-
 tools/testing/selftests/arm64/ptrace/Makefile |   9 ++
 .../selftests/arm64/ptrace/ptrace_common.h    |  84 +++++++++++
 .../arm64/ptrace/single_step_signal_handler.c | 131 ++++++++++++++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 130 +++++++++++++++++
 .../ptrace/sysemu_singlestep_intercept.c      |  93 +++++++++++++
 .../ptrace/sysemu_singlestep_no_exit_stop.c   |  81 +++++++++++
 16 files changed, 631 insertions(+), 160 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c

-- 
2.34.1

