Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147244;
	b=TArXHl4mGJ4ANS7d0h+u45zhqudnQYdRuqtKm/CSVWLlxj51WtX+YOhhITC3AdZveGsz
	 kNI+qn+i4H5BD5jNptLt0/tx5ZYDsgIK4qSPjNVEszdNZ2t+87aKtCReaKSozvH/EHZVh
	 mJrCiF8QjJjoqm4CCOWIfu23/P8oeCbRruTsk2NoBBSivkZ1yAZ+m0FWuiQPuUz3xHFwa
	 3g0xIBzCU9yYHpidlwy8SPtFDjymXF861cgdqlrO8ptqwPvT0v0wyr8OdFcEUuHHI5IdV
	 9q1ZAMFyh37RsJhDv6x/qfyzt4HKMS2ZoyvBWIaCdpJ+wqBu/OZAEUfhwXbjXw6qJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147244;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H/G/OjMc6mQZaXNhFSTV9a8ylfQUHgfRGUW7bD2Bnw8=;
	b=EYyXc08ZOTchqqbdBaVUgNk1706Z/Czui2N8dVZwRdwMjLqBIjbTko49qdKY3cqEOjep
	 LO+dQOAXogfutwq3+C1U+y39XMewntKgfOl0crWUA5Q3njHpWt3ezCNHMxL0kGTRNFp5Z
	 KXdcJQ2IwaSZwyh7KSHf5J/lY+K7lww9BhSKhybNKCE6mGGmxDccvX8s7tlbV5oq87ljh
	 GfdTb3D6DU6XJxh3g5TNq0qfRIVqohg9qUTJVvBXs+b8FKLdW+dTVLBmsRNHZX48j4xfT
	 +Nr4IWSNU1Pv0iuOX2gEuvq4wQrH4SfKB9Vmn9lF1wdUHaBl9KixgPshcWBNIIgegYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=NuJNfYoC;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07A606A323;
	Sun,  8 Nov 2026 14:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A07A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=NuJNfYoC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794147236;
	bh=H/G/OjMc6mQZaXNhFSTV9a8ylfQUHgfRGUW7bD2Bnw8=;
	h=From:To:Cc:Subject:Date:From;
	b=NuJNfYoCrQVKljcSPPFClBpVK6f/fs/1nWXhwH/lodDZYf9LKDZWRfziEN+GP7okw
	 OnR/t167zW7rtz26BhtYOP6T7BeNu0cv02LL6AZ5TQ/DiByHMHCsmZGgKMQxnENWz2
	 KiPvt9+t8ezVRsttafsTyZABy1FpNf5SUUHjcQ3qqy45hFL5YYfn3UBC1/KVqFmOTX
	 mRn24eslSvaDhA318NFQbgeQuAp/59JMZw0DhxQMulhCLIqdiN1FLEOxeXwVQEEq1k
	 Lq82WU2srSyQZYPWwlpwJODMTHfjOkjMeOiIRH+vk4c9lfuIn3rNgvNF2WR2k/Qh0X
	 NamBxE1zY0C2g==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jMvzR5whdzM5p;
	Sun, 08 Nov 2026 09:13:55 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	will@kernel.org,
	boqun@kernel.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	juri.lelli@redhat.com,
	linux-rt-devel@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/5] locking/rtmutex: priority inheritance fixes and tests
Date: Sun,  8 Nov 2026 09:13:42 -0500
Message-Id: <20261108141347.1525532-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter, Thomas,

This series fixes three rt_mutex priority inheritance bugs on v7.4-rc1,
and adds two tests that catch them. The bugs came out of the work on
"sched/deadline: bandwidth accounting fixes and selftests". Its v5,
posted after this series, applies on top of it. Its patch 8 takes a
deadline boost from the waiter's rt_mutex node, and needs patch 3 here
to keep that node current.

The fixes
=========

 1  Stop spinning on a running owner once the waiter is woken, so that
    timeouts and signals are no longer delayed.
 2  Initialize the ww_mutex context of a waiter, so that PREEMPT_RT
    reports PI futex deadlocks again.
 3  Clone a waiter's sort keys as it enters pi_waiters, so that the
    owner inherits the right priority.

Patch 4 adds futex_lock_pi_inherit to the futex selftests. It checks the
priority an owner runs at, and the EDEADLK of FUTEX_LOCK_PI. It also
checks how late a timeout or a signal ends a wait behind a running
owner. Patch 5 adds an ABBA with both owners running to test-ww_mutex.
v7.4-rc1 fails the cases of each fix. The series passes them, with and
without PREEMPT_RT. So do the locking API selftests, the ww_mutex
selftest, locktorture's rtmutex_lock and the futex selftests.

How this was developed
======================

An LLM coding assistant wrote these patches, their messages and the
tests, under my direction and review. Patch 1 came out of a stress test
of the deadline boost. Patch 3 came out of a review of the deadline fix
by a second model. Patch 2 came out of futex_lock_pi_inherit, on its
first run with PREEMPT_RT. A local run of the Sashiko AI review checked
each patch before posting.

Changes since v1
================

- Commit messages and comments rewritten to read more easily, after
  Peter's and Steven's reviews.
- Patch 1: Steven's wording, with the two paragraphs on the impact
  added. It carries his Reviewed-by.
- Patch 3: new subject, "locking/rtmutex: Clone the sort keys in
  rt_mutex_enqueue_pi()". The message shows the sequence that leaves
  stale keys, and the comment is one line.
- Patch 5: the stage handoff of the ABBA test uses release and acquire,
  as the Sashiko review of v1 found. On a weakly ordered CPU, the test
  could fail falsely with EDEADLK.
- No change to the kernel code.

Based on v7.4-rc1, 6628e7d4c6b2. It also applies as is to tip
sched/urgent (006991aa8997), which the deadline series is based on.

v1: https://lore.kernel.org/lkml/20261106235931.1478800-1-mathieu.desnoyers@efficios.com

Mathieu Desnoyers (5):
  locking/rtmutex: Stop spinning on the owner when the waiter is woken
  locking/rtmutex: Initialize the ww_mutex context of a waiter
  locking/rtmutex: Clone the sort keys in rt_mutex_enqueue_pi()
  selftests/futex: Test priority inheritance on PI futexes
  locking/ww_mutex/test: Time an ABBA with both owners running

 kernel/locking/rtmutex.c                      |   9 +-
 kernel/locking/rtmutex_common.h               |   1 +
 kernel/locking/test-ww_mutex.c                | 235 ++++++
 .../selftests/futex/functional/.gitignore     |   1 +
 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_lock_pi_inherit.c  | 773 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   3 +
 7 files changed, 1021 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_lock_pi_inherit.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

