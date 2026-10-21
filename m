Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548070;
	b=Cs2P6vuYflJWK2Wl39E3MiaTGVVsycmil4DOAi2qPV4sp2YvkTuDNJfvNCRaiokZAHX4
	 x2GlGKyylOEIfszbwnQoIh+sXYdFiK0y4lUS2TVIohXP/gGPW2skxUy0V0buiCd4UGLs8
	 PQVfVOXOyOns7rW69fLhIR4ucgedBdbuFj2eYG1vMny7Ni/oUuv5RP7OskAv1aDWf6hc0
	 0D76yWmwn1j+VbwnRbb+Xbsi0UnN0qP2TFZPnk/2gBSYdhXUknpW+GouK71IsinvCLF3p
	 Gdd6pxhw7BaE9MLHr9Ik8GgMOZVdG0/e7naS91Jhdv0LqeOpEbcSlTq7ZD64XMkMsfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iu0fYDBNq0qM6ieGxF7SKF04cC/pqSqWPF7xJOKvPpg=;
	b=2jY5++APksb6j2ryS+D4UY4zesTs6aF0ary8KAbLE/aMYwkzzSTXMdSRQ+jEhEgoyfPg
	 mWfIK6tIANAeNgNL0hi88/Y4K1suUAYHyyhb9eMLJye9wnug4ksY12yp2+ru2s/ewQpxN
	 w6jLyacuH8g+cX1Iq9mKixjpu8y13Ux7HqQyc57ijpssMFF8X1FZ5dj3Ky6L2RmxldBxv
	 DJHQMPMBLeY06JHOSi9YiAiqMx3G3u5a6QaBLH9Pa3lQJ/C+px8e7e/YL68dmKj60bkDa
	 CgAi0uvWnxB4fK17Eh80QO5TfqDLsQg+n9Od1y8WZpCvYeX1VMobJX7uAznDQ4A2pkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="H/qc23LJ";
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD777606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 02:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD777606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H/qc23LJ
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84a2bea315dso169781a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548068; x=1793152868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iu0fYDBNq0qM6ieGxF7SKF04cC/pqSqWPF7xJOKvPpg=;
        b=H/qc23LJt1zaJUKjsYtuGYdJ0pe02S4mnxUAMJRBt87ufBzk59e56YDAHdz+vpyVGJ
         MVjkLTkvdFioYj5XfSVFo3WdQx+G9s1sqkDYvTRhmCXBd7E15B/tLnEG4GZZdVFOhX1z
         g0euFhYYKRjdo/dkgI8tNC9CQ/3U2RG12L7qbxU65its+crA6ffH+whZMbIiwjL/dSkU
         U+GVOAPwA81SXxvtLbkn4uS9SSiqQKMAyoRRjDO+d8+O97oVPf9EheNXjD4/08CRLYcF
         Zebnxl97GuCNOC65qWa4IkYSRxI3SQSp3Ek2KpBb3HUI2xWZyhhzTZvp/oDLC0kXNjz6
         1btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548068; x=1793152868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu0fYDBNq0qM6ieGxF7SKF04cC/pqSqWPF7xJOKvPpg=;
        b=pvaEBR29terJAu+kB2VuWoRxwfvuTI9/GIegAO+XDeLO37M5i8Adf2Bji1MUKrMARe
         JoeAROGgerGr6Fb6wVCapxvkJY+k2g+YeifbZGpDrr0ZjZeVHEpOOqtZ7HRdSkMGC0ky
         xPx6AFGHj0a2FP8EwKrn/+Cnx2ud1QaEaD/YZnLwy7eANY64WxYCCApSL8ffv8uhhOKs
         /nBU6eHKKs8qNm4rV1xeko3jdenNP4g5n1tMkUL6q7GyVeWAF5RgP4JGvO7A5C9SzsR5
         xlVESiEQE2ZWQJTNPwmAiTFqUwutrmRRB79kQ0HaJV3dw9/vo6hHy6xs34zO68E626zq
         W0ag==
X-Forwarded-Encrypted: i=1; AKwUvByfNHQIhspb4NRRpKPBRy6CxjZQxWyyKU+HztDPez7gZXDdEXlvPpju+caBV4cxjQAJ+FKHw9Bi03ZTiuUm608=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCfqKU/dWFl7s4Kt+cwhjtsAQGuO/hqQa52F7abp20TmcfNpFN
	vfWOlwr57zg2zsC5NIw9UEU5e40KAHe39MPcifYKaPtWpSxT9Pwym/ke
X-Gm-Gg: AYBFou0ZVqg5oELFVaYosKSSpFZ4cVblT57EABTFAgmn/cT1TN3JJG7xdbovZ8aH1O7
	N65gRG1mP/OrVYitsRTSfGxj8C6m7Tw8lBhy8gMqUq70LJfnuPy5idfeic9NjdosREk4SJ/RBLT
	S4EgKK7uMc2dNTzMm8o7OMCY04yCQSzsgUNnMKPZtEiFn8krhRvFcg7+rJxExlkkesRxOholrYz
	SCVs+igOmZS69HQ63PT1gVHB12E4gInn/MNxEBhkEJewdK+pV3YplvLtFetmreMEqJObzemTsBd
	E5afujrqoen0VfytitChNXUvMXNZRcS9hzH42NCg5E0CkwkquYUzhAUQipiu4dVxb8Aiz+RDhVQ
	zUQ+MDvdOmmNY26Rjw8zUd5i27m3W+kFAokQ4n14ukTocuFpziCdDq9F3PKpEf63lpTEbEQn+uS
	q8GftGDtr1pysA7fs2h9hUO3NQ9QwckDFEBhSFy3HjkyDO6bEU55mCwFd8BMXlUhaTO65BZh+g9
	+/lgygQorZj+MsFg8CUQH/x8nI61pOZdv1FWjMC64Dc2gLz8ag6wkxj9dDNBYuTfZb9spI3JYV2
	HxJu7V7LiGWvTUkZKEBuIjg=
X-Received: by 2002:a05:6830:680c:b0:81c:5aac:798a with SMTP id 46e09a7af769-84d087fe940mr357225a34.13.1792548068561;
        Tue, 20 Oct 2026 19:01:08 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cba7d431esm1071785a34.2.2026.10.20.19.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:01:07 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Abhinav Saxena <xandfury@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests/tty: tiocsti: expect the privileged parent to succeed
Date: Tue, 20 Oct 2026 21:01:06 -0500
Message-ID: <20261021020106.94174-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The FD passing tests open a pty in a child process, which may drop its
privileges first, and pass the FD to the parent, which always has
CAP_SYS_ADMIN. The child's own TIOCSTI is checked against
.expected_success, and so is the parent's TIOCSTI on the passed FD.

TIOCSTI checks the capabilities of the caller, not those of the process
that opened the tty, so the parent always succeeds. Where the child has
dropped its privileges and is expected to fail, the parent's check fails
instead:

  # tty_tiocsti_test.c:620:test:Expected result (0) == variant->expected_success (-5)
  # tty_tiocsti_test.c:622:test:FD passing: expected error -5, got 0
  ...
  # FAILED: 13 / 16 tests passed.

fdpass_pty_restricted_nocap, fdpass_nopty_permissive_nocap and
fdpass_nopty_restricted_nocap have failed like this since the test was
added in v6.19. The FD passing tests are skipped without CAP_SYS_ADMIN,
so these three fail whenever they run.

Checking the opener's credentials instead was proposed together with
the first version of this test, and the reviewers did not see the
current behaviour as a problem: a process with CAP_SYS_ADMIN is
responsible for what it does with the FDs it accepts.

Expect the parent's TIOCSTI to succeed, and drop the log message that
calls this a security concern.

Fixes: 7553f5173ec3 ("selftests/tty: add TIOCSTI test suite")
Link: https://lore.kernel.org/all/2025062327-shady-broadcast-237d@gregkh/
Link: https://lore.kernel.org/all/20250624.3bb75890f0b0@gnoack.org/
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested under virtme-ng as root with KASAN/lockdep kernels, next-20261020
    and next-20260930, two runs each:
    
      before: pass:13 fail:3 (the three fdpass_*_nocap variants above)
      after:  pass:16 fail:0
    
    An LLM was used to help with this patch.

 tools/testing/selftests/tty/tty_tiocsti_test.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/tty/tty_tiocsti_test.c b/tools/testing/selftests/tty/tty_tiocsti_test.c
index 5e767e6cb3ef..411fb459cbce 100644
--- a/tools/testing/selftests/tty/tty_tiocsti_test.c
+++ b/tools/testing/selftests/tty/tty_tiocsti_test.c
@@ -610,17 +610,14 @@ TEST_F(tiocsti, test)
 		/* SECURITY TEST: Try TIOCSTI with FD opened by child */
 		int result = test_tiocsti_injection(_metadata, received_fd);
 
-		/* Log security concern if demonstrated */
-		if (result == 0 && !variant->requires_cap) {
-			TH_LOG("*** SECURITY CONCERN DEMONSTRATED ***");
-			TH_LOG("Privileged parent can use TIOCSTI on FD from unprivileged child");
-			TH_LOG("This shows current process credentials are used, not opener credentials");
-		}
-
-		EXPECT_EQ(result, variant->expected_success)
+		/*
+		 * TIOCSTI checks the capabilities of the caller, not those of
+		 * the process that opened the tty, so the privileged parent
+		 * succeeds even where the child failed.
+		 */
+		EXPECT_EQ(result, 0)
 		{
-			TH_LOG("FD passing: expected error %d, got %d",
-			       variant->expected_success, result);
+			TH_LOG("FD passing: expected success, got %d", result);
 		}
 
 		/* Signal child completion */

base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
-- 
2.56.0

