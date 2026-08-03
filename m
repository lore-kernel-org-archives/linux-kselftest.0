Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494BD37189C;
	Mon,  3 Aug 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751486; cv=none; b=UzFC8pc9N1R37z7DpL1HCSpkq4Yy9IP0coenqG49fn4gFLTESnmSkCQ2JDdDjMrAvZiJZ/lhljlfSUV5f+KZFKcd1zL+8mRWyU/92Gb4zCSKaBO9YKE1cG2JB4daRHmt0X3JK3jGGf1QWYmHaLF8E/f2emiAQiyzChUvs/Ldh6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751486; c=relaxed/simple;
	bh=dLe0JZ5cz9D4d87WpF+9dg/9VS6T8sH4AHPqkBuDzJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IM3cowFg2KRjkIBI2+C23C9iuOKOvNbbyUV3a4Wnq6zBRz3kpDUqff/zjQO7kBt94iIU6BSqdZWWdEUm6YLIzBtWWTM5yE1iTeDN2QPQgNmlIifjrtgYFHAQElyEjZpsOiOlyz1XeIj60rIiEUv1vKRBd08zqiYuHUkNJVq+Wgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YVBaS+th; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FRgs3HTK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YVBaS+th";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FRgs3HTK"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/QK5E+QIO4VJur38PGi5I8kBi2zxNJvBErioMlVfXzI=;
	b=YVBaS+th+diDPuJwx7Nxj8xsZn7qPLBt7MhyZ0j4VcT1zgzaU/iQ+HMyA6y+JsYUSeWCrv
	Ceb1dTn5glXWAjOW+6XC2PFxl8eqnSrGhXVAQnr9WUdoWsZ8AeIMZmuor4+o3iGTNcvj36
	vanP6fRb07LFNxvevumiVCnHTf6dkSXX5zVSpy5I5kKJ801THEL4MF0RyOB0z6D/Ij/i18
	6w7HTkTrWlXNySDZqK9G7A9LpIpEaPwE40aMy3nmkmj24ub1HxNfcyHem1JvIDb6l4rvcr
	PG88SsLnioXIemi+NUq8izofVyRjFagj+4kln98UkVwzIc3ewTwXgneIHenj2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/QK5E+QIO4VJur38PGi5I8kBi2zxNJvBErioMlVfXzI=;
	b=FRgs3HTK3F0wWI3cUGqaqfQ86a/f67IW4f7A2mlSg/gh401aPQXebeUzdnU85bC3Z1+JBG
	sEt4Qx9DEQqUh6Ag==
Subject: [PATCH v2 00/17] timekeeping, hrtimer: Assorted cleanups
Date: Mon, 03 Aug 2026 12:04:31 +0200
Message-Id: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ7CIBBFr9LMWgzQhLauvIfpAmG0ExuoQJuah
 ruLdeHSzSTvJX/eBhEDYYRTtUHAhSJ5V0AeKjCDdndkZAuD5FLxpuZMz6sZvXkwp52PI+LEplA
 Or4XCtkOljYSyLvJG6/750n854HMugfSTA8Xkw2uvL+Jj/4cWwTgztr0qIWWnG3Meyc0peEfr0
 SL0Oec373Bh5tcAAAA=
X-Change-ID: 20260730-auxclock-nanosleep-prep-0316e89e6ac2
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=3419;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dLe0JZ5cz9D4d87WpF+9dg/9VS6T8sH4AHPqkBuDzJU=;
 b=73jXXaUH5NGeeXK78uGqPFqEao+1O9JSpETy6Hsx5Syl738dq4KNsRrUe5gcLtYEdaP0Mxlix
 5GJH0RKB6RaD4pR5CRO5sbKVpZBwJmX0+E5rbCM3Ky+rhEQmZYFBtaw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various cleanups I stumbled over while working on the timekeeping code.

Based on tip/timers/core.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Pick up Acks from John.
- Extend the description of "Explicitly list the tested clocks" patches.
- Drop some more custom ?SEC_PER_?SEC definitions.
- Drop SKIPPED_CLOCK_COUNT from nsleep-lat.c.
- Explicitly handle timer_delete() failure in nanosleep.c.
- Link to v1: https://patch.msgid.link/20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de

---
Thomas Weißschuh (Schneider Electric) (17):
      timekeeping: Rename clockid_aux_valid() to clockid_is_aux_clock()
      timekeeping: Use u32 for clock_was_set_seq
      hrtimer: Add a lockdep assertion to hrtimer_update_base()
      timer_list: Use standard 'long long' format placeholders
      timer_list: Use ktime_t over nanoseconds
      selftests: add clock-helpers.h
      selftests: timers: Use clock_name() and constants from clock-helpers.h
      selftests: timers: nanosleep: Drop output alignment
      selftests: timers: nanosleep: Explicitly list the tested clocks
      selftests: timers: nanosleep: Reuse kselftest error numbers
      selftests: timers: nanosleep: Move all single clock tests out of the loop in main()
      selftests: timers: nanosleep: Explicitly handle timer_delete() failure
      selftests: timers: nanosleep: Report each test separately
      selftests: timers: nsleep-lat: Use NSEC_PER_MSEC define for unreasonable latency
      selftests: timers: nsleep-lat: Explicitly list the tested clocks
      selftests: timers: nsleep-lat: Reuse kselftest error numbers
      selftests: timers: nsleep-lat: Check all calls to clock_nanosleep() and clock_gettime()

 include/linux/hrtimer_bases.h                      |   2 +-
 include/linux/posix-timers.h                       |   2 +-
 include/linux/timekeeper_internal.h                |   2 +-
 include/linux/timekeeping.h                        |   2 +-
 kernel/time/hrtimer.c                              |   4 +-
 kernel/time/timekeeping.c                          |   9 +-
 kernel/time/timekeeping.h                          |   2 +-
 kernel/time/timer_list.c                           |  65 +++++----
 tools/testing/selftests/clock-helpers.h            |  76 +++++++++++
 tools/testing/selftests/timers/adjtick.c           |   5 +-
 .../testing/selftests/timers/alarmtimer-suspend.c  |  38 +-----
 .../testing/selftests/timers/inconsistency-check.c |  38 +-----
 tools/testing/selftests/timers/leap-a-day.c        |   3 +-
 tools/testing/selftests/timers/mqueue-lat.c        |   3 +-
 tools/testing/selftests/timers/nanosleep.c         | 145 ++++++++-------------
 tools/testing/selftests/timers/nsleep-lat.c        | 102 +++++----------
 tools/testing/selftests/timers/posix_timers.c      |  36 ++---
 tools/testing/selftests/timers/raw_skew.c          |   3 +-
 tools/testing/selftests/timers/set-2038.c          |   3 +-
 tools/testing/selftests/timers/set-timer-lat.c     |  41 +-----
 tools/testing/selftests/timers/valid-adjtimex.c    |   4 +-
 21 files changed, 251 insertions(+), 334 deletions(-)
---
base-commit: ecc330e3096173f433659aa64ab3674d0d48440e
change-id: 20260730-auxclock-nanosleep-prep-0316e89e6ac2

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

