Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE6324716;
	Mon,  3 Aug 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751488; cv=none; b=QfNQzN24/W/iQnl0b3N8EUVbo3lqFnoiDz8UmacGDW4KcukJ1SysPTFmSO5R69G4vlKv8zz23J1MHpacrOY6vvICstwnaZENiqo9xxFUVic1zwmkA0go91ry1K0jFtS3+ITzHsDZh8YmWanQoX/BHazY+MCQTEEX5DBxEl81MTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751488; c=relaxed/simple;
	bh=Xl1ObBJJ9doKi1YLNZSXz+OTP8phEgGASrTbmMr6rO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGuPv4MGkLllPfsozqUowK0elximpnXqQX2fWMoPoPoD3fCILAFFsELd0PuFvwZ8fWA1BNneqgu/uGL/P/a22FPl1IOdaevkivsyxfOx47MbKxS4UMs/MRgVCrVNb0lRGh/wc7N9e1spN6Mxd6rbQ/U+dIVDmVN4e5vgzimAZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FmXaqu2t; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9w1J7VWL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FmXaqu2t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9w1J7VWL"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iA1L8koirfsSOwpYSFrabj6XqsDC92pxOtrvhCX2Fxg=;
	b=FmXaqu2tMgaagEDn4RNspuC9k8qt27MrmrnemgqmVLu/Gow9jjOZ7SMrqSzF2X54kEp1hd
	EtJ93YzuB5XC0tqHj5QdKzzVjvRQldFjiz4Za3Xd8UrXh97RJCJ4B4LpJJso3g4oTqWF3D
	Fdun5I5/TQi2XUpbOYIJbOm1s8o1S7MV3Mb5iW8xox8unOLMYRTfvlBRlE+shHfce7dZRB
	19/+6GVUVx+RAsJbOzfYKRp3gpxHL8cyDBD+Ff6RfZGj8ATh8akeJrlD0BIggCiRA26WBo
	00ivq9zXxzjJVMKY6G7U2pBlEqX5Le6uPbJwU7AHO/FD2xcY1N1w/N0RmkJdUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iA1L8koirfsSOwpYSFrabj6XqsDC92pxOtrvhCX2Fxg=;
	b=9w1J7VWLEQ/vCAhCZy6USDixJ/HIByuuWkYrGLFDeBfzyGioCSxIW1KYnaH+3zSTlZHw2p
	CVi4IankstieLrAg==
Date: Mon, 03 Aug 2026 12:04:35 +0200
Subject: [PATCH v2 04/17] timer_list: Use standard 'long long' format
 placeholders
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-4-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=3770;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xl1ObBJJ9doKi1YLNZSXz+OTP8phEgGASrTbmMr6rO0=;
 b=Pd8GZ+pkIgRrWOGtal98cJY/KMypJnr1IQMfVCFRYdhohj1luC/8QPrEl3vKWMr3kjGDdaAst
 kdCJfVkDyWmAB6wDegtKPPcHHN46QFpAUlF4BKxELe91r8b68uxnhf7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

'%Ld' and '%Lu' are GNU extensions. While they do work for kernel code,
checkpatch complains about them all the time. Replace them with the
standard placeholders for 'long long' types, namely '%lld' and '%llu'.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timer_list.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 8823e7dcfce6..ccbbb2ad1517 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -49,7 +49,7 @@ print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
 	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer, function));
 	SEQ_printf(m, ", S:%02x", timer->is_queued);
 	SEQ_printf(m, "\n");
-	SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
+	SEQ_printf(m, " # expires at %llu-%llu nsecs [in %lld to %lld nsecs]\n",
 		(unsigned long long)ktime_to_ns(hrtimer_get_softexpires(timer)),
 		(unsigned long long)ktime_to_ns(hrtimer_get_expires(timer)),
 		(long long)(ktime_to_ns(hrtimer_get_softexpires(timer)) - now),
@@ -101,7 +101,7 @@ print_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
 
 	SEQ_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
 #ifdef CONFIG_HIGH_RES_TIMERS
-	SEQ_printf(m, "  .offset:     %Ld nsecs\n",
+	SEQ_printf(m, "  .offset:     %lld nsecs\n",
 		   (long long) base->offset);
 #endif
 	SEQ_printf(m,   "active timers:\n");
@@ -122,10 +122,10 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 #define DIAG_READ(x) data_race(READ_ONCE(x))
 
 #define P(x)				     \
-	SEQ_printf(m, "  .%-15s: %Lu\n", #x, \
+	SEQ_printf(m, "  .%-15s: %llu\n", #x, \
 		   (unsigned long long)DIAG_READ(cpu_base->x))
 #define P_ns(x) \
-	SEQ_printf(m, "  .%-15s: %Lu nsecs\n", #x, \
+	SEQ_printf(m, "  .%-15s: %llu nsecs\n", #x, \
 		   (unsigned long long)ktime_to_ns(DIAG_READ(cpu_base->x)))
 
 #ifdef CONFIG_HIGH_RES_TIMERS
@@ -141,10 +141,10 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 
 #ifdef CONFIG_TICK_ONESHOT
 # define P(x) \
-	SEQ_printf(m, "  .%-15s: %Lu\n", #x, \
+	SEQ_printf(m, "  .%-15s: %llu\n", #x, \
 		   (unsigned long long)DIAG_READ(ts->x))
 # define P_ns(x) \
-	SEQ_printf(m, "  .%-15s: %Lu nsecs\n", #x, \
+	SEQ_printf(m, "  .%-15s: %llu nsecs\n", #x, \
 		   (unsigned long long)ktime_to_ns(DIAG_READ(ts->x)))
 # define P_flag(x, f)			    \
 	SEQ_printf(m, "  .%-15s: %d\n", #x, !!(DIAG_READ(ts->flags) & (f)))
@@ -162,7 +162,7 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 		P(last_jiffies);
 		P(next_timer);
 		P_ns(idle_expires);
-		SEQ_printf(m, "jiffies: %Lu\n",
+		SEQ_printf(m, "jiffies: %llu\n",
 			   (unsigned long long)jiffies);
 	}
 #endif
@@ -201,7 +201,7 @@ print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
 	SEQ_printf(m, " mult:           %u\n", dev->mult);
 	SEQ_printf(m, " shift:          %u\n", dev->shift);
 	SEQ_printf(m, " mode:           %d\n", clockevent_get_state(dev));
-	SEQ_printf(m, " next_event:     %Ld nsecs\n",
+	SEQ_printf(m, " next_event:     %lld nsecs\n",
 		   (unsigned long long) ktime_to_ns(dev->next_event));
 
 	SEQ_printf(m, " set_next_event: %ps\n", dev->set_next_event);
@@ -259,7 +259,7 @@ static inline void timer_list_header(struct seq_file *m, u64 now)
 {
 	SEQ_printf(m, "Timer List Version: v0.11\n");
 	SEQ_printf(m, "HRTIMER_MAX_CLOCK_BASES: %d\n", HRTIMER_MAX_CLOCK_BASES);
-	SEQ_printf(m, "now at %Ld nsecs\n", (unsigned long long)now);
+	SEQ_printf(m, "now at %lld nsecs\n", (unsigned long long)now);
 	SEQ_printf(m, "\n");
 }
 

-- 
2.55.0

