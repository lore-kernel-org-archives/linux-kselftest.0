Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE82931D5;
	Thu, 17 Sep 2026 01:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609985; cv=none; b=kAl46bQvSUYsGgBOmC3cVvOW2LrJxNXWvc+iYP/vgEBe7kggerMB4DGB7UtWihvxlixP3kaQdPowcPwMCiZmBVpFMgn9uKMm2qtFLSY59vqbXBZsoPz2+wUDkHBGs2TZ1uWZ0cI6OlARyAPYJluANL/CkS8+Q0crzG++0t6gCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609985; c=relaxed/simple;
	bh=jRa0I/DFJvlH8r7pH69fjZdiLwMB/gH5VGuUnv85Bis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFwQ+HhjA9rOYwk8KY6HdroMA0WgPpE+BuarftOJf+koQmhBxsvkiaTSRoVgSVmDWhv91YIjSOmT2w2aEO88XKFa1YpXUCksxIb1wFA6+DAHPy4cXQrz425oBUDrQBpjANA9+sLONGDZWS6On6gZYKYrfm2dE9J6ub4NSTX23IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=HNWNFVSS; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="HNWNFVSS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=FCZz7/EOzd892trA7wEQWmsnP/N8JdYZyiXBVif04Dg=; b=HNWNFVSSp09v
	nyjNX6gzzNLeNEm0DSQ772p5KRhn3Rg6W9MxJq8LaNZMBwW65NmQVp1nES6IaN5a9V0xhWF3xtmOX
	4EV5Z368PK4MJceTWWqEWmCcOmp6UBp9fuCJ0rRIqtv/y35xbUtkSAjoYbNQG58DKFrluDUbX5KU6
	0C+Q+Lubq3/zLgKa0mLt9iQdKXlNK1PoBZO8rMe0vhtExTZSNUsl/bUcQ71Putp9i4xEp+PAwwODg
	ew4ZLXShGqemzvaKbTKhVF3kfk70G3qUqY8GI4JH32dePcX7k7xFvtbr2pEb5VlDt88iHALY+rjFA
	MyxCWfewwa6UvUp5boxSYw==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1x71GD-000zT8-1z;
	Thu, 17 Sep 2026 03:52:51 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: timers: measure the CPU timers on the clock they count
Date: Thu, 17 Sep 2026 04:52:32 +0300
Message-ID: <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b00385b8d081 ("selftests/posix_timers: Use CLOCK_THREAD_CPUTIME_ID
for ITIMER_PROF measurements") gave ITIMER_PROF the clock it counts, as
measuring a CPU timer against the wall says nothing on a machine where
the task does not have a CPU to itself. The other CPU timers are still
measured against CLOCK_REALTIME and fail the same way. With four busy
loops on the two CPUs of a test machine:

  not ok 2 ITIMER_VIRTUAL
  not ok 5 timer_create() per CLOCK_THREAD_CPUTIME_ID
  not ok 6 timer_create() per CLOCK_PROCESS_CPUTIME_ID

ITIMER_VIRTUAL counts the time the task spends in userspace, so take
CLOCK_THREAD_CPUTIME_ID for it as well; the loop it runs stays in
userspace, so what that clock adds for system time is far inside the
half a second the check allows. check_timer_create() arms its timer on
the clock it is given, so measure on that one.

The test then passes whole on that machine, 19 of 19, busy or idle.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/timers/posix_timers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index a92d4b957747..52b7289e1450 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -113,9 +113,10 @@ static void check_itimer(int which, const char *name)
 
 	done = 0;
 
-	if (which == ITIMER_VIRTUAL)
+	if (which == ITIMER_VIRTUAL) {
+		clock_id = CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGVTALRM, sig_handler);
-	else if (which == ITIMER_PROF) {
+	} else if (which == ITIMER_PROF) {
 		clock_id = CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGPROF, sig_handler);
 	}
@@ -148,7 +149,7 @@ static void check_timer_create(int which)
 	struct itimerspec val = {
 		.it_value.tv_sec = DELAY,
 	};
-	int clock_id = CLOCK_REALTIME;
+	int clock_id = which;
 	timer_t id;
 
 	done = 0;
-- 
2.55.0

