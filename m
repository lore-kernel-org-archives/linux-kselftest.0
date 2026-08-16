Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D783B0AF8
	for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786890160; cv=none; b=TIm5zBUm6caiY0pQBfG73tMD1s8JtwcydbAikm1P/Vx/74Yos9PSFFlN3orSqnpf3g0XHjqvgLtnfCJ266MKYK9bMp5lX4XU3J1gJyt0q2bU4AhedWCe7Qw5FpT+Xc7HvIIphekK8Z75zrPe4qqB5+DARXgsp1qCo2tCxBTv9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786890160; c=relaxed/simple;
	bh=4X804/qrz0myQkryLvzzCj1bLMSszCuQ0/f+xd3bVww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2F36vLGcUTa5dQVfrkZHz/AmUV1sfJv2bTsHARsFzbzu2nrgqWa812cX8iGNC0lXZuPjFnia3w/HFYUdGW2tfPIgxDPFFkDfsCXmz7EJLxUJaozmyL3iQg5YqD6mDW/JVv2QYbXOOwK8hQebihtwiEvggNg8ZgKrNltqjxLtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj1lW7LI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj1lW7LI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso27727905ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890158; x=1787494958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsGCXFozT69ITA4eF1crVo3PlInrHxlGF6a27uOAn/o=;
        b=hj1lW7LI26I64h6ti9xd1KxaqgRuJ3V+8p6z9KvdfsfU1PbBwS0dDtBg+6++O9uj6V
         2hOqU06ByT/97M62gIQ83klCbfcIXibVN18qMBE78sQqkyznoHhdSiuhwFoegOhOJ8TS
         ZoncY1jDJ5e8ck/RVFC9k4C9jB962K2KkKjVq3VXzhBFDDsPphB+1JTi3gDcrdajLKj8
         cslMfo4f2e4z6WwxL6JIJFMRMP3mGTa6xWyAbW2JHAy+bx4N2jAau2seo7wNbvSePJEk
         hUQA42qs6iVtYGHiL3DqvKPWOAYis/PfGzc1pDFaLgx4IIYJX3zjk6RVmiMkNsOv15gZ
         M1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890158; x=1787494958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsGCXFozT69ITA4eF1crVo3PlInrHxlGF6a27uOAn/o=;
        b=qtwm0d0iGSFMt4bvq8X2CQ14yVD9oVdBfjUfhtuO1fKgjcbq0cragoE1bvp1LbjXXY
         bGKJpoOHQrb6I8WysMnGALvZv2/x1SAzF2hkbWOStu1pZqVkcAQY+g379alKhrQeu+oU
         Jkx977vnRCgsMzuRbzwtkucILfu88RcoP0VTeSPHWxzaKMtPuJ6NCDUTKt9uIj/Gqawm
         fZR+8t6Dv+dFWOhPEp/jF+UG4rldSqWoQ38gN9HSrSqaogOJWARpHDUwVw8jfwV1j5uR
         qfML8zbLef5nXUNT4tkT537qKXJkUXWDqjAuTzp1szC1jORtnYY3juK90sdlWulLZAXh
         H0AQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIB6s07NLZfiALKyQRL8TvM7VMf8uT4HtXyJqahO2aEHiRp/lgdXI/vfOkTwx79AyJmbMwCk8BompRqiQcgWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHF0+WXJ+6sYLHaqiq0BRyRiqats6DoZHNkTBf+RJ9aHp7R0Dy
	GQ+Xlti4qD5rUm+Sn26/773SxuH6sRbZITB4OyTlhev4W1E0dxsRWr5x
X-Gm-Gg: AR+sD11g+sV2Gz4fvbLg420YvQsQ1sYDkRiHj8ivjNpMHxI0h682C+CN7CEQKJyGBrq
	pxV4drm+i+oWchPoAiyJcgxHUfaY4pZg7CQ7JKNni8gddkl9Vq+CEgHkmab4PxiF/LQ20J+6+Sw
	DvN+WhByMFVgQo+m35CDZDiknbjUihS5vE8T1HhVW38jIDSvsuHk6uMxyCiay2uBOqsO/8hJUYK
	+eIRA0XFUBt/NxpFogjzxDpfjak5Xy5dUo0MfFlGWFu5XMOc3kmEzmxotRQyNcyJCs7ndtDLpBV
	NujtJvN7TgyfcjmIV3FaeDRG/ekgFS2EtHOvXz0mVzVq9CFOg0XFpFM2ZvYV8+kIM7Ti6cKOQ7h
	uZZ9+oE/D2DyoxNG2MiYADO7ykD1PaBpTdBgEMPR2G239WBp6fVXS5qAck8edQwvTUjP3eDuIQA
	SV+bqTSOLP/xRxEgm1EtRk54TChrKfIxY4POwff7SnsppLANhevsrCQmMfic1O7cHLmfbrz9dqd
	lz+MmDtvBeBTgvet3Q=
X-Received: by 2002:a17:902:da82:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d3b0d5ed01mr190367395ad.13.1786890157697;
        Sun, 16 Aug 2026 07:22:37 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc8199sm26102365ad.74.2026.08.16.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:22:36 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: will@kernel.org,
	mark.rutland@arm.com,
	sj@kernel.org,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	kunwu.chan@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [RFC PATCH 0/4] mm/damon/perf: add ARM SPE AUX backend
Date: Sun, 16 Aug 2026 22:22:17 +0800
Message-ID: <20260816142222.689624-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

This series adds an AUX trace-buffer backend to the DAMON perf
observability framework, enabling ARM SPE (Statistical Profiling
Extension) to deliver hardware-sampled access reports into DAMON's
existing SPSC report ring.

Patch 2 touches drivers/perf/arm_spe_pmu.c to expose the PMU matcher.
This change is tightly coupled with the DAMON AUX backend.  ARM SPE
PMU driver maintainers only need to review patch 2.

This series is based on the Ravi's hardware-sampled access reports 
branch [1], and depends on the perf AUX kernel-consumer RFC series [2].
The dependencies is not upstream yet, so this series remains RFC.

Why a dedicated AUX backend
---------------------------
ARM SPE and similar PMUs do not deliver samples through the standard
perf overflow callback.  Instead, they write trace data into an AUX
buffer managed by the perf core.  The AUX buffer is consumed from
process context (kdamond) rather than from NMI, so the existing
overflow-callback path in DAMON cannot be reused.

The backend model adds three operations to the damon_perf_event
lifecycle: init (allocate the AUX buffer), arm (position the consumer
cursor), and drain (parse the SPE packet stream and publish reports).
The backend is selected at event creation time by matching the PMU
object via its event_init callback.

What the series adds
--------------------
Patch 1 introduces the backend operations table, the backend state
fields in damon_perf_event, and the Kconfig options.  ARM SPE must be
built into the kernel; the KUnit test option is separate.

Patch 2 is the ARM SPE backend.  It owns a per-CPU AUX buffer,
decodes the SPE packet stream (the same encoding that perf's
userspace arm-spe-decoder handles), resolves sampled
CONTEXTIDR_EL1 values to tgids under RCU, and publishes synthesized
access reports.  The drain runs before the SPSC ring consumer on
each monitoring interval, and a final drain after event disable
ensures no records are lost.  The backend also modifies the ARM SPE
PMU driver to expose arm_spe_pmu_match() for PMU object matching.

Patch 3 adds byte-exact KUnit tests for the SPE record parser.  The
tests cover load and store records, timestamp terminators, multiple
records in one window, PAD and ALIGNMENT packets at both odd and
aligned positions, extended addresses, bad-packet resynchronization,
truncated records, and records without a virtual address.  A split-
record test verifies that a record spanning two AUX snapshots leaves
the tail unchanged until the terminating packet arrives.

Patch 4 adds a DAMON selftest for the AUX backend.  It checks the
backend integration, the required AUX-before-ring lifecycle ordering,
runs the parser KUnit suite through debugfs, and on an ARM SPE system
creates a live DAMON session with a controlled userspace target,
verifying positive end-to-end pipeline counters and final
enqueue/dequeue closure.

Testing
=======
Tested on Kunpeng 920 (256 CPUs, ARM SPE, kernel 7.1.0-rc5-mm-new-damon+):

  ARM SPE KUnit (spe_parse_one_record):
    16 passed, 0 failed, 0 skipped
    (store record, load record with timestamp, two records, pad-wrapped,
     alignment at odd/aligned positions, bad packet resync, record without
     address, events/source/counter, truncated record retained, truncated
     packet retained, extended address, invalid extended header, pad-only,
     empty window, split record across two snapshots)

  AUX selftest (damon_perf_aux_test.sh arm_spe_0):
    SUMMARY: 52 passed, 0 failed, 0 skipped (Overall PASS)
    callback=58318, valid=58318, enqueue=43390, dequeue=43390,
    match=34049, update=564
    final ring closure: enqueue=43390 dequeue=43390

Known limitations
=================
- AUX_BACKEND_MAX=4: the AUX backend registration table holds at most 4
  backend types.  This is a framework limit, not a per-PMU-instance cap.

- ARM SPE must be built into the kernel (ARM_SPE_PMU=y), not as a
  module, because the backend calls arm_spe_pmu_match() at initcall
  time.

- The AUX buffer is 2 pages (8 KiB).  The SPE hardware pauses when the
  non-overwrite ring is full; the drain frees space and re-enables
  the event.

- CONTEXTIDR_EL1 carries the sampled task's pid, resolved to tgid
  under RCU.  Records without a valid tgid are dropped.

- This series requires the perf AUX kernel API patches [2] to be applied
  first.  These patches are not yet upstream and must be reviewed by the
  perf subsystem maintainers.

References
==========
Link [1]: https://github.com/damonitor/linux.git
          branch: ravi_hw_sampled_access_reports_rfc_v1
          commit: fd968106e5bf

Link [2]: https://lore.kernel.org/all/20260814144927.489172-1-kunwu.chan@linux.dev/
          perf AUX kernel API PATCH Series:
          - perf/core: add AUX buffer ownership for kernel events
          - perf/core: add AUX ring accessors for kernel consumers
          - perf/core: add KUnit tests for AUX kernel-consumer API
          - selftests/perf_events: add userspace AUX regression test
          - selftests/perf_events: add AUX kernel API selftest script


Kunwu Chan (2):
  mm/damon/perf: introduce AUX backend interface and Kconfig
  mm/damon/perf: add AUX trace-buffer PMU backend for ARM SPE

Lian Wang (ProcessMission) (2):
  mm/damon/perf: add KUnit tests for the SPE record parser
  selftests/damon: add DAMON perf AUX backend test

 drivers/perf/arm_spe_pmu.c                    |   8 +
 include/linux/damon.h                         |   5 +
 include/linux/perf/arm_spe_pmu.h              |  11 +
 mm/damon/Kconfig                              |  28 +
 mm/damon/core.c                               |  22 +-
 mm/damon/ops-common.h                         |   6 +-
 mm/damon/perf/Makefile                        |   5 +
 mm/damon/perf/aux_backend.c                   | 121 +++++
 mm/damon/perf/aux_backend.h                   |  72 +++
 mm/damon/perf/spe_backend.c                   | 479 ++++++++++++++++++
 mm/damon/perf/spe_parser.h                    | 109 ++++
 mm/damon/perf/spe_parser_test.c               | 365 +++++++++++++
 mm/damon/vaddr.c                              |  68 ++-
 tools/testing/selftests/damon/Makefile        |   1 +
 .../selftests/damon/damon_perf_aux_test.sh    | 414 +++++++++++++++
 15 files changed, 1704 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/perf/arm_spe_pmu.h
 create mode 100644 mm/damon/perf/aux_backend.c
 create mode 100644 mm/damon/perf/aux_backend.h
 create mode 100644 mm/damon/perf/spe_backend.c
 create mode 100644 mm/damon/perf/spe_parser.h
 create mode 100644 mm/damon/perf/spe_parser_test.c
 create mode 100755 tools/testing/selftests/damon/damon_perf_aux_test.sh

-- 
2.43.0

