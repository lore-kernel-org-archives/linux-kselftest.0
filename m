Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009593;
	b=Ye6tKtjXlv9I6wSh4n/pXGYl7c7KruPEApisqZEqDx3Chjl1+phlMRHsHVUL1Kh+0c+j
	 AhAIVE6eYjLa08R8GgDN3Op++ePoeWQsRYK4sPlpIJv6PbtB3+eAqb5iOPMspuGWuJoef
	 8KxczwOQ4PwQVgpuhoj5/qouM1n9a8F196fM1toj4YjO2z1xjFVt/LiFKvFM0zlGhyXg1
	 KovL+cSAX0+3ncOPH7MZ5pfkSB/Qh8AD0ceAv5lVWf1VngcAP/iMIaHEjCfF+dyDlTbcc
	 C6btgDqZKpvvqzeP02idj/xzKk/N99r9arR4hpeBpJ3EMnIBQ91YfqKPx9l0PydKHpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009593;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2suRc3jOCRKXQ3+1BglcMLXCn8fOrvnfKlvM85GZS6o=;
	b=li2+HQBb/NM6e5XCvV+s7Vjk9zqBrgMZsMeAZG4eMCX7owoBul2TtV9ypGkJX94DSwCD
	 3Hhcws4vt57j/C1mgnKrRpQ8zL5W5ftnW5i4/h6or8pwbW60ZZIRX84bHLNyRKI1miej9
	 b0FkXGafXL7xlknJ5GV+zbV+0HbS3QP31GcRH2MJ+jXm3khAy0nDBGl/IMQpNds5iCOSI
	 X175w8g2PdX4FygdkW5nLSWB858i5Y9fTivx4l0FHOIiYu2sOOH81rv3pn2nmKfRpapfy
	 J/QT3rCPQ+M4JLzFUD5u/6R7BZKfdSWNdaSGcbpsjfvkKIsY9SqKbbH4bdjP4z+vjPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=rxHHJQbb;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B72606A333;
	Fri,  6 Nov 2026 23:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B72606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=rxHHJQbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794009586;
	bh=2suRc3jOCRKXQ3+1BglcMLXCn8fOrvnfKlvM85GZS6o=;
	h=From:To:Cc:Subject:Date:From;
	b=rxHHJQbbfwldowI3Ffh0GxzistPedMdJnahahB8QIsoGFefHz8QKONqnY4bX/vKt2
	 n7mCPTkHSOE2CwpbHSp7/MYuOocw2zb2AoBI/YlfqTQG5GrZnDVilNHUpwVt+L0653
	 nn755zbfv9ALi7aNJFZR6XWai8a7Kw2gynadyp18uyaVeQ8CnDZlOAFVabIYYFv/IZ
	 dT9v0diRGbr+miY8Y7Nomi/iCIb1ZAazz6pF53PTCBV4qFbuHHGa6j/lJP3q1GOWe6
	 0tlyfjs+jAKzGrOGl6pWo8nM9DTAyCma+pYWrwgkjva8hDufEG49x6Dc5lq+3MVrNq
	 ofBXk9tIn/aJA==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jLx4L29wDzL0P;
	Fri, 06 Nov 2026 18:59:46 -0500 (EST)
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
Subject: [PATCH 0/5] locking/rtmutex: priority inheritance fixes and tests
Date: Fri,  6 Nov 2026 18:59:26 -0500
Message-Id: <20261106235931.1478800-1-mathieu.desnoyers@efficios.com>
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

Three fixes to rt_mutex priority inheritance on v7.4-rc1, and two tests
that catch them. They came out of v4 of "sched/deadline: bandwidth
accounting fixes and selftests", posted alongside, which applies on top
of this series: its patch 8 takes a deadline boost from the waiter's
rt_mutex node, which patch 3 here keeps current.

The three fixes, by patch number:

 1  the top waiter spins on a running owner past its own wakeups:
    behind the owner of a PI futex spinning in userspace, a 1ms timed
    lock returns up to 1.4s late and a signal waits as long, and with
    PREEMPT_RT two ww_mutex contexts in an ABBA spin on each other. The
    spin stops when the waiter is woken.
 2  with PREEMPT_RT, the chain walk reads the ww_mutex context that
    rt_mutex_init_waiter() leaves uninitialized, the debug poison on the
    waiters of PI futexes, and reports neither a deadlock on PI futexes
    nor a chain deeper than max_lock_depth. The context is initialized
    with the rest of the waiter.
 3  a waiter whose priority changes while another is ahead of it enters
    its owner's pi_waiters with stale sort keys once promoted, and the
    owner inherits from the wrong waiter. The keys are copied as it
    enters.

Patch 4 adds futex_lock_pi_inherit to the futex selftests. It checks the
priority an owner runs at as its waiters block, time out, get a signal,
change their priority or are promoted to the top of their lock, along
chains of owners; that FUTEX_LOCK_PI refuses a lock cycle, and a chain
deeper than max_lock_depth, with EDEADLK; and how late a timeout or a
signal ends a wait behind an owner that runs. Patch 5 adds to
test-ww_mutex an ABBA with both owners running. v7.4-rc1 fails the cases
of each fix, and the series passes them, with and without PREEMPT_RT,
along with the locking API selftests, the ww_mutex selftest,
locktorture's rtmutex_lock and the futex selftests. Each message has its
numbers.

These patches, their messages and the tests were written by an LLM
coding assistant under my direction and review. Patch 1 came out of a
stress test of the deadline boost, patch 3 out of a review of the
deadline fix by a second model, and patch 2 out of futex_lock_pi_inherit
on its first run with PREEMPT_RT. Each patch went through a local run of
Sashiko AI before posting, which changed the two tests only.

Based on v7.4-rc1, 6628e7d4c6b2.

Mathieu Desnoyers (5):
  locking/rtmutex: Stop spinning on the owner when the waiter is woken
  locking/rtmutex: Initialize the ww_mutex context of a waiter
  locking/rtmutex: Clone a waiter's sort keys as it enters pi_waiters
  selftests/futex: Test priority inheritance on PI futexes
  locking/ww_mutex/test: Time an ABBA with both owners running

 kernel/locking/rtmutex.c                      |  15 +-
 kernel/locking/rtmutex_common.h               |   1 +
 kernel/locking/test-ww_mutex.c                | 213 +++++
 .../selftests/futex/functional/.gitignore     |   1 +
 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_lock_pi_inherit.c  | 744 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   3 +
 7 files changed, 976 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_lock_pi_inherit.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

