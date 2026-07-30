Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E61D3B583A;
	Thu, 30 Jul 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394088; cv=none; b=DXHn/vHDiScG0r/Wd13YYzFdrogQcHepx0ZCLGSQbWpmu1OEbNBHOWU4JPqaukVy6RNjKVGzPDDhVwcKWWzB1o6MV7Q8nrN5W6qyYknhbCxWNOPc3lYvGTnp/K3hCvo0pySolsr+J9EPyTMPchYkBEHdHN5WJPUBWGnzzl6bH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394088; c=relaxed/simple;
	bh=cUXvWgpHvavzMPmDRzKum1/SvWgScmfvyd6LPyeOKto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILeRO0P0NKsfzingHA6wZpfm0fIJxteFtAF7m3FdewN4CT/nQV5wtr5dMOh5v/5f3EXc2H6esN/XljrxS6MAgyF8fY51klf9wUW/ZUKgbFGyHR2kKAlcjpqPBQlRHp8WMyzeU7wfBqnpRWKrmTKYltjFffG2JX3vKrm6GyocMJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WsL5O3BF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Nd5ERmi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WsL5O3BF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Nd5ERmi"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdr5cDv/mhpFX+x0CnuUGtsXAPxcrE1Hliq6YLtsHWU=;
	b=WsL5O3BFGZGs+8of0ozENmxPtXOkEZUdrRSrFOxFW7tBWAyvbvNFEzoThVSo9BWNaVHKmK
	t5tRAdNdwgSvf/MtkSo2VhGdjO7VloHVX4USi+Ku2RcnEYMnDWa4IlQhojcvisYDQ3S4um
	5ChtA1e+Y0HRzSekZuclSVPp3cf49oTqNq1Khx8cQC8ZnLZQVcrjHNO2M0Is8Se7Y/IvN2
	f2lP9AMeZJMT9cL+pL0LdEqBoIIECUTEFpkGswA0GdfrrYC3dJzopTC+DFB9K90KYtvR+I
	BxrbR02wU5lxvvwGRzFpwbB8CCkiwKoHHnXta7uHtjca03jdvOzkj0BX07SQVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdr5cDv/mhpFX+x0CnuUGtsXAPxcrE1Hliq6YLtsHWU=;
	b=0Nd5ERmijstM32kwFgtDwdGrPTh1hiIG+3QOB0AvhpOKOycI/m9NauQsYLa2Bs9HfXnebx
	dHXj2gSegoc63fCw==
Date: Thu, 30 Jul 2026 08:47:52 +0200
Subject: [PATCH 15/16] selftests: timers: nsleep-lat: Reuse kselftest error
 numbers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-15-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=2145;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cUXvWgpHvavzMPmDRzKum1/SvWgScmfvyd6LPyeOKto=;
 b=XKLXYIqrPv/vcDEN7uN9IH835WkS3I0IUQvlZCVOJ+mPhnbIKCs2Re43iMLVzSmV18lhJ9lUH
 VbuUJ2RbXytD2ISHzbz0lxztiM5wnXtsvWxLoAHW5vlzDv19lZYHVl4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test currently defines its own custom error numbers.
These mirror the semantics from the standard KFST_* constants.

To make the code easier to read, use the standard result constants.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/nsleep-lat.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index ead3271287d6..86af6d81cb14 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -29,8 +29,6 @@
 
 #define UNRESONABLE_LATENCY (40 * NSEC_PER_MSEC)
 
-#define UNSUPPORTED 0xf00f
-
 struct timespec timespec_add(struct timespec ts, unsigned long long ns)
 {
 	ts.tv_nsec += ns;
@@ -60,9 +58,9 @@ int nanosleep_lat_test(int clockid, long long ns)
 	target.tv_nsec = ns%NSEC_PER_SEC;
 
 	if (clock_gettime(clockid, &start))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 	if (clock_nanosleep(clockid, 0, &target, NULL))
-		return UNSUPPORTED;
+		return KSFT_SKIP;
 
 	count = 10;
 
@@ -74,7 +72,7 @@ int nanosleep_lat_test(int clockid, long long ns)
 
 	if (((timespec_sub(start, end)/count)-ns) > UNRESONABLE_LATENCY) {
 		ksft_print_msg("Large rel latency: %lld ns :", (timespec_sub(start, end)/count)-ns);
-		return -1;
+		return KSFT_FAIL;
 	}
 
 	/* Next check absolute latency */
@@ -88,10 +86,10 @@ int nanosleep_lat_test(int clockid, long long ns)
 
 	if (latency/count > UNRESONABLE_LATENCY) {
 		ksft_print_msg("Large abs latency: %lld ns :", latency/count);
-		return -1;
+		return KSFT_FAIL;
 	}
 
-	return 0;
+	return KSFT_PASS;
 }
 
 #define SKIPPED_CLOCK_COUNT 3
@@ -125,12 +123,7 @@ int main(int argc, char **argv)
 
 		}
 
-		if (ret == UNSUPPORTED) {
-			ksft_test_result_skip("%s\n", clock_name(clockid));
-		} else {
-			ksft_test_result(ret >= 0, "%s\n",
-					 clock_name(clockid));
-		}
+		ksft_test_result_report(ret, "%s\n", clock_name(clockid));
 	}
 
 	ksft_finished();

-- 
2.55.0

