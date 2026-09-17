Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ED03783C8;
	Thu, 17 Sep 2026 01:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609986; cv=none; b=bHh7n/c9XFse8gS43UiPKi0QrlSb+GTkerHU0rmWNrZFbkflJ9hq1dhixz1gnelW9VrqKPQZUxo3APKaBmb4EfrXAsmkxDYUPpj75KrhyELqKGukyLl5XG5IRtjwnZe6QzI1SDcnofyBT8cjPK0ZdaseO+cnQ7NbL9P5sDNB+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609986; c=relaxed/simple;
	bh=8T28KQOfr4OB7lb/4tZK99GM4Z+ywMJ7DZABomWOBqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikn0MNykSYp/4pdSCsHRai551i59km2KV6oNrP8ryWDY/de8T8OSRO2rHe4RLxGiliO3yGXdx1pgUgEVJKHGCHSakQOOp/iaJb9JF5BhU9Thy6G7nTxtvapIf8GVzMlDWgQK3MSO/r1zGyW9pvF56ftMCDoGmShJ0rtm7kdFPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=fojasw8G; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="fojasw8G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=vplxqifmwEoowy9J+fHyt72nE4bkWAPruccniyNjPjQ=; b=fojasw8G+g9e
	5l/UkAZaOnmRBZBW4AW/YdHyoL+NIKzgwA11GXb1wOeMeG99eKEu6WssdEvrRJGhnxUouti9WHNLh
	3Gst8KI84KH0Ugfyx6ScyBO0z8Jx/1wjayTqRfEyhuCtoA4RkUtO5dZjAweDVAOL0LPsSWdKI5wPE
	++Jg7ptdKo5UdLg5vIy2JSyo72ociNbto+R/9nvAotDuxeZDZVlbA5G/zgOPJpA1Kuvw3YAcCM665
	RE5b7kcvqFf1Pu6ReBYJxH63LriWbzg6dSDmssanjEesML3JPz8AFdQ6I0rP9D9aUlRGpUs5AOGFk
	WXvpTEIUfNEmfR9RQ5GxMw==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1x71GC-000zT8-2F;
	Thu, 17 Sep 2026 03:52:50 +0200
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
Subject: [PATCH 1/2] selftests: timers: count what tick is worth in the drift estimate
Date: Thu, 17 Sep 2026 04:52:31 +0300
Message-ID: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

raw_skew measures the drift between CLOCK_MONOTONIC and
CLOCK_MONOTONIC_RAW and compares it against the adjustment adjtimex()
reports, but for the latter it reads only tx.freq. The kernel takes
the tick value into the adjustment as well, worth a microsecond of the
tick length per unit, a hundred ppm each, and a time synchronisation
daemon does put the coarse part of its correction there.  Where it
does, the two numbers cannot meet:

  # Estimating clock drift: -51.724(est) 48.277(act)	[FAILED]

On the machine measured, chronyd held freq at 48.278 ppm with tick at
9999, so the correction really applied is -51.722 ppm, which is what
the clocks show. The skip for an externally adjusted clock does not
catch this: the clock is steady, the offset is zero, and neither freq
nor tick moves during the run.

Count what tick is worth alongside freq. On the same machine:

  # Estimating clock drift: -51.724(est) -51.723(act)	[OK]

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/timers/raw_skew.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index 0c87a8fb0d7f..dfca3e2d50d2 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -91,6 +91,7 @@ int main(int argc, char **argv)
 {
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
+	long tick_nom;
 	struct timex tx1, tx2;
 
 	setbuf(stdout, NULL);
@@ -129,6 +130,17 @@ int main(int argc, char **argv)
 	/* Avg the two actual freq samples adjtimex gave us */
 	ppm = (long long)(tx1.freq + tx2.freq) * 1000 / 2;
 	ppm = shift_right(ppm, 16);
+
+	/*
+	 * The tick value holds the coarse part of the adjustment, a
+	 * microsecond of the tick length per unit, and time sync daemons
+	 * do put part of their correction there. What it is worth has to
+	 * be counted in as well, or a clock disciplined through it looks
+	 * off by a hundred ppm a unit against what the two clocks show.
+	 */
+	tick_nom = USEC_PER_SEC / sysconf(_SC_CLK_TCK);
+	ppm += (long long)(tx1.tick + tx2.tick - 2 * tick_nom) *
+	       (USEC_PER_SEC / tick_nom) * 1000 / 2;
 	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
 
 	if (llabs(eppm - ppm) > 1000) {
-- 
2.55.0

