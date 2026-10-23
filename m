Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768472;
	b=mv/0vdE/JZMavf6f/hlPGtgEoO8Yfw4H23MLCAnHJQRD0sBN71VFtQBX7cI263jqYC+K
	 EQSziS1HWJRmpmQrbSnO8vohTQmJ8A3FDZIyDwZ1Pnx7xwUnGfiXYSetUMLtyFw41nbQm
	 xDXsdj24et6LauKAh6qFKRlfXfKD9kZ8tsboZawkn4iJv4FimAy4G+spDqRLXsXcgx33u
	 zMkpZevZXZ8EWOSOnorOwxt/OevJD5B3Dv9j7bzag/r7E/jMviiLIoSrjNjsKJQAJ5anr
	 Z9z4YTi8/bmpArZfekpJGQ9xbKnB85NfgdkN7rccMGnhLOPS9FUqV/zT+40WegnNdFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
	b=K2ujy16gR5lOFxjjDdt/FOiFbBlCODzfMufXxlh5Eo7TFqG+cEYWYjkCcUS1NiFzAeLM
	 iwyCVa3OzuhqahnplJRwpIkb9hDZnbmaQCYVRkeujPkC3U+22vqlqQxCaATzKWWntmK/E
	 0nkXmId4xjGJ1kCF+UnZcbRgkmPuCzelA2M37M6F5skg9Qkrro4En69zX6CtQ7ShjUeyN
	 HuppvV7g1uNnsaL+WvkA/v8WudNHhmv2+JRQFnr+HOUu8RoVAV4snA3HA7XTXz6HME3uc
	 pIcLU8BF4w0qoCxoAwhLVmd2d1VDQUJZG2T/3TKTlWpbtTr3Qrihfjr7fJBqN4wYfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxihBLMX;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED201606A331
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 15:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED201606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CxihBLMX
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3c37877so603277a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768471; x=1793373271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
        b=CxihBLMXTDIBn+anE+uCpmjLkrvxoSA3hyKWVjlSCuMnuo82nEdfAGQ9o0g/3LVewC
         /z4P9NeXyQf/26phPZ6Owm4OtA82QnO3cLGAK8dJzvlbjmc8E3bUtzSayWycsUri4cjc
         2Jx+Qtig85c97pZBSfmyFJo+r8ZmNSV3WEWyjSJYr3EjMm3bJTP08G3os8WF9MyNZamq
         /ILCk4et44Q/wv7CrfgL3DJglK8Ka0BPmhZObrqCKNK8wO+FPPcCgNOYWKE4Qe0qN5Mr
         9xCd3Ze/SeNFBtI5Vzacce3fbucLfU1sAnDRUYGqnnikkvqiSGCYdH2fSb34Y0H359l3
         k/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768471; x=1793373271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYsXVdni1md+83PijIpFoxA8BV79W4PZ5dUTF0szV4w=;
        b=WmCm5fUE8XRlnYyHtR/9TUzIh4Zm+byxf7uThZKzXZg8crZJn2WI+6jsO8wgNwkQNP
         U852yolYWEdv5182TeNr4QH9ee9McNoQyk3hozQmrkntiXAGUhQrYamx+EUI+iElEJj7
         d9xOtq2LEadyKH/i1kfg/Jd8vI/+aWDAXVeWCoACG3drOoanmwHE0nSuVANyY3XwV5C0
         m1KeJ23bL9/Dhb4cNPHJOsS7Iyk7URzgIN4/eQjiB4LlZ1a4kHUuUy9VFalhzlj1l/SN
         s0I25POmNAMKrmLjGT+ZQZ9R5yQYd33xIhVSkvLOXlym62NhTP3m+fMoUG8M4kVBKvhc
         ho0A==
X-Forwarded-Encrypted: i=1; AKwUvBzuHua+Ig5BjYCmsccpq2jEvZXWAu7qPXP9xdUiFhpt1I3BGD/9YfMDFp/lysRLPGlPs1+7P5vgD/NC9ATrFvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfUYeLH78vXKpy5U9KT/7xnpaf6TbnuoUEIm2oFwBDEvAl1M+3
	CgKywGlUNxZlDwCyH7ryjJy/p0IQZEW8deFc/mbvOFJIwgHBkubkkdab
X-Gm-Gg: AYBFou1eRm+b0b034NnjrCtGHMI1UZAZ8wQuOKOyCrdC0v3URO3f4Wu2kevRSGLHgt0
	vSDt5usUUYI3UW6uoEoMykj1btRphekG1VK8saD/ObLfQkDEwNLDIvrmjAa9yNnMkjs+5egv6+y
	RB2TbcCzWxae/qwFXJUx/FvHnheupgk3w6IcMuQEKYSBzc3Mtp111xvG+w8+6L6Ht6uJ8Nk4wg5
	8oYCtG9MQ50BKi2IrYQsTnPU3r6gS3a8/GbcGdZP6FKDXumZtqUowZeGDO7SQEXvWN2CHYdcHg4
	tHr2HKcMYmQylLnhIsaPiWsGDden87zqSj7254vjh8K/uE7aqs/wHCiGRydmsPNV1OcHXyr5r+B
	sAeC6w/kIpEvWRSVOeutUKyG/fsJ5D08rZ0HYS57xSuN8u+Z77xJvEusaIuNat6VTq0ETzaL23U
	1KmvC6JbCRu/VOnLbmPZeoIm4ZDCUPO7Ni+HWgrDFATYQkUzVNQ8iZFGXHA/0QVALxbS7nmAPiR
	xIfFKulrEfRn4LHxGMKBNA8B9cXukRh4onbNKaN+kO5wT6SnHJPWlcCq07YOSo116qMBtSex+fN
	gk6zq8DUk5G2pmtDkeLOfRv+4bpbP9uYwA1nEvQlIsWrAFqQcStqpRP52FsUkw==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3adce0d3dc1mr2276865a91.53.1792768471109;
        Fri, 23 Oct 2026 08:14:31 -0700 (PDT)
Received: from localhost.localdomain (111-255-192-187.dynamic-ip.hinet.net. [111.255.192.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd84c87esm590809a91.11.2026.10.23.08.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:14:30 -0700 (PDT)
From: Hung-Jui Lin <alex.lin.programmer@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hung-Jui Lin <alex.lin.programmer@gmail.com>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: timers: Add a test for disarmed SIGEV_NONE timers
Date: Fri, 23 Oct 2026 23:14:11 +0800
Message-ID: <20261023151411.28685-2-alex.lin.programmer@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023151411.28685-1-alex.lin.programmer@gmail.com>
References: <20261023151411.28685-1-alex.lin.programmer@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timer_gettime() must report a zero it_value for a disarmed timer. For
SIGEV_NONE timers, common_timer_get() reported the remaining time of the
previous arming instead.

Add check_sigev_none_disarm(). It arms a SIGEV_NONE oneshot timer, checks
that a remaining time is reported, disarms the timer and checks that
it_value is zero. Run it for CLOCK_MONOTONIC and CLOCK_PROCESS_CPUTIME_ID,
as CPU timers use a separate implementation.

Without the preceding fix, the CLOCK_MONOTONIC case fails.

Signed-off-by: Hung-Jui Lin <alex.lin.programmer@gmail.com>
---
 tools/testing/selftests/timers/posix_timers.c | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 52b7289e1..464609b8c 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -496,6 +496,45 @@ static void check_sigev_none(int which)
 			 "check_sigev_none %s\n", name);
 }
 
+static void check_sigev_none_disarm(int which)
+{
+	const char *name = clock_name(which);
+	struct itimerspec its;
+	struct sigevent sev;
+	timer_t timerid;
+	bool armed;
+
+	memset(&sev, 0, sizeof(sev));
+	sev.sigev_notify = SIGEV_NONE;
+
+	if (timer_create(which, &sev, &timerid))
+		fatal_error(name, "timer_create()");
+
+	/* Start a oneshot timer which does not expire during the test */
+	memset(&its, 0, sizeof(its));
+	its.it_value.tv_sec = 100;
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+	armed = its.it_value.tv_sec || its.it_value.tv_nsec;
+
+	/* Disarm it. The remaining time must be reported as 0 */
+	memset(&its, 0, sizeof(its));
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+
+	if (timer_delete(timerid))
+		fatal_error(name, "timer_delete()");
+
+	ksft_test_result(armed && !its.it_value.tv_sec && !its.it_value.tv_nsec,
+			 "%s %s\n", __func__, name);
+}
+
 static void check_gettime(int which)
 {
 	const char *name = clock_name(which);
@@ -681,7 +720,7 @@ int main(int argc, char **argv)
 
 	ksft_print_header();
 	if (run_sig_ign_tests) {
-		ksft_set_plan(19);
+		ksft_set_plan(21);
 	} else {
 		ksft_set_plan(10);
 	}
@@ -715,6 +754,8 @@ int main(int argc, char **argv)
 		check_delete();
 		check_sigev_none(CLOCK_MONOTONIC);
 		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID);
+		check_sigev_none_disarm(CLOCK_MONOTONIC);
+		check_sigev_none_disarm(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_MONOTONIC);
 		check_gettime(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_THREAD_CPUTIME_ID);
-- 
2.56.0

