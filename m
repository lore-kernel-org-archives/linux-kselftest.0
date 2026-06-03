Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD103264E9
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 07:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473344; cv=none; b=CbsxXIQNXGvNMOuhLE62DU5dhdVlQ6i+JuSHBnw420D8hdMW9GC6NHM3GPN9HU7q2V2oTtfsQYYpWUVy9HXPdnoaYyD3TTlKgMgCpwmA+Ghbcs+Z4ZuV128UCD1zjYpD7XfbcynTScUOkf22LmIpwWY1LUVYYEQ9HOsZ2b9OjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473344; c=relaxed/simple;
	bh=qZt6k6gQUpEN3wxjDK2+OGptp1W1fZ3QAL125w449+s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oUKk4y0tW58F8X+A+3QGGAaz1CdNCtTZcL12Ef6f8qbzjl8pkbP+pBo9ZdHYfXvyxflYOpzBXcS4MPwgaLbq3+CDAc/PPth+CKCTHRUmBY+fy/ZzYIdpHNBtSu86DTWTk3XV5ZyC+ScVGfnDSORmkp6b0HLHuFj8ZGqAVpUS5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=axqv4+lf; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="axqv4+lf"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so5490505a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 00:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780473342; x=1781078142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z0aC4SbmBMwckBFt0C3kdVbl8ub6EFgukBGA8o2KYJ8=;
        b=axqv4+lfJjGNV9hhulYU9QKqNohVeIg3AVa1BSJWMYOgA5slh+lKc1dUqO/lv3FPQ+
         fm8Hu+QUDkMsVyjHjAwfggW+zlJCdCotIm0Qp0OxEIUw9P5nQqTdsgZdEITmTEFNroGD
         TBVQHkCboFI0TvmGFYIZ97blHQCp3VgQ6CIxztaTTPwYbXOfMG7dQQHsbRoPwk/GRxgx
         suVcFT0aMKj+EvKJnnoznLh/X+iWjph7QHqJE0fs3KbC/PV+hJ/rONX3FJSwTQx9JfWk
         XLiQmsvDlV8ntkaxi7Tqv0PotL627EL9OPR6BAVSiX+JKW8upWhxaDRzoBEVnlx6vTC3
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473342; x=1781078142;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0aC4SbmBMwckBFt0C3kdVbl8ub6EFgukBGA8o2KYJ8=;
        b=aSu0YStzmpFgJK+Brv7DPzH470hTNlp+uAapaQecFXgywnTeK7oMfzstVuEG1P2BpH
         TptP2WPbFAN4izIczMeilQyhYABXOgG5lO0BimREGb6H779guH1i8XdzE9CwRCzGuCXs
         DCjO6AMgLIF1Tk7s/EebblwIsbpialR9oDUNcXD5te//Qd4iemjUnxlWXR9gBQgIJlbW
         uUWS45D1hyPhwT63JG8wYu8gKDxGLmQyAYWL1ZYb3mEUsXwSBl/dD5Qa9FIrp80dceoe
         ogk+H5kORvjuCwyElHzYH71ZLlRQdqSsxptTgdQE1GJZBk2n54vLE01DBFLaQuMK9iTG
         1wlg==
X-Forwarded-Encrypted: i=1; AFNElJ92AKlqlzh0LQE1t/bXq1RQTPrGBJCCiXI6qyqoVTqlAbejxILn/iR/ZalMCE0dS7VDOn+VBEKUNBtJ+lGjRRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5TKA3JJGICSFYZ0VrND68dP+lpP6npFEQfGEffJ5mdPaAn/Lx
	170zUTg/NbBkCSjk6Ib1zEm0IjmBxU33vtLeAIdbCS1O0APnf/OB+NYpG4OfjLEDRgUAvt8VKfJ
	Pbw==
X-Received: from pgh11.prod.google.com ([2002:a05:6a02:4e0b:b0:c73:7b68:90d9])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e48:b0:3b4:7e2d:a3c2
 with SMTP id adf61e73a8af0-3b497665434mr2475796637.18.1780473342005; Wed, 03
 Jun 2026 00:55:42 -0700 (PDT)
Date: Wed,  3 Jun 2026 07:55:40 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603075540.659524-1-wakel@google.com>
Subject: [PATCH] selftests: timers: Fix integer overflows in 32-bit mode
From: Wake Liu <wakel@google.com>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, cmllamas@google.com
Content-Type: text/plain; charset="UTF-8"

Several timer tests use NSEC_PER_SEC for arithmetic. Since NSEC_PER_SEC
is defined as 1000000000L in vdso/time64.h, it is 32-bit on 32-bit
architectures. Multiplications like NSEC_PER_SEC * 10 or 5 * NSEC_PER_SEC
overflow 32-bit signed long.

Fix this by using LL suffixes or casting NSEC_PER_SEC to long long to
force 64-bit multiplication.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/timers/alarmtimer-suspend.c | 4 ++--
 tools/testing/selftests/timers/nanosleep.c          | 2 +-
 tools/testing/selftests/timers/nsleep-lat.c         | 6 +++---
 tools/testing/selftests/timers/valid-adjtimex.c     | 8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index aa66c805f6a4..a000688d5e23 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -32,7 +32,7 @@
 #include <errno.h>
 #include "kselftest.h"
 
-#define UNREASONABLE_LAT (NSEC_PER_SEC * 5) /* hopefully we resume in 5 secs */
+#define UNREASONABLE_LAT (NSEC_PER_SEC * 5LL) /* hopefully we resume in 5 secs */
 
 #define SUSPEND_SECS 15
 int alarmcount;
@@ -89,7 +89,7 @@ void sigalarm(int signo)
 	alarmcount++;
 
 	delta_ns = timespec_sub(start_time, ts);
-	delta_ns -= NSEC_PER_SEC * SUSPEND_SECS * alarmcount;
+	delta_ns -= (long long)NSEC_PER_SEC * SUSPEND_SECS * alarmcount;
 
 	printf("ALARM(%i): %ld:%ld latency: %lld ns ", alarmcount, ts.tv_sec,
 							ts.tv_nsec, delta_ns);
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index a054680b3372..fcdc649ec7b4 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -188,7 +188,7 @@ int main(int argc, char **argv)
 		fflush(stdout);
 
 		length = 10;
-		while (length <= (NSEC_PER_SEC * 10)) {
+		while (length <= (NSEC_PER_SEC * 10LL)) {
 			ret = nanosleep_test(clockid, length);
 			if (ret == UNSUPPORTED) {
 				ksft_test_result_skip("%-31s\n", clockstring(clockid));
diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index a7ba1eb1e21b..c49133afe270 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -76,9 +76,9 @@ struct timespec timespec_add(struct timespec ts, unsigned long long ns)
 
 long long timespec_sub(struct timespec a, struct timespec b)
 {
-	long long ret = NSEC_PER_SEC * b.tv_sec + b.tv_nsec;
+	long long ret = (long long)NSEC_PER_SEC * b.tv_sec + b.tv_nsec;
 
-	ret -= NSEC_PER_SEC * a.tv_sec + a.tv_nsec;
+	ret -= (long long)NSEC_PER_SEC * a.tv_sec + a.tv_nsec;
 	return ret;
 }
 
@@ -146,7 +146,7 @@ int main(int argc, char **argv)
 			continue;
 
 		length = 10;
-		while (length <= (NSEC_PER_SEC * 10)) {
+		while (length <= (NSEC_PER_SEC * 10LL)) {
 			ret = nanosleep_lat_test(clockid, length);
 			if (ret)
 				break;
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index e1e56d3097d6..8f10d64f0c96 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -260,16 +260,16 @@ int validate_set_offset(void)
 	if (set_offset(-NSEC_PER_SEC - 1, 1))
 		return -1;
 
-	if (set_offset(5 * NSEC_PER_SEC, 1))
+	if (set_offset(5LL * NSEC_PER_SEC, 1))
 		return -1;
 
-	if (set_offset(-5 * NSEC_PER_SEC, 1))
+	if (set_offset(-5LL * NSEC_PER_SEC, 1))
 		return -1;
 
-	if (set_offset(5 * NSEC_PER_SEC + NSEC_PER_SEC / 2, 1))
+	if (set_offset(5LL * NSEC_PER_SEC + NSEC_PER_SEC / 2, 1))
 		return -1;
 
-	if (set_offset(-5 * NSEC_PER_SEC - NSEC_PER_SEC / 2, 1))
+	if (set_offset(-5LL * NSEC_PER_SEC - NSEC_PER_SEC / 2, 1))
 		return -1;
 
 	if (set_offset(USEC_PER_SEC - 1, 0))
-- 
2.54.0.1013.g208068f2d8-goog

