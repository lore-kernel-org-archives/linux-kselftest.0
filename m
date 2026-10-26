Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004744;
	b=5JqzXoqbF0qugyCFOBGNJ7RHpXv6ZjL3p2VPUeOIrjmaqV+MZ3xSKHm/PZC5pyen5+uX
	 fiDUWaDRyxUJ+oc8om1g32xPmspvnvJw4DsIMEPNNt/AbEP9dS+5ahmNbpZGf2g4pkzd3
	 IAEv7KXbNzkqfL4fiWH7GwUlkNJyUvpiviQ9ndz4DrsOs1FbBxrugWHs2LCX4IXSrm1IG
	 F2cs3NpAVW4HofW1P1DStgDDq6hQpRde45de23z3W59PtZDB7R+BPWcTvEZtLU/U9j84X
	 iTepOMItiu+kwlwUNsmv9s4iR/RlpS+T84CE4cYt5TO+72la/BD598i+z4WXsaHz33w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004744;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=xelDIWCq6o8kmC+FCPg90bobohtYm5tcKa8G8a0jIQ4=;
	b=sf9kbw7t6lnRE+/e29Q3LVhuG1y8wL/EsB9ALKKvQ2UFSkKm+tiIeynX7+4BQ+Tq2gAP
	 zfCqdtQuyKYgAxXUF9khrFkT556dx01ejH4qThdQbUytYYAiNfChlhNWJgQOk8AVYYjpq
	 vl5gLo4oF30gwMwfz3/MC3Tcl8os7r/fm5P6HmBKygVGT0ZULOkK8pGYt//X+K8FvFms/
	 OPJ7Q45AuIWayEgNOk8blfPW1L+0w+2QLaru/wiOIc7Bbf9Ko5kqIcWsVe0D0qytqAe2D
	 SDy+nGWKvJNvS9aemNGo+tM3WztXqh/cShkccHdVbMtlYrEGbIB4Ty7v1KW1QSyv6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Su7NXPDB;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0698606A320;
	Mon, 26 Oct 2026 08:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0698606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Su7NXPDB
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xelDIWCq6o8kmC+FCPg90bobohtYm5tcKa8G8a0jIQ4=;
	b=Su7NXPDB9RNH+c3Xzmu6p5J8+RP1/lBmbkPZMyD5dGyoXsIDcNNRWbbt8brCkBjrInOB6ZI4H
	PVedpc5Pyz9Tz0LeBu+R397efS7tLlo0B9sTpqd9G24Im6tbIABcqeukF9KRHxaMkkDA/u7WR27
	XVK8ucTl912vLWM0NWoMICU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jCnSC70Ybz1K96Y;
	Mon, 26 Oct 2026 16:52:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1869D4058A;
	Mon, 26 Oct 2026 16:52:19 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 16:52:18 +0800
Message-ID: <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
Date: Mon, 26 Oct 2026 16:52:17 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/30 18:17, Jinjie Ruan 写道:
> This series converts arm64 to the generic entry infrastructure.
> 
> Currently, architectures such as x86, RISC-V, LoongArch, PowerPC
> and s390 use generic entry, which significantly reduces maintenance
> burden and improves code elegance.  arm64 already adopted generic IRQ
> entry in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
> making it the right time to complete the conversion.
> 
> This work brings arm64 in line with other major architectures,
> reducing duplicated code and enabling future improvements like
> Syscall User Dispatch and rseq time slice extension optimizations.
> 
> The series is rebased on v7.3-rc4 and has been tested with stress-ng,
> hackbench, kselftests (ptrace, breakpoints, arm64/abi, arm64/fp, vDSO),
> ptrace stress test, Pseudo-NMI load test, and the rr test suite [1].

Hi Mark and all,

Ping.

Are there any further review comments or new suggestions for changes?
I’m happy to address anything that comes up.

Thanks!
Jinjie

> 
> A new kselftest ("selftests/arm64: Add ptrace SYSEMU/single-step tests")
> is included at the end of the series, covering the syscall-exit
> pseudo-step and single-step behaviour touched by this work.
> 
> Observable (non-ABI) changes worth calling out:
> 
> - The traceable functions on the syscall path change: syscall_trace_enter,
>   syscall_trace_exit and el0_svc_common.constprop.0 are replaced by
>   trace_syscall_enter, trace_syscall_exit and syscall_enter_audit, the
>   same names x86, RISC-V, LoongArch and s390 already expose.
> 
> - CONFIG_DEBUG_RSEQ becomes unselectable on arm64 once GENERIC_ENTRY is
>   set (rseq_syscall() becomes a no-op stub), so the earlier rseq_syscall()
>   reordering is only temporary and the equivalent is handled by
>   __rseq_debug_syscall_return().
> 
> On gVisor with systrap mode, the Syscall User Dispatch (SUD) feature
> yields a slightly lower performance gain on arm64 (3% ~ 5%), similar to
> that on x86 [2].
> 
> Result: the average over 1M getpid calls, ns/op
> 
> 	| KVM VM Configuration | SUD    | no-SUD | Savings % |
> 	| -------------------  | -----  | -------| --------- |
> 	| 2 vCPU, pinned       | 4269.8 | 4509.5 | 5.3%      |
> 	| 4 vCPU, pinned       | 4175.4 | 4369.1 | 4.4%      |
> 	| 8 vCPU, pinned       | 4352.6 | 4485.4 | 3.0%      |
> 
> Note that this series does not yet enable SUD or the rseq time slice
> extension on arm64: SUD additionally needs
> ARCH_SUPPORTS_SYSCALL_USER_DISPATCH [3] and the rseq slice extension needs
> HAVE_GENERIC_TIF_BITS [4], neither of which arm64 selects today.  The
> numbers above are the motivation for enabling them in a follow-up.
> 
> Testing follow-up that still requires real hardware:
> 
> - MTE: run the MTE selftests on real hardware; part of them do not run
>   under QEMU.
> 
> [1]: https://github.com/rr-debugger/rr/wiki/Building-And-Installing#tests
> [2]: https://github.com/google/gvisor/commit/a45d6227b521012109cde9a942d644d778eb773b
> [3]: https://lore.kernel.org/all/20260721081858.1169276-16-ruanjinjie@huawei.com/
> [4]: https://lore.kernel.org/all/20260320104222.1381274-1-ruanjinjie@huawei.com/
> 
> Changes in v20:
> - Add a kselftest covering the syscall-exit pseudo-step
>   and single-step behaviour.
> - Reword the first patch: it skips the pseudo-step for the emulated
>   syscall rather than "fixing a redundant exit stop", and drop the
>   Fixes: tag and Reviewed-by.
> - Add Tested-by.
> - Cover letter: document the observable changes and the testing
>   follow-ups.
> - Link to v19: https://lore.kernel.org/all/20260922035510.1090299-1-ruanjinjie@huawei.com/
> 
> Changes in v19:
> - Rebased on v7.3-rc4.
> - Fix build problem as Karl pointed out.
> - Remove has_syscall_work() later to make it more clear.
> - Add gvisor test data.
> - Link to v18: https://lore.kernel.org/all/20260902095537.602517-2-ruanjinjie@huawei.com/
> 
> Changes in v18:
> - Rebased on v7.3-rc1.
> - Drop the SUD patch as Mark suggeted.
> - Update the commit message.
> - Add Reviewed-by.
> - Link to v17: https://lore.kernel.org/all/20260721081858.1169276-1-ruanjinjie@huawei.com/
> 
> For changes in v7 to v16, please refer to the individual patch threads:
> - v16: https://lore.kernel.org/all/20260629130616.642022-1-ruanjinjie@huawei.com/
> - v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/
> - v14: https://lore.kernel.org/all/20260320102620.1336796-1-ruanjinjie@huawei.com/
> - v13: https://lore.kernel.org/all/20260317082020.737779-1-ruanjinjie@huawei.com/
> - v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
> - v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
> - v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
> - v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
> - v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
> - v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/
> 
> 
> 
> Jinjie Ruan (15):
>   arm64: ptrace: Drop redundant pseudo-single-step for SYSEMU_SINGLESTEP
>   arm64: ptrace: Rework audit_syscall_entry()
>   arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
>   arm64: ptrace: Rename and clean up syscall_trace_enter()
>   arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
>   arm64: syscall: Rework the syscall exit path in el0_svc_common()
>   arm64: ptrace: Pass thread flags to trace enter/exit
>   arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
>   arm64: ptrace: Align syscall exit work semantics with generic entry
>   arm64: syscall: Use exit-specific flags check in el0_svc_common()
>   arm64: syscall: Simplify el0_svc_common() syscall exit path
>   arm64: ptrace: Make return type of arm64_syscall_trace_enter() bool
>   arm64: entry: Convert to generic entry
>   arm64: Inline el0_svc_common()
>   selftests/arm64: Add ptrace SYSEMU/single-step tests
> 
>  arch/arm64/Kconfig                            |   2 +-
>  arch/arm64/include/asm/entry-common.h         |  77 ++++++++++
>  arch/arm64/include/asm/syscall.h              |   5 +-
>  arch/arm64/include/asm/thread_info.h          |  16 +--
>  arch/arm64/kernel/debug-monitors.c            |   8 ++
>  arch/arm64/kernel/entry-common.c              |   2 +-
>  arch/arm64/kernel/ptrace.c                    | 115 ---------------
>  arch/arm64/kernel/signal.c                    |   2 +-
>  arch/arm64/kernel/syscall.c                   |  34 ++---
>  tools/testing/selftests/arm64/Makefile        |   2 +-
>  tools/testing/selftests/arm64/ptrace/Makefile |   9 ++
>  .../selftests/arm64/ptrace/ptrace_common.h    |  84 +++++++++++
>  .../arm64/ptrace/single_step_signal_handler.c | 131 ++++++++++++++++++
>  .../arm64/ptrace/single_step_syscall_stop.c   | 130 +++++++++++++++++
>  .../ptrace/sysemu_singlestep_intercept.c      |  93 +++++++++++++
>  .../ptrace/sysemu_singlestep_no_exit_stop.c   |  81 +++++++++++
>  16 files changed, 631 insertions(+), 160 deletions(-)
>  create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
>  create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
>  create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
>  create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
>  create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c
>  create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c
> 
