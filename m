Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66F2D3ECF
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780857176; cv=none; b=REeFLh3U3/8ZTVvKiyGoOcYlfhP9TphyBPsCLiL64TS7ylN//fxx8FA/qkQBN177RDnFNUxYjosWzyI7keg12OBc27NJRncLcRDFQHEseu2ohnckIa+bhAcVw/xN9D1ynOKkkDioz8mMMQ2MdM1xwBfvtfg9LOXaFelbnW5tA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780857176; c=relaxed/simple;
	bh=pbc1pNNc6cTFgQkph2n+TtEu2+ImJUIGW8EIxv+XXhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibZd45TQxXCNHdupeDcS1CxQTnGXvgQ3T+skcCUPAAvMHdR3gbc2flAG4/DVB7ePaq+vhlJ+y8XLve1DqAKEiU07RYieQzLVq26CgGcXRXemn2aQvuR+Rz0NiAiXHgGGdIsSL4ZG5JVgBLswt+zOVCzo4sU1qyB3w1AsgjkAIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyMyfyLE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyMyfyLE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396bed274b9so29346071fa.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780857173; x=1781461973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ad3pf6hGMvQWvN2AHigfavSVonziqmgmmyZJttGF4qg=;
        b=NyMyfyLELc7gZ6E6PhZgREN6KZEpGMkLMoItl6WFg/DN/4GWf2rW/kHf1yS5nW1Ahe
         Aw3neerc40OdjwUtkebK7M1SDvF6vfzFx8D4oYPnqOxOgjbfvQfWPgDF3kS6SXbPwwUi
         PgAWHvQn9DoV/GmQ+Muh/ziUcoXyE9IzZ0ireO6WLDY/qiy0XORckmZKKX+VGmynbxjQ
         ka5wSXZqDyRShayfqjEWallWDosZr1hRqEdpfDal+dPAOP150wZuu3dzn0mQrkSPIo+W
         q5dhULFF4Vas0y9htDantuAPgzbM0RFNOtAPITiDfGa4J1ttQ9GzLS9/PJ9PA/R9gALg
         P14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857173; x=1781461973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad3pf6hGMvQWvN2AHigfavSVonziqmgmmyZJttGF4qg=;
        b=YiuaDO20lVdOlX01hGsEzI1FR2t0Admg534OMIhlrd3Bq52wIyL8zE6WitQj4TSNQf
         zQMro68cRCxFt2owTAi7oAw7xlvzys6OKU6qOE1GQ08nB1Lm/h0FYtms7pNgvZtjNdJS
         ar0GKBV5zs2t/YWJCU48iYF7ik/HtanIFRqyTYQfzs/HJk3SEK+FF82oGP9GcpOUJkI5
         /X+BYJu1ZyM0+cZjxpxoiSukhEork2F9Y84m1mDrXiCFPQbp4cFmvEWYAVBySO7AJpKj
         t4QmwtaaX9vW3XJiq1Sy43XarSSkf9UTgCcO+2jCJ/HKsUJ9NOXjYS1uS2ir0rolEH8h
         ribA==
X-Forwarded-Encrypted: i=1; AFNElJ82U84DKTdSXrzpqJKAQ7ph4OHRcpRbf1aSYpz8cGY8scOO9EWkW4i+PMEtzhCPIe2gQWo1leKh/hP9eX1+nYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSLddZ+t2oVLJjm0929GUAc+6/Fsftzj9LzkCdOh0x1jYgA0T
	oqvTyihgdQ8A6M/khAsQ+Y2mbCuwePhh/uY5ilvOnij6txiA1iBU6MDG
X-Gm-Gg: Acq92OHjBS9Q+Duo/NSfoFPuSQNcdsYV2aFcsfz0GvbHmTkSrg/ziM9wnq0pcs1xQAS
	hEb3VvX09nZawXQTUhP5ZzbOns6vgmSjiIftRORhAZ+3t96acDKLtFgqm3EcQKQvy5iX7PPI/B2
	y7OqTEm0NVuMG/t2wN0ar8HuXQ1C3Wtngo7ygOrHTYqxmBuItltLDxDB6LCX7puM2B97fmKjk+f
	xCp2NKW2Fl93YRwvdvy0JN/TsSZIuKyqYY/6yKIL3amJmXndDQYGoKiNYssH6vQEUFKUgoaarS3
	sqoQV6iFjwe+u/cJuCOIIARLDp0ppMOkDDhevuH0laygi/0sPVvdHA+rYNOVj5Mb8SGcS+7gf33
	sdXeILc7RW8Z0t2VzdAMlG6mH6ykOvnDw4ghFp/VlRL3fNOtoU6qCLLp6LcMN69H/qadotiKuEn
	DJbcKczi0p3uv+KwrH0ewqKQguaPPDZK3GI696jNDSp2FAFQJtZs/H7m2poBj0u86QeXAd/w==
X-Received: by 2002:a05:651c:1502:b0:396:8588:d5a9 with SMTP id 38308e7fff4ca-396d0841002mr30213181fa.11.1780857172233;
        Sun, 07 Jun 2026 11:32:52 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ec0sm40472421fa.33.2026.06.07.11.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:32:51 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com
Cc: peterz@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] selftests/futex: add FUTEX_LOCK_PI owner-exiting coverage
Date: Sun,  7 Jun 2026 21:32:48 +0300
Message-ID: <20260607183249.246037-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The futex functional tests cover FUTEX_LOCK_PI timeout semantics
(futex_wait_timeout.c) and robust-list owner death (robust_list.c), but
nothing exercises a non-robust PI owner exiting while holding the lock,
nor the basic ownership / EDEADLK / unlock word semantics of
FUTEX_LOCK_PI.

Add futex_lock_pi_exiting.c with three tests:

 - lock_unlock_basic: an uncontended FUTEX_LOCK_PI puts the owner TID in
   the futex word, a recursive lock by the owner returns EDEADLK, and
   FUTEX_UNLOCK_PI clears the word.

 - owner_dies_with_blocked_waiter: a thread acquires a PI futex and exits
   while holding it; a blocked FUTEX_LOCK_PI waiter must come out cleanly
   (0, EOWNERDEAD or ESRCH) and own the lock when it acquires.

 - stress_owner_exits: repeatedly drive the same exiting-owner path.

The exiting-owner retry path is where commit 210d36d892de ("futex: Clear
stale exiting pointer in futex_lock_pi() retry path") fixed a stale task
pointer that tripped WARN_ON_ONCE() in wait_for_owner_exiting(). That
warning does not change the syscall return value, so this test does not
assert on it directly; the stress loop exists to give a kernel booted
with panic_on_warn=1 (as fuzzers and CI commonly run) a chance to trip
on it.

Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 .../selftests/futex/functional/.gitignore     |   1 +
 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_lock_pi_exiting.c  | 265 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   3 +
 4 files changed, 271 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_lock_pi_exiting.c

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/testing/selftests/futex/functional/.gitignore
index 23b9fea8d190..7c39d10b38e4 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+futex_lock_pi_exiting
 futex_numa_mpol
 futex_priv_hash
 futex_requeue
diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index 5c1c824f9740..d59faf76a2aa 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -26,7 +26,8 @@ TEST_GEN_PROGS := \
 	futex_numa_mpol \
 	futex_waitv \
 	futex_numa \
-	robust_list
+	robust_list \
+	futex_lock_pi_exiting
 
 TEST_PROGS := run.sh
 
diff --git a/tools/testing/selftests/futex/functional/futex_lock_pi_exiting.c b/tools/testing/selftests/futex/functional/futex_lock_pi_exiting.c
new file mode 100644
index 000000000000..eb17c049aedd
--- /dev/null
+++ b/tools/testing/selftests/futex/functional/futex_lock_pi_exiting.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/******************************************************************************
+ *
+ * futex_lock_pi_exiting.c
+ *
+ * Coverage for the FUTEX_LOCK_PI owner-exiting path.  futex_wait_timeout.c
+ * already covers FUTEX_LOCK_PI timeout semantics and robust_list.c covers
+ * owner death via the robust list, but nothing exercises FUTEX_LOCK_PI when a
+ * non-robust PI owner exits while holding the lock, nor the basic ownership /
+ * EDEADLK / unlock word semantics.
+ *
+ * DESCRIPTION
+ *      Three tests:
+ *
+ *      1. lock_unlock_basic - uncontended FUTEX_LOCK_PI semantics: the futex
+ *         word carries the owner TID, a recursive lock by the owner returns
+ *         EDEADLK, and FUTEX_UNLOCK_PI clears the word.
+ *
+ *      2. owner_dies_with_blocked_waiter - a thread acquires a PI futex and
+ *         exits while holding it.  do_exit() runs futex_cleanup_begin() (which
+ *         flips the task's futex state to FUTEX_STATE_EXITING) and
+ *         exit_pi_state_list() (which hands off / tears down the pi_state).  A
+ *         contending FUTEX_LOCK_PI waiter must end up in one of:
+ *
+ *           0          - ownership was transferred to / acquired by the waiter
+ *           EOWNERDEAD - previous owner died holding the lock; the caller is
+ *                        now the owner and must acknowledge by unlocking
+ *           ESRCH      - the owner encoded in the futex word is already gone
+ *
+ *         and on the first two it must actually own the lock afterwards.
+ *
+ *      3. stress_owner_exits - hammer that same exiting-owner path.  This is
+ *         where the following bug lived: the 'exiting' task pointer was not
+ *         reset at the retry label, so after wait_for_owner_exiting() dropped
+ *         its reference a subsequent retry that returned a non-EBUSY error fed
+ *         the stale pointer back in and tripped WARN_ON_ONCE(exiting).  That
+ *         warning is invisible to user space, so this test cannot observe it
+ *         through a syscall return value; it only becomes a visible failure
+ *         (crash) on a kernel booted with panic_on_warn=1 (or built with
+ *         CONFIG_BUG_ON_DATA_CORRUPTION).  The loop drives the path so that
+ *         such a kernel trips on it - the canonical way fuzz/CI catch these.
+ *
+ *        Fix:    210d36d892de ("futex: Clear stale exiting pointer in
+ *                              futex_lock_pi() retry path")
+ *        Fixes:  3ef240eaff36 ("futex: Prevent exit livelock")
+ *
+ * AUTHOR
+ *      Based on futex test boilerplate by Darren Hart <dvhart@linux.intel.com>
+ *
+ *****************************************************************************/
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <pthread.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "futextest.h"
+#include "kselftest_harness.h"
+
+/*
+ * Iterations for the stress variant.  Enough to repeatedly land in the narrow
+ * EXITING window while keeping the test fast.
+ */
+#define STRESS_ITERS 1000
+
+static futex_t pi_futex;
+static pthread_barrier_t locked_barrier;
+static pthread_barrier_t release_barrier;
+
+static pid_t sys_gettid(void)
+{
+	return syscall(SYS_gettid);
+}
+
+/*
+ * Owner thread: acquire the PI futex and exit while still holding it.  Two
+ * modes:
+ *   park == 0: signal that we hold the lock, then exit immediately (racy; the
+ *              waiter races against our exit path).
+ *   park == 1: signal that we hold the lock and keep holding until released
+ *              via release_barrier, so a waiter has time to contend as a real
+ *              PI waiter before we die.
+ */
+static void *owner_thread(void *arg)
+{
+	long park = (long)arg;
+
+	if (futex_lock_pi(&pi_futex, NULL, 0, FUTEX_PRIVATE_FLAG) != 0)
+		return (void *)(intptr_t)-errno;
+
+	pthread_barrier_wait(&locked_barrier);
+
+	if (park)
+		pthread_barrier_wait(&release_barrier);
+
+	/* Die while still holding the lock. */
+	pthread_exit((void *)0);
+}
+
+/*
+ * Block on the PI futex as a waiter.  Returns 0 on acquisition, otherwise the
+ * positive errno.
+ */
+static int waiter_lock_pi(void)
+{
+	int ret;
+
+	errno = 0;
+	ret = futex_lock_pi(&pi_futex, NULL, 0, FUTEX_PRIVATE_FLAG);
+	return ret == 0 ? 0 : errno;
+}
+
+static int outcome_ok(int outcome)
+{
+	return outcome == 0 || outcome == EOWNERDEAD || outcome == ESRCH;
+}
+
+/* Results published by waiter_thread() for the owning thread to assert on. */
+static int waiter_outcome;
+static int waiter_owns;
+
+/*
+ * Waiter thread for the blocked-waiter test.  Contends for the lock and, when
+ * it acquires, records whether the futex word actually carries its TID and
+ * releases the lock itself (FUTEX_UNLOCK_PI must run in the owning thread).
+ */
+static void *waiter_thread(void *arg)
+{
+	pid_t tid = sys_gettid();
+
+	(void)arg;
+	waiter_outcome = waiter_lock_pi();
+	if (waiter_outcome == 0 || waiter_outcome == EOWNERDEAD) {
+		waiter_owns = (pi_futex & FUTEX_TID_MASK) == (futex_t)tid;
+		futex_unlock_pi(&pi_futex, FUTEX_PRIVATE_FLAG);
+	}
+	return NULL;
+}
+
+FIXTURE(lock_pi_exiting) {
+};
+
+FIXTURE_SETUP(lock_pi_exiting) {
+}
+
+FIXTURE_TEARDOWN(lock_pi_exiting) {
+}
+
+/*
+ * Uncontended FUTEX_LOCK_PI semantics, fully deterministic.
+ */
+TEST_F(lock_pi_exiting, lock_unlock_basic)
+{
+	pid_t tid = sys_gettid();
+	int ret;
+
+	pi_futex = FUTEX_INITIALIZER;
+
+	/* Acquire: we become the owner, our TID lands in the futex word. */
+	ret = futex_lock_pi(&pi_futex, NULL, 0, FUTEX_PRIVATE_FLAG);
+	ASSERT_EQ(ret, 0) TH_LOG("lock failed: errno=%d (%s)",
+				 errno, strerror(errno));
+	ASSERT_EQ(pi_futex & FUTEX_TID_MASK, (futex_t)tid)
+		TH_LOG("owner TID not in futex word: 0x%08x", pi_futex);
+
+	/* A recursive lock by the owner must be refused, not deadlock. */
+	errno = 0;
+	ret = futex_lock_pi(&pi_futex, NULL, 0, FUTEX_PRIVATE_FLAG);
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EDEADLK)
+		TH_LOG("recursive lock: expected EDEADLK, got errno=%d", errno);
+
+	/* Release: the futex word is handed back clean. */
+	ret = futex_unlock_pi(&pi_futex, FUTEX_PRIVATE_FLAG);
+	ASSERT_EQ(ret, 0) TH_LOG("unlock failed: errno=%d", errno);
+	ASSERT_EQ(pi_futex, (futex_t)0)
+		TH_LOG("futex word not cleared after unlock: 0x%08x", pi_futex);
+}
+
+/*
+ * A PI waiter inherits the lock when the owner dies holding it.
+ *
+ * The owner parks while holding the lock, this thread contends for it, then
+ * the owner exits.  The waiter must come out cleanly (no hang, no unexpected
+ * error) and, when it acquires, must actually own the lock.
+ */
+TEST_F(lock_pi_exiting, owner_dies_with_blocked_waiter)
+{
+	pthread_t owner, waiter;
+
+	pthread_barrier_init(&locked_barrier, NULL, 2);
+	pthread_barrier_init(&release_barrier, NULL, 2);
+	pi_futex = FUTEX_INITIALIZER;
+	waiter_outcome = -1;
+	waiter_owns = 0;
+
+	ASSERT_EQ(pthread_create(&owner, NULL, owner_thread, (void *)1), 0);
+
+	/* Wait until the owner actually holds the lock. */
+	pthread_barrier_wait(&locked_barrier);
+
+	/* Start the waiter and give it time to block as a real PI waiter. */
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiter_thread, NULL), 0);
+	usleep(1000);
+
+	/* Release the owner so it dies while the waiter is queued on it. */
+	pthread_barrier_wait(&release_barrier);
+
+	pthread_join(waiter, NULL);
+	pthread_join(owner, NULL);
+
+	ASSERT_TRUE(outcome_ok(waiter_outcome))
+		TH_LOG("unexpected FUTEX_LOCK_PI outcome: %d (%s)",
+		       waiter_outcome, strerror(waiter_outcome));
+	if (waiter_outcome == 0 || waiter_outcome == EOWNERDEAD)
+		ASSERT_TRUE(waiter_owns)
+			TH_LOG("waiter acquired but futex word lacks its TID");
+
+	pthread_barrier_destroy(&locked_barrier);
+	pthread_barrier_destroy(&release_barrier);
+}
+
+/*
+ * Stress: repeatedly let an owner exit while a waiter contends for the lock.
+ *
+ * Each iteration drives the FUTEX_STATE_EXITING -> -EBUSY -> retry path that
+ * the stale-'exiting'-pointer bug lived on (210d36d892de).  The warning it
+ * fixed is invisible to user space, so on a normally-configured kernel both
+ * the buggy and fixed kernels pass here; the point is to make a kernel booted
+ * with panic_on_warn=1 trip during one of these iterations.
+ */
+TEST_F(lock_pi_exiting, stress_owner_exits)
+{
+	int i;
+
+	for (i = 0; i < STRESS_ITERS; i++) {
+		pthread_t owner;
+		int outcome;
+
+		pthread_barrier_init(&locked_barrier, NULL, 2);
+		pi_futex = FUTEX_INITIALIZER;
+
+		ASSERT_EQ(pthread_create(&owner, NULL, owner_thread,
+					 (void *)0), 0);
+
+		/* Owner holds the lock; race FUTEX_LOCK_PI against its exit. */
+		pthread_barrier_wait(&locked_barrier);
+
+		outcome = waiter_lock_pi();
+		ASSERT_TRUE(outcome_ok(outcome))
+			TH_LOG("iter %d: unexpected outcome %d (%s)",
+			       i, outcome, strerror(outcome));
+		if (outcome == 0 || outcome == EOWNERDEAD)
+			futex_unlock_pi(&pi_futex, FUTEX_PRIVATE_FLAG);
+
+		pthread_join(owner, NULL);
+		pthread_barrier_destroy(&locked_barrier);
+	}
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/futex/functional/run.sh b/tools/testing/selftests/futex/functional/run.sh
index e88545c06d57..d1a681b798bd 100755
--- a/tools/testing/selftests/futex/functional/run.sh
+++ b/tools/testing/selftests/futex/functional/run.sh
@@ -51,3 +51,6 @@ echo
 
 echo
 ./futex_numa_mpol
+
+echo
+./futex_lock_pi_exiting
-- 
2.53.0

