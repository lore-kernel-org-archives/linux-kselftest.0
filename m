Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA939E16C;
	Thu, 30 Jul 2026 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394071; cv=none; b=Sd3768i4Bfe6s6GAh1LM4/rVEBxJ5yE/IsFRccwL7No0FvDkR9Gaj9GzU2XUnqCLH9htSKq1KzptfDv/mZLz+Zj/xv3EJH2jsqVKD2CZy4K/XMjFBDGrYF0JbgsLhHr/EUHh52IGacy6HY/zxTm/2UQ0Nq2JadUJhnWb3ss7BrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394071; c=relaxed/simple;
	bh=1YfIa+GoTudEtzaOLu1DVVnMup1Ru5ZCHc0rrCIlniQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9LkvGY6z52xh+EOZ/UxTt7QexVodp2KfoQNAg8y6SXsCX9wpqap/xpoD319t2YfaplIPwCTXGmAe79NkgL4rtyKjSFbiOM1Jd8Vi0sLTrWGJwAq6pHOHuY8+iPAqqH4BFmplJHeEXsIVGc3m5Ci3IK5I6FsUiqGacJqsJWtRoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x5JatO0v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IWiH2dQL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x5JatO0v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IWiH2dQL"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITYnrVttI1UlTiM4trm5wss4U2DN15KsfYMtrEvUmRI=;
	b=x5JatO0v+ybq1RRczpM/1/rhtchurbg9l/ByB5rHgdbKvat5P7qOWmiZiLrpYtGUwhO8Tc
	EaQcigizyJhN9gJLfQBmL3qYsBg7uKjBD5iQPWZuiLXSVfmDUMDiX9aJBf5YqpJfR7X5ML
	2L964qq1Mgy/StGEG3WAXp2S5a+mJVGQSEWun5PrU26TA8aoKgqe9EV6PMlOOyMvoWPiGE
	bQrewOENVnxAsu6u+cP0uuM5uRJghOn+qHJ+3qLZO4vlXGP+DyN0x1Wvacuvuxteu3FT+P
	jZWurloVNNWlTihQKTb0pDSYnN+A7DYSv8IFl9AAT96BOjf01I2S7fu8ZBGxmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITYnrVttI1UlTiM4trm5wss4U2DN15KsfYMtrEvUmRI=;
	b=IWiH2dQLB0oLuLm9MUgYVwqtSo2idZ2Ei6TWll8CKe9rPIUO958FDbWfAH2r0C2niMSTKw
	xah1PR/q4xr33FAQ==
Date: Thu, 30 Jul 2026 08:47:39 +0200
Subject: [PATCH 02/16] timekeeping: Use u32 for clock_was_set_seq
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-2-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1YfIa+GoTudEtzaOLu1DVVnMup1Ru5ZCHc0rrCIlniQ=;
 b=xS+6lGFK66SybOjxY9x7d5CRWMj3k+HYQ5yKXOBP0ecnvjJSguL4h6L9uew22zyPY9Viv5jru
 P1UXj27+LgMCdFLwX+kz6l52WN3DiqpL3dJVveoPjc4yMLm4SFLnOUv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Use an explicitly sized type to make the code a bit more consistent
with other fields of the datastructure and other sequence counters.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 include/linux/hrtimer_bases.h       | 2 +-
 include/linux/timekeeper_internal.h | 2 +-
 include/linux/timekeeping.h         | 2 +-
 kernel/time/timekeeping.c           | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

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
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index d4cdbcdcb9df..4421f83344d3 100644
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

-- 
2.55.0

