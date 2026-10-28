Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206587;
	b=Rv/xSyJbpi7PWjmbVyGVh6CEYSU9TP9BRtrCniV3T6zt66EO2XMUqLYugJI8dHKG81mw
	 4ucJwtoCpWSB9LwZqMGUpYbB862BEf4co6LuII8PGmdCzmn2ht3ir3gJeUb9zqfuBV9N0
	 oHrth6LgpQH32y+KrOG2c08Lm/okZiQDjqA+uW1E4J/iMkRMe7hvu2c/GYK0bSOrkQiAN
	 rmFCWKVRzvbz+skw5MQ4rA2c3/2TjwPkq9SHlynZshsc7fO7f5Szl+CWOqGh2LH3wHLt0
	 jMvca7LqKvxcC3N8aFqUYkiNLUsPJflS2kPRdaGzSDWCNWbputPf3ELz3GNFwQgD1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M5B9TDbfmanBmXj9WGkg/1GBsSFAT/OXKf+QOZEIqRU=;
	b=Nwz3kY/LBqvGP4vtwiiD6Ly9CXJkDsVzFzzwnuxdxhjS1+hrl4n03eAj59HgLFbbZZAt
	 4VD3cbwItQIgxXXWZ0x6CNzy4HNq5V00Opsl3/eR5++3K3QrFxglCU7dxAHTfjmQEc4Dq
	 sX8x4NJwHWmDomt/+TaKdTOL81z92X7xr3hetf/SdXIumL02bJiv2tl9/qLHliTGP58Do
	 rGDPSSdwKkin8fYYftdIsOj8+cZvsFlqt3Wfo3VmpII+cX/V8ccpQSs7B1cQyX/KKjQtH
	 3SJzr7Au3OPq/SLHKaMMuKti+tonhuJGcdReCmJaYFF/RlVnFX2lU7st0G7cgAHSYgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8ZT2jdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF17606A31D;
	Wed, 28 Oct 2026 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF17606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8ZT2jdT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAjg71517021;
	Wed, 28 Oct 2026 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M5B9TDbfmanBmXj9WGkg/1
	GBsSFAT/OXKf+QOZEIqRU=; b=U8ZT2jdT01SzJZ2APLT4oKPdQDCj7EhjsTtkhS
	X5SRjhDjdFzzEMIlcFndiyNfr6/c/vniSA4zYKfdY0AVv4ZY//kzTweiXJV5D13S
	AeetYI2E/muZ3TAk2p22mqtRufPCk1qcODkNOucHA2R9WLPoT/QwM1KKDeLHaSno
	zi35sdBfvjeZCXZlvH/22/9qaf8TeYlecxuGCM6TxUTazsyK1cZe7tQthCG7ywMP
	CJqlsBfT/Mvyd5FwyuSQHTwcHRRhYBUeEsrXXC9AhXlJO2fckZXeqU40JywaMi+r
	w66jcF8FmgIwo8MDHTUUuUsexIggQ7dVKUfF72pdJ0f/p/6w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwahbr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:37 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtYQF1881523;
	Wed, 28 Oct 2026 16:55:34 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtYlB1881494
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:34 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 244B523334; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>, Atish Patra <atish.patra@linux.dev>,
        Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
Date: Wed, 28 Oct 2026 22:25:22 +0530
Message-ID: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Kuvt8ORw7KMjX6H9N6KTkFcek8bDy2Cu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfXwONSzImYyp9y
 naYBLpKiqnCGnP0Z5WYxx8Y0nnShgik/U1HXF06M+eor+zQcRHou2+EYC4EADbxPQ+csVZZjVjD
 KRAeR3U1Q1gfcwe8egw7SWKLEU+fAi4=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2290a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=968KyxNXAAAA:8 a=h0uksLzaAAAA:8 a=HwFc7jivAAAA:8 a=NEAV23lmAAAA:8
 a=Mwg44Dw2nxROhg5v3AAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MSi_79tMYmZZG2gvAgS0:22 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-ORIG-GUID: Kuvt8ORw7KMjX6H9N6KTkFcek8bDy2Cu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX8UpZOsXS9O5i
 ksRBUiL+oBbLrBgwUeIHjYrPJVbUHKHjPWz+fVQosQJ+UbWZhutmb9teoeMmJYUPQWFYvZwvP1g
 Gb2xwlok38/34MrWVx6n0vSeqkpy9yFP858raMnMBzz1QnYg21PIt1t+pMhiLu1DH9oE1ci3XO1
 Ef6iYRlK0HX3UdJb8O8LenKgew0Xo05gJZzTZKEOvaurFntcRx3+xpbG65wzdHRMLPlnQKE4oHc
 QSAXPSanyMmH8rQ5RZ+ORnb/xRAm29rYMabPu6iNhflv5s+0q6igAUcSFGuqBknD3oft3hjLVx7
 jPuHG2VYQNJZML9FTSPNGsQEdJeYV7J0yeUQKm8x2tip1dTjUSdIaOG/zxWEfBBCsHfZP1azvMw
 OZdLrBNu3FNl6CSJ/lyr297z97WQ7TYskZivLBVeuaPRQ65pWE7hgpoDz0LWcdOAsJQyWwmeUQp
 OHHwhxqjPIFE5gnNmKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067

RISC-V does not architecturally define a supervisor-mode non-maskable
interrupt (NMI). An interrupt that arrives while Linux has cleared SIE stays
pending and is not observed until interrupts are enabled again. That is
correct for ordinary interrupt handling, but some kernel work needs an
NMI-like notification that can run even inside an interrupt-disabled region:
sampling a PMU overflow at the instruction that caused it, or taking a
high-priority RAS report promptly, cannot wait for the next unmask boundary.

The SBI Supervisor Software Events (SSE) extension [1] fills this gap. It lets
Linux register handlers for events that the SBI implementation can deliver
ahead of ordinary traps and interrupts, giving RISC-V the NMI-like supervisor
notification mechanism it otherwise lacks.

SSE can carry several event sources: high-priority RAS reports, double traps,
and PMU overflow, with room for further standard and platform events. This
series focuses on PMU overflow, its first user. Delivering overflows through
SSE lets perf sample the code that was actually running while interrupts were
disabled, rather than the later point where execution reached an
interrupt-unmask boundary.

This series implements the Linux side of that interface: the architecture
entry machinery, a firmware driver that exposes SSE events to in-kernel
clients, PMU overflow delivery, and regression tests. Per-hart local events
and system-wide global events share one client API.

SSE delivery model
==================

Linux first registers a handler and an event stack with the SBI
implementation, then enables the event. When an event source is signalled, the
M-mode SBI implementation preempts Linux even in an interrupt-disabled region:
it saves the interrupted supervisor state and constructs an S-mode context
that enters the registered handler. Linux can now run its own handler, for
example to take a perf sample or process a RAS report, then completes the
event with another SBI call, allowing the interrupted context to resume.

The typical hardware-triggered delivery flow is (software-injected events skip
the hardware trigger):

       <--------- Linux kernel ----------->  <-- Firmware --->  <- Hardware ->
     interrupted context  SSE handler             OpenSBI          Hardware
              |                 |                    |                 |
[1] setup     |                 |-register & enable-->                 |
              |                 |                    |                 |
[2] trigger   |                 |                    <----trigger------|
              |                 |                    |                 |
[3] save      |                 |            +--------------+          |
              |                 |            | context save |          |
              |                 |            +--------------+          |
              |                 |                    |                 |
[4] inject    |                 |        +-----------------------+     |
              |                 |        | handler context setup |     |
              |                 |        +-----------------------+     |
              |                 <---inject (mret) ---|                 |
              |                 |                    |                 |
[5] handle    |        +----------------+            |                 |
              |        | event handling |            |                 |
              |        +----------------+            |                 |
              |                 |                    |                 |
[6] complete  |                 |-----complete------->                 |
              |                 |                    |                 |
[7] restore   |                 |           +-----------------+        |
              |                 |           | context restore |        |
              |                 |           +-----------------+        |
              |                 |                    |                 |
[8] resume    <------------resume (mret) ------------|                 |
              |                 |                    |                 |

The context used to enter the handler exists only for this handoff; it is not
the task context that the event interrupted. The architecture entry code joins
the two sides: it moves execution onto the event's dedicated stack and shadow
call stack, establishes the current task, and presents the interrupted
registers to the callback as a normal pt_regs. Clients can therefore operate
on the original interrupted context without depending on the firmware entry
details.

Linux implementation
====================

An SSE handler runs in NMI-like context: it must not sleep, must not take a
page fault, and may interrupt code that holds arbitrary locks or is partway
through kernel entry. The implementation is shaped by those constraints.

Because it is NMI-like, an SSE can arrive at any point where interrupts are
disabled, including while Linux is midway through exception entry, a task
switch, or a KVM guest transition, where the normal kernel entry state is only
partially established. The SSE entry wrapper (the architecture assembly that
runs before the client callback) copes with this: it preserves Linux-owned
stvec, hstatus, and task stack metadata across the handler and any nested
exception, and its earliest instructions, which run before the event stack and
current task are set up, are kept outside kprobe instrumentation.

The callback receives the interrupted registers as a pt_regs and is allowed to
edit them. On RISC-V a6 and a7 carry SBI call arguments and results, so a
callback that wants to influence an in-flight SBI call the event interrupted
edits them there. The entry wrapper copies just a6 and a7 from that pt_regs
back into the context handed to the completion SBI call, so the edit takes
effect when the interrupted code resumes; the rest of the interrupted state is
restored by firmware and left untouched.

The firmware driver maps the SBI event state machine onto kernel resource
ownership. A callback, stack, and attribute buffer stay alive until firmware
has removed every registration that can refer to them. Failed partial
operations remain tracked for later cleanup, an aborted CPU-offline operation
restores the requested event state, and shutdown and kexec mask SSE before
Linux stops servicing handlers.

PMU overflow and perf
=====================

The RISC-V SBI PMU driver delivers overflows through ordinary interrupts by
default. When firmware implements SSE and the local PMU-overflow event, the
driver routes overflows through SSE instead. The choice is made once at setup
and is not switched at runtime; an operational failure disables sampling
rather than risking two active routes for the same overflow.

This changes where perf can observe an overflow, not how applications use
perf. A normal PMU interrupt raised while S-mode interrupts are masked is
handled only once they are enabled again, so the resulting sample often points
at the unmask boundary rather than at the code that consumed the cycles. SSE
can enter Linux at the original point and remove that source of sampling bias.
No new perf option or perf.data format is introduced.

The entry code supplies the interrupted pt_regs needed for register samples
and for kernel and user callchains. DWARF callchains additionally require a
copy of the interrupted user stack. Since an SSE handler cannot take a normal
page fault, this series takes a temporary reference to the resident user pages
with fast-only GUP, copies them through their kernel mappings, and truncates
the sample at the first page that is not immediately available. The existing
in-atomic copy remains unchanged outside SSE context.

The PMU integration retains perf's throttling and stopped-event semantics. It
restarts only runnable counters and orders the CPU power-management callbacks
so that counters cannot resume after a hart has failed to restore its SSE
delivery path.

Hardware results
================

We measured this on a RISC-V server platform. The same kernel source
and perf binary were used for both routes; one delivered PMU overflows through
ordinary interrupts and the other through SSE. The table shows the mean of
three runs of three million single-CPU "perf bench sched pipe" operations. The
"ops/s" columns are workload throughput (higher is better, so they show the
profiling overhead); the "samples/s" columns are the sampling rate perf
actually achieved against the requested -F frequency:

  rate       IRQ ops/s   SSE ops/s   delta   IRQ samples/s   SSE samples/s
  -F 99        337,707     339,555   +0.55%            98.0            98.6
  -F 999       338,352     338,289   -0.02%           995.7           998.0
  -F 5000      329,002     333,034   +1.23%          5001.7          5001.6

There were no lost samples. Across these normal frequency settings, both
delivery modes reached the requested sample rate and workload throughput
differed by no more than 1.23%.

The "perf bench sched pipe" workload also shows why the delivery mechanism
matters to the resulting profile. Ordinary PMU interrupts cannot enter an
interrupt-disabled kernel critical section. Overflows raised there remain
pending until interrupts are enabled again. Samples consequently accumulate
at the enable boundary rather than at the code that consumed the cycles. In
the IRQ profile, finish_task_switch() and _raw_spin_unlock_irqrestore()
therefore accounted for 54.99% of all samples.

SSE can enter Linux while S-mode interrupts are disabled. The PMU-SSE
profile therefore samples inside those critical sections and exposes the
scheduler, locking, address-space switching, and wake-up paths doing the
actual work. The leading entries from the two -F 999 reports show the
difference.

With ordinary PMU interrupt delivery:

  overhead   symbol
    36.63%   finish_task_switch.isra.0
    18.36%   _raw_spin_unlock_irqrestore
     7.66%   __internal_syscall_cancel
     7.55%   do_trap_ecall_u
     4.19%   mutex_lock
     3.64%   mutex_unlock
     3.06%   exit_to_user_mode_loop

With PMU-SSE delivery:

  overhead   symbol
     5.48%   __kprobes_text_end
     5.29%   __schedule
     5.10%   ret_from_exception
     4.71%   do_raw_spin_lock
     4.01%   do_trap_ecall_u
     3.99%   mutex_lock
     3.66%   switch_mm
     3.43%   mutex_unlock
     3.29%   exit_to_user_mode_loop
     3.28%   psi_group_change

The ordinary interrupt profile is dominated by two interrupt-enable
boundaries. With SSE, those two entries account for only 3.37%. The samples
are instead distributed across scheduler paths within the critical sections.

At perf's configured limit of 100,000 samples per second, both routes still
made progress without lost samples. In this deliberately saturated regime SSE
reduced workload throughput by 2.7% to 5.8%, which exposes the additional
firmware-entry cost and marks a practical upper boundary for sampling.
Thirty-second perf top runs at the same rate each processed about 3.1 million
samples with no loss, stalls, or kernel failures.

The DWARF callchain path gets dedicated coverage because it was the source of
the corruption this series fixes. On the same platform,
"perf record -a -g --call-graph dwarf,512 -F 999" layered on a concurrent
"hackbench -g25 -l600" -- the configuration that previously corrupted
spinlocks and mutexes under SSE -- now completes cleanly, with no lost
samples, lockups, RCU stalls, or faults, including a 431-iteration soak.
Patch 9 adds a regression test that drives the non-faulting user-stack copy
through the SSE handler with 32 concurrent samplers and checks perf's
truncation semantics.

Changes in v11
==============

Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
Also, tested PMU driver with both PMU irqs and PMU SSE events.

Changes in v10
==============

V10 turns the earlier feature series into a path suitable for sustained perf
use. In particular, it:

  - reconstructs and publishes the interrupted context for perf register
    samples and kernel and user callchains;
  - preserves current, task stack metadata, stvec, hstatus, and shadow-call
    stack state across synthetic entry and nested exceptions;
  - prevents fault-disabled accesses from entering the generic RISC-V page
    fault path and provides a non-faulting SSE user-stack copy;
  - makes event lifetime and rollback explicit across partial firmware
    operations, CPU hotplug, shutdown, crash, and kexec;
  - closes PMU throttle, counter restart, CPU power-management, and cleanup
    races without adding a runtime SSE-to-IRQ transition; and
  - expands the framework stress coverage and adds a regression test for
    high-frequency DWARF user-stack sampling.

Changes in v9:
  - Rebased the original series onto RISC-V for-next.
  - Preserved Linux-owned trap, virtualization, and supervisor state across
    the synthetic SSE handler.
  - Added framework stress modes and updated MAINTAINERS.

Previous versions:
  v9:
    https://lore.kernel.org/r/cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com
  v8:
    https://lore.kernel.org/r/20251105082639.342973-1-cleger@rivosinc.com

How to test
===========

Enable the SSE framework and SSE overflow delivery:

  CONFIG_RISCV_SBI_SSE=y
  CONFIG_RISCV_PMU_SBI=y
  CONFIG_RISCV_PMU_SBI_SSE=y

PMU-SSE also requires two OpenSBI fixes:

  f30a54f3b3a0 ("lib: sbi: pmu: Remove MIP clearing from pmu_sse_enable()")
    [2], included since OpenSBI v1.7,
    which keeps an overflow pending while its SSE event is temporarily
    disabled; and
  35511bc6ee1c ("lib: sbi: sse: clear SPV for non-virtualized events") [3],
    not yet included in a tagged release,
    which stops a stale HSTATUS.SPV from being applied to a non-virtualized
    event.

Build tools/testing/selftests/riscv, then run:

  for stress in 0 1 2; do
          ./run_sse_test.sh stress=$stress || break
  done
  ./sse_perf_ustack

Useful perf regression workloads include:

  perf record -e cycles -a -- sleep 1
  perf top
  perf record -g -F 999 -- hackbench
  perf record --call-graph dwarf,8192 -F 999 -- hackbench
  perf record -a -C 3 -e cycles -F 999 -- \
          taskset -c 3 perf bench sched pipe -l 3000000

Limitations and follow-up work
==============================

This series does not yet deliver SSE events into a guest or unwind a guest
stack; a later KVM-SSE series will let the host receive an event from firmware
and inject the corresponding event into the guest.

Hibernation and crash kernels are unsupported: the current SBI interface
cannot reconstruct firmware registrations after an image is restored, and a
crash kernel cannot take over the registrations left by the crashed kernel, so
it leaves SSE masked.

[1] https://docs.riscv.org/reference/sbi/ext-sse.html
[2] https://github.com/riscv-software-src/opensbi/commit/f30a54f3b3a091c225a00476f4039bf399badd1f
[3] https://github.com/riscv-software-src/opensbi/commit/35511bc6ee1c9c17b6a89b44c52e2044bb51b979

Acknowledgements
================

The original five feature patches were developed by Clément Léger and
Himanshu Chauhan. Thanks to Susheng Yang for reporting the perf callchain
failure and for providing a workload that made it reproducible.

Sorry for keeping you waiting. Since v9 I spent a good deal of time hardening
the lifecycle and error paths and reproducing and analysing the bugs that only
show up in the callchain path, until the series finally passed both functional
and sustained stress testing on hardware. I am confident in v10, but, echoing
Clément, SSE is a genuinely complex feature: it adds a new NMI-like entry path
into the kernel to stand in for a hardware NMI. I would therefore welcome wider
community testing and feedback, especially under high-frequency delivery and
more complex handlers.

Clément Léger (5):
  riscv: add SBI SSE extension definitions
  riscv: add support for SBI Supervisor Software Events extension
  drivers: firmware: add riscv SSE support
  perf: RISC-V: add support for SSE event
  selftests/riscv: add SSE test module

Zhanpeng Zhang (4):
  riscv: sse: mask events during shutdown and kexec
  riscv: mm: avoid enabling interrupts for nofault page faults
  perf: RISC-V: support callchains with SSE delivery
  selftests/riscv: add perf user-stack SSE copy regression test

 Documentation/arch/riscv/index.rst            |    1 +
 Documentation/arch/riscv/pmu-sse.rst          |   55 +
 MAINTAINERS                                   |   22 +
 arch/riscv/include/asm/asm.h                  |   14 +-
 arch/riscv/include/asm/perf_event.h           |   10 +
 arch/riscv/include/asm/sbi.h                  |   63 +
 arch/riscv/include/asm/scs.h                  |    7 +
 arch/riscv/include/asm/sse.h                  |   82 ++
 arch/riscv/include/asm/thread_info.h          |    1 +
 arch/riscv/kernel/Makefile                    |    1 +
 arch/riscv/kernel/asm-offsets.c               |   14 +
 arch/riscv/kernel/entry.S                     |   14 +
 arch/riscv/kernel/machine_kexec.c             |   11 +
 arch/riscv/kernel/perf_callchain.c            |  142 ++
 arch/riscv/kernel/reset.c                     |   18 +
 arch/riscv/kernel/sbi_sse.c                   |  246 ++++
 arch/riscv/kernel/sbi_sse_entry.S             |  226 +++
 arch/riscv/kernel/smp.c                       |   17 +
 arch/riscv/mm/fault.c                         |   11 +-
 drivers/firmware/Kconfig                      |    1 +
 drivers/firmware/Makefile                     |    1 +
 drivers/firmware/riscv/Kconfig                |   18 +
 drivers/firmware/riscv/Makefile               |    3 +
 drivers/firmware/riscv/riscv_sbi_sse.c        | 1223 +++++++++++++++++
 drivers/perf/Kconfig                          |   11 +
 drivers/perf/riscv_pmu.c                      |   14 +-
 drivers/perf/riscv_pmu_sbi.c                  |  536 ++++++--
 include/linux/cpuhotplug.h                    |    1 +
 include/linux/perf/riscv_pmu.h                |   20 +-
 include/linux/riscv_sbi_sse.h                 |   95 ++
 tools/testing/selftests/riscv/Makefile        |    2 +-
 tools/testing/selftests/riscv/sse/Makefile    |   10 +
 .../selftests/riscv/sse/module/Makefile       |   22 +
 .../riscv/sse/module/riscv_sse_test.c         | 1154 ++++++++++++++++
 .../selftests/riscv/sse/run_sse_test.sh       |   59 +
 .../selftests/riscv/sse/sse_perf_ustack.c     |  564 ++++++++
 36 files changed, 4592 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/arch/riscv/pmu-sse.rst
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sbi_sse.c
 create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c
 create mode 100644 include/linux/riscv_sbi_sse.h
 create mode 100644 tools/testing/selftests/riscv/sse/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
 create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh
 create mode 100644 tools/testing/selftests/riscv/sse/sse_perf_ustack.c

-- 
2.43.0

