Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8858415F27
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789202316; cv=none; b=evHpV+W96u1eRqB+WodAGJN2A4cmMeQvVHA5vLe+kk1JAnMcZrT7NLgCusJN/Gxk8wQuLMmY3wDQR0Z3cu6POebMkZw12sKGOTtn3tJvvvLuY3Wh4002cq9Bib8wtzmx3YwA2wymHctNUdvEyfKa1bSU0nnj3c70YyENNoCjfgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789202316; c=relaxed/simple;
	bh=QDRPpffBWlqWvEnYkpgU3E4/RkxoOPQlasWvRfBNAdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GYufokEjefu+M80p2Vh3SzyUlWKV2nC6gprs1yuTZwBtomaSSIekOHvOxyljImBNJYVPeYS+xAAPdgYf2uNzh/3EmTY/PEH3+sK0EdOX2TZrjKecYX298sYCmd/SBWNUvMIfk504psJaWfJ5+AHmnsZ4ThNq7192f3NaNb00LqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb24zp+g; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb24zp+g"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dcff8f44f2so25205125ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789202313; x=1789807113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XogxzeT0FhVxUWDaqJADmEw/kG18oYoEZnOYFW8bRIg=;
        b=Nb24zp+g9twpTHWr6G+orC4+GzKnRkAgZKe1/GGXll5kaMw99vxCzp+wZSdfwOkl9j
         gequ+hazMng/Zzn7RHOjA8rmSJ/ntMRsjtIzpI67/izi5YQjImirLmWTcIuVu0++4/Oe
         ykxz54JFWSzb9WmY5jEBHi3IMHRckaR8VwmAKuRAyQMM4i5beTO5TkhHLcmTqfq8sa7A
         jJzV+B/SrkS8B5SadWcrF8tgQp3mJtWHSDUPKi4+1ELMmjAOVtRcj4R/ECbVYcudDGHI
         NMyPKD5PFKPakVe1f79K9IIDZGDnF3JaJDFj/z7Iz81RezraCF3tJxeWp+XBxhh3TBOA
         lajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789202313; x=1789807113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XogxzeT0FhVxUWDaqJADmEw/kG18oYoEZnOYFW8bRIg=;
        b=XQ75dj7GJtDRGPcE2Mwlx99H84Sh/VqD+WDJUQeZ9TZkVYlIljQ4DtAbNWV0CoK8y7
         CtXuuP+BxL1JYd/BiRsmNFbSTbuhwW+/7QavjT7UzauvUOlP09fAdwyle8K4NhWPJOiL
         rYDrGPtUep+N2jfcqLCh380mBx3PoRHEUOPJhcFyA/Xa2mmzyU2Hw4CEnGx7dpu2wbJl
         IjTG+9TLg2NP2VDx35M6k26zaqv4uc11Kg1E7mbgB8viRWmCTpSd1jwVDCNE7DrrlAIw
         l5jAoPKcGP/khAHoU/5WLItkjXNL0WpWYno94szwUn6aGmss1jFG4CF/lcITmXi9tK12
         BDDg==
X-Forwarded-Encrypted: i=1; AKwUvBxSyierprRwMJw/Rvc8VZr9UInnAM5Gpj+NzvA4YDqe/NOob71Fuw6217VAG9CgLLEx4VUKnrSjnjKug3+rCuo=@vger.kernel.org
X-Gm-Message-State: AFuF++lvjmDhjUchbqXdQGl1jeFJNNZkac1kcREgPpx5fqBGy4JEk0Ib
	n66y3o139bgTwh6kaLn3UKbbVIJKb2GqBqPUtVtOrCA2vidZq+wDm0Lf
X-Gm-Gg: AYBFou2B70s8MUOGKUkY33qUNC8MPtKI+gTJAPIQSft3cM2U18FUdjy2dBz1qIKIIbn
	lSk92K1tCBGuganvikQFmbUvceDhZag6HuQacY3iiaSexbG7I4Qf6Sv/tn7h6va6TMFF8fgzEUZ
	YyV4WhxRJIdfeuB1zG14yCRC8YDsEvEUlPbroOpjQ9xRpoJfudNywy96JRt0zBz1J8gYHyJsPMk
	nYbhV3mg0QCugb/1ct8ye54/FZciVTpkJon2nTdc+jJNwHUKX9IvtyY9wn0m5N7QkV0MThYxU0e
	o+PSWLcFnsMBJq162yHGcjbwlvuhGbpEse1f1aJPjsEczHEJaxilKNIzdTeqOaTcOJ+w0h7anJa
	JY1ZwIjxD4i73OLgNPiKXx0nSlS2U3RkjKXyQ/mGJyJjQRH5Ucdvy5sKWVqNSri5F3pTIlxfsyz
	lzA3AfczNyeaD+G4ZGh015Dwnd9cPaoyiovvjkv5RfWPbBaS5hfff8J3e8fBTWKe2+WPfKkaaRB
	yt5Cu7qYS1iw2dgiT9dQ/gATQ61c5mY13ugFBOG
X-Received: by 2002:a17:90b:35d2:b0:39d:8d38:8b04 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr14269202a91.1.1789202312836;
        Sat, 12 Sep 2026 01:38:32 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:16a3:d08b:6ddb:dec6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm9790583a91.3.2026.09.12.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:38:31 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	lkp@intel.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: [RFC PATCH v7 00/10] trace: stack trace deduplication for ftrace ring buffer
Date: Sat, 12 Sep 2026 16:37:43 +0800
Message-Id: <20260912083753.3426176-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

Hi Steven, Masami, all,

This is v7 of the ftrace stackmap series, sent as a new thread.

Previous version:
  https://lore.kernel.org/linux-trace-kernel/20260903132409.270195-1-lipengfei28@xiaomi.com/

The series adds stack trace deduplication to ftrace. When the
'stackmap' option is enabled alongside 'stacktrace', the ring buffer
stores a 4-byte stack_id instead of a full kernel stack trace. Stack
records are kept in a separate map and exported through tracefs.

The series is based on v7.2-rc4-102-g4539944e5151.

Motivation
==========

The target use case is long-duration, from-boot kernel tracing where
the same stacks recur enormously often and the bottleneck is ring
buffer space, not CPU.

For example, tracing slab allocation from boot for hours can help find
the allocation backtraces behind a later memory-usage peak. Today each
event carries a full kernel stack, usually 80-160 bytes. With a fixed
ring buffer, early history is overwritten quickly even though most
stacks repeat.

On the same slab workload and fixed per-CPU buffer, stackmap retained
2.17 times as many events and covered 1.85 times the time span:

                  retained events   bytes/event   time span
  stackmap OFF        645,068          ~104 B        15.0 s
  stackmap ON       1,397,741           ~48 B        27.7 s
                     2.17x             2.17x          1.85x

Both runs used the same kernel configuration, workload, per-CPU
ring-buffer size and tracing filters; only options/stackmap differed.
Retained events and time span were taken from the ring buffer contents
after the buffer had wrapped. These are workload-specific measurements,
not guaranteed ratios: the gain tracks how repetitive the stacks are.

Two questions for maintainers
=============================

These are deliberate security and ABI design choices rather than
unresolved implementation bugs, and I would rather have them settled
before this grows a userspace dependency.

1. stack_map_bin deliberately exports raw kernel instruction pointers,
   adjusted by trace_adjust_address() and not sanitized by
   kptr_restrict. It is mode 0440, and open() rejects access under
   LOCKDOWN_TRACEFS. This mirrors the trust boundary already used by
   trace_pipe_raw and available_filter_functions_addrs. Please confirm
   that boundary is the one you want here, or say which of stricter
   permissions, a capability check, or address sanitization you prefer.

2. A stack_id is only meaningful within one map generation. Reset
   clears the map without touching the ring buffer, so an id recorded
   earlier can become unresolved or resolve to a reused slot. The
   32-bit id carries no generation tag, so a consumer cannot detect
   this. Within a single generation no additional kernel ABI is needed:
   the TRACE_STACK_ID records plus the stack_map_bin export already carry
   enough to reconstruct the mapping, though trace-cmd/libtraceevent
   still need userspace support to decode TRACE_STACK_ID and join it with
   the export. Merging trace data across a reset would additionally
   require a generation-tagged event or map history. I have documented
   the single-generation rule rather than growing the ABI now; tell me if
   you would rather have the generation in the ABI from the start.

Changes since v6
================

Masami, this version addresses your review by splitting the previous
three patches into ten focused patches and by changing the interfaces
as follows:

  - Serialize the complete stack_map_stat sample with reset through
    reader_sem.
  - Replace the per-open binary payload snapshot with seq_file and
    seq_write(). The per-open allocation is now a bitmap of at most
    64 KiB at bits=18 rather than a roughly 130 MiB payload.
  - Make stackmap_dump.py accept stdin, parse incrementally, and add
    its own test target.
  - Separate core, recording-path integration, statistics, binary
    export, boot sizing, documentation, parser, and three selftests.

Additional changes made while validating the split:

  - Return -ESTALE, not -EAGAIN, when reset invalidates a binary
    iterator. seq_file reserves -EAGAIN for internal traversal retries.
  - Fix binary record membership at open with a bitmap, so the header
    count exactly matches the records emitted.
  - Use a reader_sem-protected u64 generation and define normal EOF for
    an old export that was completely buffered before reset.
  - Saturate cross-CPU statistic sums and calculate the integer success
    rate correctly across the full u64 range.
  - Use per-CPU atomic_long_t success/drop counters so the NMI-capable
    hot path uses native-long atomic operations without cross-CPU
    cacheline contention. FTRACE_STACKMAP depends on
    ARCH_HAVE_NMI_SAFE_CMPXCHG for that guarantee.
  - Enter an explicit notrace RCU-sched read-side section in get_id()
    before testing the reset flag, and drain both classes of admitted
    readers with synchronize_rcu_tasks_rude() followed by
    synchronize_rcu(). ftrace_stackmap_reset() now spells out why no
    admitted reader can observe a stale flag and still run during the
    memsets: such a reader would have to both end before and end after
    the same grace period returns.
  - Apply one open-time policy to all three tracefs files. stack_map,
    stack_map_stat and stack_map_bin each call
    tracing_check_open_get_tr(), so LOCKDOWN_TRACEFS and
    tracing_disabled are enforced when the file is opened rather than
    only when tracefs was populated, and each file pins the owning
    trace array until release.
  - Scope explicit-stack deduplication to the selected trace_array;
    stackmap remains available only on the global trace array.
  - Stream parser output with bounded top-N and JSON spooling; limit
    addr2line work to 64 batches and 8192 addresses, sanitize terminal
    control characters, and validate depths and framing strictly.
  - Assert only deterministic properties in the selftests. An active
    reset is required to be accepted; no counter sampled while a writer
    runs is compared, because such a sample is a moving target. The map
    is proven empty by a reset taken once the owned writer is stopped
    and tracing is off, and an active reset is proven to start a new
    generation by holding a binary fd across it and requiring ESTALE.
  - Keep an owned writer alive across the reset/binary test, retry a
    failed tracing disable as best effort, and use random UUIDs in
    instance names to avoid PID-namespace collisions.
  - Reject truncated or malformed zero-exit addr2line output while
    preserving normal unresolved-address fallback.
  - Finalize stackmap initialization as failed if the top-level tracefs
    directory cannot be initialized, rather than leaving it pending.
  - Document ftrace_stackmap.bits= in the canonical kernel parameter
    reference and Kconfig, including its default, range, and upper-bound
    memory cost, and state that allocation happens when the global map
    is published rather than on first use.

Binary ABI and reset semantics
==============================

stack_map_bin is native-endian ABI version 1. Userspace detects byte
order from the magic value.

open() records the populated stack records in a bitmap and puts the
exact count in nr_stacks. Iteration emits exactly that record set. The
bitmap fixes membership, not payload values, so ref_count may change
before a selected record is written.

Reset clears the map only. It does not clear the ring buffer and is
allowed while tracing is active. Consequently, a stack_id already in
the ring buffer can become unresolved or can resolve to an unrelated
stack after slot reuse. Userspace must consume the trace before reset
when old ids need to remain meaningful.

seq_file can return bytes buffered by the current pass before noticing
reset. The generation is checked at the next seq pass; a stale iterator
then returns -ESTALE and must be reopened. If the complete old export
was already produced, subsequent reads return normal EOF instead. In
either case no record from the new generation is ever appended to that
fd's stream.

Test results
============

Final v7 candidate d0c09774629e, QEMU aarch64 virt:

  - For each of the ten commits, kernel/trace built cleanly with
    ARCH=arm64 and CONFIG_FTRACE_STACKMAP=y, with no compiler warnings
  - checkpatch.pl --strict: no blocking findings
  - tools/tracing parser unit tests (make -C tools/tracing check):
    40/40 PASS
  - stackmap_bin_test host selftest: PASS
  - Host and static arm64 helper builds with -Werror: PASS
  - Full arm64 Image build: PASS
  - ftracetest: stackmap-basic, stackmap-reset and
    stackmap-instance-gate PASS, no alerts

The parser was also checked against real kernel output rather than
synthetic data only: a guest running this tree produced a stack_map_bin
export with nr_stacks=3, and stackmap_dump.py parsed that byte stream
identically from a file and from stdin, and produced valid JSON with
matching record count, depths and ref counts.

The runtime tests cover active reset under an owned PID-filtered writer,
record reuse and post-reset resolution, map-only reset plus the binary
ABI, open-time membership refill, and top-level instance gating. No
KASAN matrix result is claimed for this tree; the reset synchronization
and the tracefs open paths changed after the last such run.

Known limitations
=================

  - Per-instance stackmaps are not included. The option is restricted
    to the global trace instance.
  - Allocation is eager when the global stackmap is published: about
    8 MiB at the default bits=14 and about 130 MiB at bits=18. This is
    deliberate, so that the hot path never allocates once tracefs
    initialization has completed, but the cost is resident even while
    options/stackmap stays off.
  - Deduplication is best-effort. Concurrent insertion can create
    duplicate records and split ref_count; memory remains bounded.
  - Reset can make ids already in the trace unresolved or misleading.
  - The binary ABI is native-endian and currently version 1.
  - Only kernel stacks are covered.
  - trace-cmd/libtraceevent integration is left for follow-up.

Usage
=====

  echo 1 > /sys/kernel/debug/tracing/options/stackmap
  echo 1 > /sys/kernel/debug/tracing/options/stacktrace

Pengfei Li (10):
  trace: add lock-free stackmap for stack trace deduplication
  trace: use the stackmap from the ftrace stack recording path
  trace: add stackmap statistics interface
  trace: add stackmap binary export
  trace: make the stackmap capacity settable on the kernel command line
  Documentation: tracing: document the ftrace stackmap
  tools/tracing: add a parser for the stackmap binary export
  selftests/ftrace: add a stackmap basic functionality test
  selftests/ftrace: add a stackmap reset and binary ABI test
  selftests/ftrace: add a stackmap instance gating test

 .../admin-guide/kernel-parameters.txt         |    7 +
 Documentation/trace/ftrace-stackmap.rst       |  241 ++++
 Documentation/trace/index.rst                 |    1 +
 kernel/trace/Kconfig                          |   36 +
 kernel/trace/Makefile                         |    1 +
 kernel/trace/trace.c                          |  234 +++-
 kernel/trace/trace.h                          |   16 +
 kernel/trace/trace_entries.h                  |   15 +
 kernel/trace/trace_functions_graph.c          |    1 +
 kernel/trace/trace_output.c                   |   23 +
 kernel/trace/trace_selftest.c                 |    1 +
 kernel/trace/trace_stackmap.c                 | 1176 +++++++++++++++++
 kernel/trace/trace_stackmap.h                 |   55 +
 tools/testing/selftests/ftrace/.gitignore     |    1 +
 tools/testing/selftests/ftrace/Makefile       |    2 +-
 .../selftests/ftrace/stackmap_bin_test.c      |  383 ++++++
 .../ftrace/test.d/ftrace/stackmap-basic.tc    |  242 ++++
 .../test.d/ftrace/stackmap-instance-gate.tc   |  114 ++
 .../ftrace/test.d/ftrace/stackmap-reset.tc    |  174 +++
 tools/tracing/Makefile                        |   17 +-
 tools/tracing/stackmap_dump.py                |  354 +++++
 tools/tracing/tests/test_stackmap_dump.py     |  498 +++++++
 22 files changed, 3585 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/trace/ftrace-stackmap.rst
 create mode 100644 kernel/trace/trace_stackmap.c
 create mode 100644 kernel/trace/trace_stackmap.h
 create mode 100644 tools/testing/selftests/ftrace/stackmap_bin_test.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/stackmap-instance-gate.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/stackmap-reset.tc
 create mode 100755 tools/tracing/stackmap_dump.py
 create mode 100644 tools/tracing/tests/test_stackmap_dump.py


base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
-- 
2.34.1

