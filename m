Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22133FE2F;
	Mon,  3 Aug 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751487; cv=none; b=QsQzEe7zvpUw/oFOp2QyPlj3uJg73OiU4BNODjzlw967Vrtadptf2FWNV7I9GcX/9bc48SRTEuWuvsEj/1A/WYki30pofsAX86fDzvo7gY/klmdFNFViAE/X9QD4jt6NkGICDGWhY5Rhvqa60b9APU0zmhInXF4TkX4hkCBas8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751487; c=relaxed/simple;
	bh=PTowp/FvLPE92NssmWbWusBpgoBwA0rg28qCtRx1VAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onTSnJsUnerkpS5tQ1Yb336uDq6ulWEQXXm5KRiitlSJbKNLdO2PRItyDnWQAYv0lh2LyTnSNpyEBJJG1VQaCxUxkInRXA+ERCC++MrQcABLXigsV+UpJVeB8w0qmQAOFtu9wjiEnbT5ut4iHQqEESBCzygH1qfkKl42vxZz4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LXdhTVs1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6WRp28WL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LXdhTVs1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6WRp28WL"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3cxRIda73uUlRO0Uq3wYFJDAkzvVt74b1o3ZlJ+yuk=;
	b=LXdhTVs1mY2G+xGrw7leS0acY92NhSEEWG6Wj1hWiRi6KZEjip0ABKyvXetmWofQMAjBCc
	StXxzOw/kf10yVDN/uhUp/0i8U/ZbLzY8wMkMucMd5m4fd3icd7r9k0+vyIFh2HEwvKcKH
	O0pQP5wL2cEoGqbQd0IC+cOPUp0AnoZTi7subNzH70iKoLpcP6cQI5QNqxQPDQ6k+DC+sx
	olHYytVC/ozM9v21DygRl2IcZ1wEpUULzyqqfPV18vn4Q008AAslTEXwFGqLwGdPX8Te5h
	LyE9XzzHd489h20wyR13f6kmlJpbP/DDG1Z4AvIEDXOM3m2NSYoaPL7uVBQtoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3cxRIda73uUlRO0Uq3wYFJDAkzvVt74b1o3ZlJ+yuk=;
	b=6WRp28WLyg5oidVHH72d9EqN8f1C5lTqza8RllCasHVLy/O7QsqhFviwxf47h/GTJIvxhp
	j6y42FxyZCFIqJDg==
Date: Mon, 03 Aug 2026 12:04:33 +0200
Subject: [PATCH v2 02/17] timekeeping: Use u32 for clock_was_set_seq
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-2-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=3900;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PTowp/FvLPE92NssmWbWusBpgoBwA0rg28qCtRx1VAE=;
 b=giS5LeM3LJ6PxsjPR712gj7TcZD+PE+IRORb5PQz0ZcrON31xmSO5wi00zYhsWizC7Ob97Dnu
 pa5gGctaxBiB2OYq8nf2/KvYmhiT0oxZEx5tETb3zlFuHiUymxZao5A
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Use an explicitly sized type to make the code a bit more consistent
with other fields of the datastructure and other sequence counters.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 include/linux/hrtimer_bases.h       | 2 +-
 include/linux/timekeeper_internal.h | 2 +-
 include/linux/timekeeping.h         | 2 +-
 kernel/time/hrtimer.c               | 2 +-
 kernel/time/timekeeping.c           | 5 +++--
 kernel/time/timekeeping.h           | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/hrtimer_bases.h b/include/linux/hrtimer_bases.h
index 70b99e651168..d4c83ec5c0f8 100644
--- a/include/linux/hrtimer_bases.h
+++ b/include/linux/hrtimer_bases.h
@@ -84,7 +84,7 @@ struct hrtimer_cpu_base {
 	raw_spinlock_t			lock;
 	unsigned int			cpu;
 	unsigned int			active_bases;
-	unsigned int			clock_was_set_seq;
+	u32				clock_was_set_seq;
 	bool				hres_active;
 	bool				deferred_rearm;
 	bool				deferred_needs_update;
diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekeeper_internal.h
index 9c198f65621b..fe077d97b5f8 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -169,7 +169,7 @@ struct timekeeper {
 	u32			cs_ns_to_cyc_mult;
 	u32			cs_ns_to_cyc_shift;
 	u64			cs_ns_to_cyc_maxns;
-	unsigned int		clock_was_set_seq;
+	u32			clock_was_set_seq;
 	u8			cs_was_changed_seq;
 	u8			clock_valid;
 
diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index b4191a873c39..1345550d45b4 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -301,7 +301,7 @@ struct system_time_snapshot {
 	ktime_t			monoraw;
 	enum clocksource_ids	cs_id;
 	enum clocksource_ids	hw_csid;
-	unsigned int		clock_was_set_seq;
+	u32			clock_was_set_seq;
 	u8			cs_was_changed_seq;
 	u8			valid;
 };
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 01890b7a5f98..957c619e4271 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -903,8 +903,8 @@ static void hrtimer_reprogram(struct hrtimer *timer, bool reprogram)
 static bool update_needs_ipi(struct hrtimer_cpu_base *cpu_base, unsigned int active)
 {
 	struct hrtimer_clock_base *base;
-	unsigned int seq;
 	ktime_t expires;
+	u32 seq;
 
 	/*
 	 * Update the base offsets unconditionally so the following
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index d4cdbcdcb9df..815861ce451b 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1563,10 +1563,11 @@ int get_device_system_crosststamp(int (*get_time_fn)
 				  struct system_device_crosststamp *xtstamp)
 {
 	u64 syscnt_cycles, cycles, now, interval_start;
-	unsigned int seq, clock_was_set_seq = 0;
 	ktime_t base_sys, base_raw, *offs;
+	u32 clock_was_set_seq = 0;
 	u64 nsec_sys, nsec_raw;
 	u8 cs_was_changed_seq;
+	unsigned int seq;
 	bool do_interp;
 	struct timekeeper *tk;
 	struct tk_data *tkd;
@@ -2873,7 +2874,7 @@ void do_timer(unsigned long ticks)
  *
  * Called from hrtimer_interrupt() or retrigger_next_event()
  */
-ktime_t ktime_get_update_offsets_now(unsigned int *cwsseq, ktime_t *offs_real,
+ktime_t ktime_get_update_offsets_now(u32 *cwsseq, ktime_t *offs_real,
 				     ktime_t *offs_boot, ktime_t *offs_tai)
 {
 	struct timekeeper *tk = &tk_core.timekeeper;
diff --git a/kernel/time/timekeeping.h b/kernel/time/timekeeping.h
index 198d0608db74..4201f9e90813 100644
--- a/kernel/time/timekeeping.h
+++ b/kernel/time/timekeeping.h
@@ -4,7 +4,7 @@
 /*
  * Internal interfaces for kernel/time/
  */
-extern ktime_t ktime_get_update_offsets_now(unsigned int *cwsseq,
+extern ktime_t ktime_get_update_offsets_now(u32 *cwsseq,
 					    ktime_t *offs_real,
 					    ktime_t *offs_boot,
 					    ktime_t *offs_tai);

-- 
2.55.0

