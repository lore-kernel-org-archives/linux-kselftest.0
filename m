Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A5F36B932
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 05:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695992; cv=none; b=cms6Vi3nOGna2dp3O0URdt3LMXIyq0zxK2ICtKDnbZI2vUol5hhD7Ib3eIM+xAPDFVSpR2saaoUdOij92FH5mg/9LDRNOzzA6j2DRBiDL4Mcm39YUCsvSAhDdK/ON1hYrLiwOtoZhTCqkfS8acTk+ac/EMHjIDZba+KVTU/lVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695992; c=relaxed/simple;
	bh=3EC2AKJPqO2dWNFkwtLYRoUWCIHRMEUtDSUDwKh+jrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsSKZ7jlHVwjZNbFOzOAKaZvk0x0Z2TSIbm8tRQtVnQE2ZR0DUy8YQrDJ6syWA29KCWER5Pc0xD4wFK5D5QehMztlSV9/Fv8RqO88B93W5q6XCRz5CSC4GmqkftLV9nHTwtQB4RAf4WA78DfNqc27By9fCdO+XDmlphRzJqtxoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/T6cEV1; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/T6cEV1"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so841003eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695990; x=1792300790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Tgx4xiKNqVnyjDiNrZlwqV4pQ45w0gqpDsmg6e6t4=;
        b=N/T6cEV1Y2nwwjdfwfga+8R2nHOItwqFfy6ccxnHavMaRmimqztzDStdh7ZgKlQtX0
         sptzAC/mBvfWR3I77QhFg8yEhJbVAEiRtclkV/nJzbK95dah0F+celA960lmSKuO5IN1
         x5Xwz45JNjyMhRf6aNFJEnG4q6K1DVUuaSrcdKzkZR+jSIyhJtbeOxPX2LXhy4e+ISAm
         RzjvOUKnBv5Fg0FstLm2SeP1TWA2RZsD3nKgLMyMFbwjf5GFqaYHQlGpY34Hs4G4krhk
         eapuLt59jAMxL1ojgR2sjiW0jBlZ/koOijWIH3C8ZaI/mMKpQQfz6zgdR+HZBXR9p/Fr
         ZeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695990; x=1792300790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Tgx4xiKNqVnyjDiNrZlwqV4pQ45w0gqpDsmg6e6t4=;
        b=rI3zm9IWbp4jk35X6aZ/v/PsCwFyEENH2R3M7v8cP0JysenoAtGE41yenAGO4BWOU3
         IN+TW1NYVJ4A+XJ2ammjlUQumNpGjkha29ntFZJOy5wd0ZpJ3kV+D/RDDj0vQyaCTvxV
         xrFscXhrGYc3eAKfRatajbJVADKdaV6RpswF4FU+uuxV9Foal7Lmf1RxcCFzq2f/9KS4
         Y5ZS392ljKZ3lH7JrkZiIKM9PD1rXbikXJvaK1Cc+/Vjsgp+nm1maiv2SNKnI96NuGZq
         5OBH8i3c40Im/LFmBL2lY9s+aWKhoOvUl+CMEiFTU/fcT7j4yhQKOyASkghDzCYUjpOk
         EyZA==
X-Forwarded-Encrypted: i=1; AKwUvBxdAVFJHfcDs2XZUMC09zgfZHpxuEyAC6lpWXHi2ylk/qU53I1ze7wf/gt4x3dAL5pPSje3+eKP6mODxjriYUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAXOKS1gjM04j6i6AH+O6qXmut6utF5qynjOvLuym8TnQKtjJH
	c6L78rn7TpAFChgfsPWNdPOEHDop6wOHyi5+ubJ3tq/1Zo4JtUyk2XRq
X-Gm-Gg: AYBFou29j46+E6ANMN80c2ytkpzXk69/RFEkRkKJr0jzMuiRqkPSsGcbvUXRylDE8TR
	S+vWgW56pP1QhVClPtAZQ9U1dyZP+LCwzZZgs7ZG/MdifSKzVLQcFKXEiNIPDCf6ivTSALaWUQ0
	LkbR0ZfpOG3c3qGpIwN+rZxGKrHbqdMCVtdowsIIofg31TfylGWOQkAqHI8Qn935/QMF6W9EFl7
	Cg1vkeyg7A/jQNCCtg/Ub+YjCcHwrTJeYk2zdPPox2FqpwjXp0nlNYxz27Iv3FejWcqibFRqNuV
	Scfoc1dlkpFcTNGtoWTgns4TopQsWQ/B1llGtZ5d23NCUv1OyOjhpCZ56wd8T023h+fB+FKW4vT
	dwzlgjbCnLgfQSA0r9f2UFtap6YgpSI+vn7rIge2lk+e4GaSRUdQfYbpt/CGViKF9U+Ey+JN4EJ
	/gS70Z+5REqbyJf4VeHwj3sijdPSDcBMmKIglxlIlM6Au2C3H4D+lLJm418P5xgu6xuW1ebYMPE
	vKm/a1uLLrVrMCjhpM3DOOOg9Tx6iIvOXFhITPcOLvOeGcAqIXBOkBiAZsNly+yaVF0JaXr6x58
	PRgh1+3RuYaiDdmMCaxOAGRShZrQS1oH9qbAbT+lgu8ImeFgVxJLtuppeqDkqhPPThx7jTW8T1F
	xZS0lfOa+aeh/SzKHg7OlsTMeyiVS1ptZ8b95leAVoszAy5eHmNoCme4=
X-Received: by 2002:a05:7022:b048:20b0:158:b944:b15 with SMTP id a92af1059eb24-16a5ec48b20mr8682593c88.22.1791695989665;
        Sat, 10 Oct 2026 22:19:49 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm20673698c88.5.2026.10.10.22.19.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:49 -0700 (PDT)
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
Subject: [PATCH 0/3] timers: Report disarmed alarm timerfds and SIGEV_NONE timers as disarmed
Date: Sun, 11 Oct 2026 10:49:40 +0530
Message-ID: <20261011051943.60520-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two interfaces keep reporting the remaining time of the previous
setting after a timer was disarmed with a zero it_value, until the old
expiry time has passed:

 - timerfd_gettime() for timerfds on CLOCK_REALTIME_ALARM and
   CLOCK_BOOTTIME_ALARM (patch 1). The timerfds on the hrtimer based
   clocks report zero.

 - timer_gettime() for SIGEV_NONE timers on CLOCK_MONOTONIC,
   CLOCK_BOOTTIME, CLOCK_REALTIME and the alarm clocks (patch 2).
   Timers with signal delivery and the CPU time clocks report zero.

In both cases the stale expiry time of a timer which is not queued is
used to compute the remaining time. Patch 1 resets it in alarm_init(),
patch 2 moves it into the past when a SIGEV_NONE timer is disarmed.
Patch 3 adds a test for the second case to the posix_timers selftest.

The first problem was found by reading fs/timerfd.c, the second one
when the test program for the first was extended to POSIX timers.
Both are old: the first exists since timerfd got alarm clock support,
the second is also there in a v6.8 based distribution kernel.

Patch 2 uses the timer_arm() callback with an expiry time of 0 to
reset the stored expiry time, because that needs no new callback. If
a dedicated callback or a different place is preferred, I can redo it
that way.

Tested in qemu (x86_64) on top of mainline a5ebb76233b7 (v7.3-rc6+)
with a program which runs the arm/disarm/gettime sequence on all five
clocks for timerfd and for POSIX timers with SIGEV_SIGNAL and
SIGEV_NONE: 9 wrong results without the series, none with it. The
posix_timers selftest with patch 3 fails the new CLOCK_MONOTONIC test
without patch 2 and passes all 21 tests with it. The patches also
apply to next-20261009.

Shashank Mohan Jain (3):
  alarmtimer: Reset the expiry time in alarm_init()
  posix-timers: Report a disarmed SIGEV_NONE timer as disarmed
  selftests/timers: Test timer_gettime() on a disarmed SIGEV_NONE timer

 kernel/time/alarmtimer.c                      |  1 +
 kernel/time/posix-timers.c                    | 12 +++++-
 tools/testing/selftests/timers/posix_timers.c | 38 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 3 deletions(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.43.0

