Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEBD3C0610
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718992; cv=none; b=QHuvJMJXfZ9jgTFqDZTuJN9yQhofd//bT5Y1F5GaYH3o+FQ+hcOfFeef7lUSVTutLUpz8S+6FsyWeP/NGxNXKLFiPS98KmyuXGi7nrvfrweEdCZZpdu9NIqUFfn/ByWuvkOQVdw+HP3UfLiz1Rg6SkjM0K5lVdh1aJzPyjNn8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718992; c=relaxed/simple;
	bh=uZIqwcHCpNuloVYJFSJBtdXYc1QBATJdoK+TQwPO66w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tb3UHKr56M8UiE5fegQ5Fiy/KQZDraH9Hz1SuozlNuqqDu9ms/WSHo5RM09g7w7krnSw4TBV8Ftiwr2p1XM0kz6XhjKbZmqdzyKeQdNR/i4qul6ScX1rE3HS2q027FxvnokUOHUhA4YXo4y4uDo7Zzvw6GCvzWvWhZV8fyG0QC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPq7qtPj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPq7qtPj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1522916a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786718990; x=1787323790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghTiZ6Z56GNViKfVdE8FdrADeUaJWs4M5g2nNXwrNUU=;
        b=fPq7qtPjeuxOkTWGRT1lRT5sTIQJ0vzfbN7I32RPn0WbUgaUC/6sQ2RLdx7ZpCAz7P
         HV8wG2jlqd+9XpGsqGj9Q0WTamg5pdOe6ybI79kprGG7F2w+diHz/ejfSfKZkhjUYt2v
         chNnyRW3xXZGMvJs77W1kOsp1nMHjMiB7igV5kYZclDOjRyh08jIgt1shOy2QH40g67E
         FzJm+wxzgJkj6oxf67HXG+kiYsq3KPgbW1Thwf1qvGvi/ylhKl9oEEaWTm3oAuM9d/wv
         6MpTcHSauCc6q27cBju2iA2jMGl8lvQxdz2BDFckkewLgn39z1yytE/t3widmZWU6EZd
         +ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718990; x=1787323790;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghTiZ6Z56GNViKfVdE8FdrADeUaJWs4M5g2nNXwrNUU=;
        b=VFgQ2WT0y8u2nty+Ri8ZC8sjuv20QwK8WqUGZpswuGNbds1Mqz7+xJtqcg1EKSc1WG
         rtoXvVJ3WmoF/XE7uX3r/nfGifayrX34tXNOv3iYnZj4V3jAK5dpXAo3SOha7lz7yujR
         VE37QpUC394NxyFpcikDBDp6hX+lEO+LHBF9+/D0IP7qCP37hZ7uFQxK2YtmCMYPJ099
         eCzyOOuKrUuiu5j0xCx8Jok34bnvglt8u0VU+kZdaYKRXzFZiFhoRW1lsiJCscK/sETm
         O0oKP1MWVpnjOfsRVlyA205m1kAVN1UAI66fE+1Q8fyEbyrIytUiFt7pZefnunPSldYT
         Cvnw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg/+7SbSAkYDd8Y1KZpblCKQzrLeL1SfBLAuDwmdU3RdQJOetPb4Ki8324qxSjDN4cxxYLUQLd/52Uwq3AEWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjRqYqRiQ6BNkYAAWJrJmXI8WYR2s795EyfnlUdU320UzJ04Ui
	KeknJfrK2TVOMBO1g86UxdEEgwfQSlkoV7iy7ZXqrb0vkdCqq9G4R7fLuazFhyo9/fc=
X-Gm-Gg: AR+sD11Wr0YVQ7c/MqRaAL3Dnvp68VXAwUILsPa4tYeFPZgZiOGQV3mBiOFEbCWtWYi
	WbLsohIUe6OsDeY90xPAW0Twgn5CM5xxgzSVp7yrEDeVAVLxaXe4rlYotUjEJyMpkdnlRVh8uFF
	IEjDPQtkQ3YlaQ9QQeNri8ka197x5ZGLBbgXZhX6z3P7G6UDBfN7ZbTtZOdfPRz1V0RFLvs7FT2
	ARanCRv/r8CYTu4WZB0DxVUK3e9XFNqmFm9dJsQWEMhXq4GdiOQPHquZH31ZJKx4dijUtJZLJy6
	B/IBYFGD1Icipv3Y7HiG4ECAfo0rgpWyDsa4hyUDNds3nvqGm1NoMD3WpKNsTUG8PnM4+FYa8WG
	6Prwn/7cZDH9zTa6E56sNim4287HcSquHvaG5Ow0kSkWm89av7CBs5eCVQh6JG7N8RX0HMei7IW
	5r0Onm9T+RL3Gl00poJt9u6D8V/XPaspyKSHdgVk06gpveW26HQXgKzRVX2jtP0huRN7alXzWUY
	zKlcRa2xAN1NbT8lw==
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3933b7a6986mr7990819a91.8.1786718989659;
        Fri, 14 Aug 2026 07:49:49 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b626d4esm1518950a91.2.2026.08.14.07.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:49:49 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	kunwu.chan@gmail.com,
	lianux.mm@gmail.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sj@kernel.org
Subject: [RFC PATCH 0/5] perf/core: add AUX buffer kernel-consumer API
Date: Fri, 14 Aug 2026 22:49:16 +0800
Message-ID: <20260814144927.489172-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

ARM SPE and other tracing PMUs write records directly to perf AUX
buffers.  Unlike ordinary sampling PMUs, they do not necessarily
generate a perf_event_overflow() callback for each record.  A kernel
consumer therefore needs to own and drain an AUX buffer rather than
rely on the overflow path.

Userspace obtains AUX storage through perf_event_open() and mmap().
Kernel events created by perf_event_create_kernel_counter() have no
public interface for allocating that storage: rb_alloc_aux() is
reached through perf_mmap().

This series adds a small perf-core API for that use case.  Patches 1-2
add an in-kernel AUX owner, a setup/release pair, and producer-head,
consumer-tail, and copy helpers without exposing perf's internal page
array.  Patches 3-5 add KUnit tests, a userspace regression test, and
a selftest orchestration script.  The first expected consumer is a
DAMON ARM SPE backend, but this series is independent of DAMON and
does not add consumer-specific policy to perf.

The API follows the existing non-overwrite AUX protocol:

- setup validates the event, rejects non-power-of-two page counts and
  negative watermark, allocates the ring buffer and AUX pages, and
  attaches through perf's mmap-serialized lifecycle;
- release stops writers, drops the event->rb reference, and detaches
  only a buffer owned by this API;
- head reads use smp_rmb() to pair with the producer's data-write
  barrier;
- tail updates use smp_rmb() before and smp_mb() after to order data
  reads before releasing space;
- copy validates the requested modular cursor interval against
  [tail, head] before applying the ring mask and holds an AUX
  reference while copying.

Testing
=======

Based on commit 917d558b151c ("perf/x86: Optimize ACR handling in
match_prev_assignment()") in the tip perf/core branch.

Built and tested on arm64 (Kunpeng 920, ARM SPE present).  Each commit
compiles independently.  Full Image build succeeds with
CONFIG_PERF_AUX_KERNEL_KUNIT_TEST=y.

KUnit (39 cases, dummy AUX PMU, zero hardware dependency):
  pass:39 fail:0 skip:0

  The dummy PMU registered in suite_init provides ->setup_aux/->free_aux
  callbacks; setup_aux pre-fills pages with 0xAB so copy tests verify
  data correctness byte-by-byte.  Cases cover:

  - setup/release lifecycle (12): non-power-of-2 rejection, pow2
    acceptance, double-setup -EBUSY, parent event rejection, negative
    watermark, explicit watermark, writer admission/blocking, no-op
    release, setup/release roundtrip, multi-cycle, double release
  - accessor contract (20): head initial/advances/no-rb, copy full
    window/wrap/zero-len/data-correctness, copy rejects
    rewound/future/oversized/null/already-consumed/no-rb, tail_set
    valid/future/within-window/behind-ring/noop/consume-all/no-rb
  - multi-cycle produce->copy->tail_set (1)
  - perf_aux_output_end size=0, buffer-full stops producer (2)
  - two-event independence, release isolation (2)
  - user/kernel coexistence (1): simulated aux_mmap_count=1 event
    and aux_kernel_count=1 event on the same PMU, verify mutual
    non-interference and release isolation
  - concurrent release (1): two kthreads concurrently call
    perf_event_release_aux() on the same event, verifying the
    refcount_dec_and_mutex_lock serialisation and detach-block
    event->rb guard correctly handle the race

Selftest script (9 sections):
  94 passed, 0 failed, 2 skipped -- Overall: PASS

  Sections: build-time config, KUnit orchestration, userspace
  regression, hardware perf record + dmesg, DAMON integration,
  memory ordering static analysis, boundary validation, concurrency
  safety, user/kernel AUX isolation.

Userspace C program:
  9 PASS, 0 FAIL, 2 SKIP

  The program follows the standard dual-mmap AUX protocol: mmap the
  metadata/data ring at offset 0, set aux_offset/aux_size in the
  metadata page, then mmap the AUX area at aux_offset.  When the AUX
  area mmap fails (e.g. PMU does not support it), the test is SKIP
  rather than FAIL.  ARM SPE single-event limitation is also SKIP.

Kunwu Chan (3):
  perf/core: add AUX buffer ownership for kernel events
  perf/core: add AUX ring accessors for kernel consumers
  selftests/perf_events: add AUX kernel API selftest script

Lian Wang (2):
  perf/core: add KUnit tests for AUX kernel-consumer API
  selftests/perf_events: add userspace AUX regression test

 .../userspace-api/perf_ring_buffer.rst        |   56 +-
 include/linux/perf_event.h                    |   18 +
 kernel/events/Makefile                        |    1 +
 kernel/events/aux_kernel_test.c               | 1144 +++++++++++++++++
 kernel/events/core.c                          |  139 ++
 kernel/events/internal.h                      |    1 +
 kernel/events/ring_buffer.c                   |  205 ++-
 lib/Kconfig.debug                             |   15 +
 tools/testing/selftests/perf_events/Makefile  |    2 +
 .../selftests/perf_events/aux_kernel.sh       |  563 ++++++++
 .../perf_events/aux_kernel_usermode.c         |  546 ++++++++
 tools/testing/selftests/perf_events/config    |    2 +
 12 files changed, 2687 insertions(+), 5 deletions(-)
 create mode 100644 kernel/events/aux_kernel_test.c
 create mode 100755 tools/testing/selftests/perf_events/aux_kernel.sh
 create mode 100644 tools/testing/selftests/perf_events/aux_kernel_usermode.c

-- 
2.43.0

