Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9473B42CC
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 05:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696001; cv=none; b=nm8/oPcJGpme75UqYiKXCga1pXMtf/7c7yIm8GthjwKpV7ZQuMx4yrhYOC84mXA9R7ExGFqXe19wtfXEuSIlc1GwOHs2aLPZakZjEKFBYwUI3JjcbdaTdkJHNwQC6SLkUnFOGdi4totGdZz6FBHLvtRHiS1ZV2QcbqMmvA068po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696001; c=relaxed/simple;
	bh=IqZOTLrn7eYpXP48OnT1+GGJUhbeoR4Az65ChcnizhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGPyvr98asGr/Es4LJMo6tFrwc0tdgAPssOmjCGQCunl84DOtcDhhmpnUNlR720rTLHOaBW00bucfwPADS8LhrNlxfdydGLQEBYRvGWv6rRjy6ygE/z34dzvXCjkE+chqE+jRXF89kiMSKf8WCuSOU9P+ohNRObejTJGblMOcJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWzmVDud; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWzmVDud"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so1297884c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695999; x=1792300799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlvJfMM29kaHQ8AJYFEoB0KmVZRRhlej3ZxZxNGG49w=;
        b=iWzmVDudd0dFgi903RuZHBaGZNobq/DIms98l28wFPNW0AbZaJGHcG0ekKibjblWD7
         S+TEgRTj01A2VtwQevaj6xJ1tIe5jtzxxxZxJj0VfOhRjYjAhIH4n/wpClaRskFt7diJ
         QcU/krThHPfPXQwMKmsqLLIRqP2UB/KqypJWJY3ixEHJrmayAq8aCGv7tJDrMno9bZXu
         RNMoZXJFEA01GeGJd73lfnoukdRhJKxwHKCpQuFZmM2EYEA1bUgm4FfgUapGhtWbgi4Z
         e91N6Y5vSDBVSyIYT4i6CoLgHSZ7BXUq5S8wUJaYDTOoLWaF2HNqmF6pq3kX/B6XVU5d
         ArMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695999; x=1792300799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wlvJfMM29kaHQ8AJYFEoB0KmVZRRhlej3ZxZxNGG49w=;
        b=D2D5McwLZoqogqfma6QaNiSyqVWhIPhuJMzJ30yGjW1MljI2XD0TicGauJv79urc43
         QtNuFyMMlHpg5ckHZUoL2a5DYdYx6x1j841eNX1baSfnmjrz/nqsnHuObNRrND2zug0b
         q31DTMQZCM8DmNv2YMTrTR4WaP/kAQe4PLEBoL7Sm4EV29ZYu1PnPPXzQ5J0PYKyL15h
         7nZVl7O5BNJqnK+3E3ZNvlGRUzNvAdcNY1lhFsytBm2Lw/EYa9CZdvjzkv5zdC6BDKlD
         F95a0FX8xPsQOEbD6DRzlC1n+AB5lvjREjztgP45rmFB9BH/BTqZj+iqZBMp2eBly9yJ
         wYAA==
X-Forwarded-Encrypted: i=1; AKwUvBwAA3RhMur2iOwQkQqR0pNG7gC2Z0iGJakHJL9hToPgf+cRZYj88b3KiP3eaFb8YFixEGO5ABQYFnwRClnGY8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3VTzE44W3pB1CQoY5cQ700hWCKYjS1rcmsPVXxF0jid7FtKs8
	rpV2mU7ldXAGfAPp0xxGrWlpY1kTcFejFcDHIwAouTHhGWEProOugbcL
X-Gm-Gg: AYBFou0fgC+wXgmgAmUBgCcukTRyaccrUYJvO9eYuRJWn5/L3/VcHBohx4B/3YU2zJD
	6VobfIcfifeVueH2c1bFV2qAZHTHvptagyJBkI9idIToX2HOhqvg3hvEKVjZa1TCFGUgQvHY9Dm
	mEgLt8TGRN/wKsDCS99j+aQaIEfeqAQ5pe+AF5TZpHHPXxsSNajYir4EFMrgVsw9pURsJ7xE3Qq
	X2cq1BJDIj2s5tbhoLxsQpdZ7AdaRKWuS6fadrG349OkTPEtvzHspvFlsbRVEJN5yKKpDSjGSDW
	MUJy5CEyiUdk7ESs+3YTLOFXosVNqLtY8bs/WmqjIDrM8CmgDL3oXnWv1GUu4mnX8R0jyl5boaS
	amHiWI0eg2nUFtyhFRFCme+nqZLbwe4lOIITin/2UaYMpAPbZgCFWDzkUGoToVOVO65EnMz7qPE
	FZvk4XFl/kzFFlgmmELWKcMz4gjUGkgW3p5hMWqCTNyPFI36lOV+MBhYFwxdrCVCcDvDwW6jD7g
	G8ad6f0sx/yFA1QEYu1tpwucrT6Zgc5Fjra73m5N/Dbvvr/CQQSUYMc73IGsgXHp3822Mwp6zmS
	Q4DiZBjq55MahhFrl/IZmGoDQxgNpzgPh4gPR9rgjWzbVfcAjSR2+PlWNKYlBZSdcu9jTA1OT7L
	Mv66erX+ILVISvjh8lOVV5PW0ozj3NNOH3dxvDXTjp+PcrDjlBRVdsQ4bhfjqigLmsQ==
X-Received: by 2002:a05:701b:4546:20b0:14e:7162:2ab3 with SMTP id a92af1059eb24-16a5e49fd10mr7893438c88.8.1791695999082;
        Sat, 10 Oct 2026 22:19:59 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm20673698c88.5.2026.10.10.22.19.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:58 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Todd Poynor <toddpoynor@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] posix-timers: Report a disarmed SIGEV_NONE timer as disarmed
Date: Sun, 11 Oct 2026 10:49:42 +0530
Message-ID: <20261011051943.60520-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051943.60520-1-jain.sm@gmail.com>
References: <20261011051943.60520-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A SIGEV_NONE timer on a hrtimer or alarmtimer based clock is never
queued. The expiry time stored in the timer is all that
common_timer_get() has to compute the remaining time, and
common_timer_set() leaves it alone when the timer is disarmed with a
zero it_value. timer_gettime() then reports the remaining time of the
previous setting until that time has passed:

	struct sigevent sev = { .sigev_notify = SIGEV_NONE };
	struct itimerspec arm = { .it_value.tv_sec = 100 };
	struct itimerspec disarm = { }, cur;

	timer_create(CLOCK_MONOTONIC, &sev, &t);
	timer_settime(t, 0, &arm, NULL);
	timer_settime(t, 0, &disarm, NULL);
	timer_gettime(t, &cur);

leaves 99.99... seconds in cur.it_value. POSIX wants a zero it_value
for a disarmed timer. Timers which deliver a signal get that from the
POSIX_TIMER_DISARMED check in common_timer_get(), and the CPU time
clocks set the expiry time to 0 in posix_cpu_timer_set(), so they are
not affected. CLOCK_MONOTONIC, CLOCK_BOOTTIME, CLOCK_REALTIME and the
two alarm clocks are.

When a SIGEV_NONE timer is disarmed, move its expiry time into the
past. The timer_arm() callbacks only store the expiry time for such a
timer, so call them with an absolute expiry time of 0, which is not
after the current time of any of these clocks. common_timer_get() then
sees a remaining time which is not positive and reports a zero
it_value.

This is old behaviour: the sequence above gives the same result on a
v6.8 based distribution kernel. The commit which introduced it was
not searched for, hence no Fixes tag.

Tested in qemu with the sequence above on the five clocks, and with
the posix_timers selftest including the test added in the next patch.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 kernel/time/posix-timers.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 436ba794cc..f6dd8d34a8 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -904,15 +904,23 @@ int common_timer_set(struct k_itimer *timr, int flags,
 
 	timr->it_status = POSIX_TIMER_DISARMED;
 	posix_timer_set_common(timr, new_setting);
+	sigev_none = timr->it_sigev_notify == SIGEV_NONE;
 
 	/* Keep timer disarmed when it_value is zero */
-	if (!new_setting->it_value.tv_sec && !new_setting->it_value.tv_nsec)
+	if (!new_setting->it_value.tv_sec && !new_setting->it_value.tv_nsec) {
+		/*
+		 * SIGEV_NONE timers are never queued. The expiry time is
+		 * the only information timer_gettime() has to tell whether
+		 * such a timer is armed, so move it into the past.
+		 */
+		if (sigev_none)
+			kc->timer_arm(timr, 0, true, true);
 		return 0;
+	}
 
 	expires = timespec64_to_ktime(new_setting->it_value);
 	if (flags & TIMER_ABSTIME)
 		expires = timens_ktime_to_host(timr->it_clock, expires);
-	sigev_none = timr->it_sigev_notify == SIGEV_NONE;
 
 	if (kc->timer_arm(timr, expires, flags & TIMER_ABSTIME, sigev_none)) {
 		if (!sigev_none)
-- 
2.43.0

