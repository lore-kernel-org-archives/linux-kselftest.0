Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE239C006;
	Thu, 30 Jul 2026 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394070; cv=none; b=LMWTJrEjXvlXt6aKSM184u2c7UXhU4xMyWLsPgNVIOYk69UfOetdRzq6YHa+V3aLfwJ7BFFFomctZ4CkSSltab7nFjWe5QssCK8ImnAZe1sRsI2WinnPBYd+9+4Q9KXDiEzV4tUiokPuudBxQ236tkkXKlMHb5b2ojKvEODqR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394070; c=relaxed/simple;
	bh=TXpWq42hg0zxAbdSJ/2kmaoSpSUcpqUaUupJKjG1n+A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o9o536mCdShAlQZ/s2xCZOg0HQB5fJg2ev1m8Z2CgXqVmELBOv1jzJ4RY+HIEdSvblSq06JfsOPgFMVGVJY7V5TVXJBT1IHHJEoEB1COpYN4+ZJ+6NEzvCMW4dKCA+xjDxqeXs/oe9hqIg3KDh2AbNSpaP6rrPvaf1rUlIBS9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kq400GdV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q3ai7BYp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kq400GdV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q3ai7BYp"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dR4a5SeRJDW2at0tige1CY/6QKf2u5+f+OhkzRdT1A4=;
	b=kq400GdVvU04kV2xi/M2ooeJ4LTm07I5p4gQM13W4deJosvhxucWkwk8tuIVcPpNg4rV6X
	XeQa+Niz/UwGbxjjw/uT32Hpy1YhQvNPc2FAHSEbiJtCMbnSr2QEX+5KMGYK2DIkOpOPPV
	F+tDzvRUsqm5uC6urWAf0TQKMFQiqzcnZlqOoEjOWChMojgqWrNGHUUGsK6sEXw5gC+11x
	b0Sa14gR0M0oIFlbmWBJYi/6CS5ntMi/L6H9hBg2D8QzYqBFmF5i3hfbCvbza6OZO57xgN
	f1//pjVOcd8PJOfzKy1az9jBSKRlL2Ko2kzE2mDT3ABGhLJ19mv91heeOE3crw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dR4a5SeRJDW2at0tige1CY/6QKf2u5+f+OhkzRdT1A4=;
	b=Q3ai7BYpqraNkgp01nrv4Zi7fjjFMf7sea9zesb8huVCCY2SGSlQQoMtOsn66NF7eUAeVk
	EABEAU0414fBSgDA==
Subject: [PATCH 00/16] timekeeping, hrtimer: Assorted cleanups
Date: Thu, 30 Jul 2026 08:47:37 +0200
Message-Id: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQqDMBREryJ/bSBGSFuvIi5COrafSqKJFkG8u
 x91M/AezMxGGYmRqSk2Svhz5hgEqrIg/3XhA8VvYTLaWP2otXLL6ofofyq4EPMAjGpMErquLJ4
 vWOcNSVtkz+u53HYXJ0yLHMy33PcDc5b+4X4AAAA=
X-Change-ID: 20260730-auxclock-nanosleep-prep-0316e89e6ac2
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2914;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TXpWq42hg0zxAbdSJ/2kmaoSpSUcpqUaUupJKjG1n+A=;
 b=cwRozmUTR/JhpeDjlQRIxn8Jaj+TPRnhgnh0XRh0iTZWLRD3mVjw51EeNV0z5shx7Z93KcyXJ
 19jV7V4oGW/AVvMbW0jFAi5ZRKkFl6sBIr7ZeTlaRhxlN5DY8TWVeTI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various cleanups I stumbled over while working on the timekeeping code.

Based on tip/timers/core.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (Schneider Electric) (16):
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
      selftests: timers: nanosleep: Report each test separately
      selftests: timers: nsleep-lat: Use NSEC_PER_MSEC define for unreasonable latency
      selftests: timers: nsleep-lat: Explicitly list the tested clocks
      selftests: timers: nsleep-lat: Reuse kselftest error numbers
      selftests: timers: nsleep-lat: Check all calls to clock_nanosleep() and clock_gettime()

 include/linux/hrtimer_bases.h                      |   2 +-
 include/linux/posix-timers.h                       |   2 +-
 include/linux/timekeeper_internal.h                |   2 +-
 include/linux/timekeeping.h                        |   2 +-
 kernel/time/hrtimer.c                              |   2 +
 kernel/time/timekeeping.c                          |   7 +-
 kernel/time/timer_list.c                           |  65 +++++-----
 tools/testing/selftests/clock-helpers.h            |  76 ++++++++++++
 tools/testing/selftests/timers/adjtick.c           |   5 +-
 .../testing/selftests/timers/alarmtimer-suspend.c  |  36 +-----
 .../testing/selftests/timers/inconsistency-check.c |  38 +-----
 tools/testing/selftests/timers/leap-a-day.c        |   3 +-
 tools/testing/selftests/timers/mqueue-lat.c        |   3 +-
 tools/testing/selftests/timers/nanosleep.c         | 136 ++++++++-------------
 tools/testing/selftests/timers/nsleep-lat.c        | 100 ++++++---------
 tools/testing/selftests/timers/posix_timers.c      |  33 ++---
 tools/testing/selftests/timers/raw_skew.c          |   3 +-
 tools/testing/selftests/timers/set-2038.c          |   3 +-
 tools/testing/selftests/timers/set-timer-lat.c     |  41 +------
 tools/testing/selftests/timers/valid-adjtimex.c    |   4 +-
 20 files changed, 242 insertions(+), 321 deletions(-)
---
base-commit: ecc330e3096173f433659aa64ab3674d0d48440e
change-id: 20260730-auxclock-nanosleep-prep-0316e89e6ac2

Best regards,
--  
Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>

