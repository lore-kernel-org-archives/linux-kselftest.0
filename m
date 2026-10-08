Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02095392819
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469649; cv=none; b=rRWn350bvWd4Yl4BUOaNEtxZsn836DhKFXMxZgipnYyDdjMVtC1t5G3c4MyqVUtcYe+QKtbmmGHsEfGqnVc+szTB7eVlmI41cbsfZz0Q9Hi/FxfSmKXik4nY4joboVO23/bircQmvEFMazymmggrZUxCkX7HTLPzeTJ3JX5592A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469649; c=relaxed/simple;
	bh=locUOrrUBXD+IkEnjF+pPczV2ZY8/LR/N/JNMLQi/Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rtH7On0krYKL2xspiTfuIp7u8JHI0ekL0YoPhhKBJRAJSgDMgjZtcNcBmOiL7GAbV6hHUbtEkkChNyIYHdd88NId0BxaZdGugG6RTV2BOLenY6eZD3B4AEf7GU92V2JtMSUpwnK82IjKbHbew0mHxvcdKPsOy+fUxFT3a1iUrgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7j/DWRc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7j/DWRc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4580313f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469645; x=1792074445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1T3CR3Az3SHwtFPkIUQDc5fFYC6Qe7UYCDR3mM1BBgY=;
        b=J7j/DWRc2hP1HPxrXMHUsDrZ7BOTIuOIXr13KqQ+sZ6CTkMNMuB8akrHPWsnfe75BH
         FzuJU9ccSV+Vb0HAzRtdRVjQLdy2NnorMu//6QxWYp9Qv6Yl8OqcWUSwN0acqSBFR7jw
         IaFv9f8z+HK0YdsA38m1yBxV5yS81O0YpHYnng3UJqQHZmguHIwrcHjv3yiUvZojshqK
         D0Po5Sl1UE8S/pn07zt3e0ERjmdWTGUm2c3auGVf5OU1fQa0TxM1YrtNQ0sfq1KPI7Zt
         BLR0XSspWwmajSFmmhAWKlsZl7IP0WNxtEkdXK1w3nUzobTCCiF8gcf8z4vAApD5Gs6P
         fqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469645; x=1792074445;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1T3CR3Az3SHwtFPkIUQDc5fFYC6Qe7UYCDR3mM1BBgY=;
        b=e0+joZC/utleu9wRgvjRbg+xdiuMl8QTIqwXlIiCHdLtHWwtJURmSeRrOHQArDqzev
         1UASaOz8hW/IlqNxi0lCUXjDmQP2H20hryEdiECdA5x4uWD4zWGowZpMYpGiPGeNe/XH
         whe+9KYvAhe6RoVxvxQrUs1C4qMY6WtYbg0qRQENZiN6gQxiCWu+d3AKRzTAq///rcG2
         v9/76CJEYDRWUWrF7s7igeKK/FbGvikTFbs7gYPNivxR3LKc5Gz998FwhVgHOmEVqgUd
         NWN8OxhIcjdnDSULVGPx1fiRTf3YaECOhoWl9ZNEJolhWShyLs4aHtW9Tfew+3jpwdaW
         n0rw==
X-Forwarded-Encrypted: i=1; AKwUvBxA2kXbwl8j+g/IuvfIv8opPwc2Ofy7qmo5JEV1oT0I7JtkvbzF/jNUbvvq5dsEzXrObOkQivzmHHpPTH7vvdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBQQU1kezUSj3Y7AmsvbGYGKFN8VTQizO4nSXjE3SlWuWGzOuA
	8u1sF7VIYfw1Prz7e4MdgivkMgCG76w6SmkTuQESTW9U3fdV4//BpVrxRSTgLmPE
X-Gm-Gg: AYBFou01JQJWCHumvzzjJVsgfDjo4FhA0dJaM/jfhBEj4tok4U9IyQop1MUAnZwTze3
	xw6mpkJRGIjL536CtJsImTLg9co8Dl0imodqoQJJHa/JnBc8Q08FPFOWjQuxwmz8wnUqB1bfadv
	H9w4oPQB3o90FLH3Yeq45xpFMToY/7QgC0COMBfmue88aTRZgrc4OwXBPi17ri5bL0SgPzZ1NOk
	19f33bfLtaJ2/G5gXXWmlSR0464PcuehodnjxbGmyFcrkVqNPWOos1iTxuFsAJKScbKz0Ho0G+f
	LWi+mjpz/HkZ5b5oBQdT1LYgH3bg+075FnTP3l/z+ZC9n9T8zJaenx0mDFunG6qukFSfm314K+I
	n+Wh4lNWQEDuqfKa4/a7VRNMJ1B8jPgdGyzRP8pPF9MNgwQhjkRsX4tFKkyRc2VXvIibxEhLuON
	rJ8NyRymkj9ABn8fJSoEsVMZkZPIzXnbkNi9LWrHR5QFLvyMgJL0EYHMuRdZpWa1e3w1UpCvaII
	vtBWKUVQZ1YboF0Yw8pcSxmlV+96qdoaQ==
X-Received: by 2002:a05:6000:4284:b0:48b:910:35c3 with SMTP id ffacd0b85a97d-48c7289cb70mr9367096f8f.35.1791469644945;
        Thu, 08 Oct 2026 07:27:24 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f3f7sm11321874f8f.32.2026.10.08.07.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:24 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/27] selftests/landlock: Fix SIGURG handler setup in scoped_signal_test
Date: Thu,  8 Oct 2026 16:25:46 +0200
Message-ID: <20261008142604.39107-19-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop SA_SIGINFO, and rename the function to setup_sigurg_handler()
without the parameter.

* Drop the SA_SIGINFO flag: This flag implies that we use the
  three-argument sa_sigaction signal handlers, which is not the case
  here. (c.f. sigaction(2))
* Remove the "int signal" argument and rename the function:
  The function was already specific to SIGURG and this is better
  communicated through a different name.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 .../selftests/landlock/scoped_signal_test.c        | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 0f88a6af9c72..66fec3822812 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -392,7 +392,7 @@ static void handle_sigurg(int sig)
 		signal_received = -1;
 }
 
-static int setup_signal_handler(int signal)
+static int setup_sigurg_handler(void)
 {
 	struct sigaction sa = {
 		.sa_handler = handle_sigurg,
@@ -401,7 +401,7 @@ static int setup_signal_handler(int signal)
 	if (sigemptyset(&sa.sa_mask))
 		return -1;
 
-	sa.sa_flags = SA_SIGINFO | SA_RESTART;
+	sa.sa_flags = SA_RESTART;
 	return sigaction(SIGURG, &sa, NULL);
 }
 
@@ -506,7 +506,7 @@ TEST_F(fown, sigurg_socket)
 		EXPECT_EQ(0, close(pipe_parent[1]));
 		EXPECT_EQ(0, close(pipe_child[0]));
 
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		client_socket = socket(AF_UNIX, SOCK_STREAM, 0);
 		ASSERT_LE(0, client_socket);
 
@@ -612,7 +612,7 @@ TEST(sigio_to_pgid_members)
 	ASSERT_EQ(0, setpgid(0, 0));
 
 	/* The non-sandboxed parent is the protected (out-of-domain) target. */
-	ASSERT_EQ(0, setup_signal_handler(SIGURG));
+	ASSERT_EQ(0, setup_sigurg_handler());
 	signal_received = 0;
 
 	ASSERT_EQ(0, pipe2(trigger, O_CLOEXEC));
@@ -629,7 +629,7 @@ TEST(sigio_to_pgid_members)
 		EXPECT_EQ(0, close(sync_child[0]));
 
 		/* In-domain positive control: the child must be signaled. */
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		signal_received = 0;
 
 		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
@@ -737,7 +737,7 @@ TEST(sigio_to_pgid_self)
 	ASSERT_EQ(0, setpgid(0, 0));
 
 	/* The non-sandboxed thread-group leader is the SIGIO target. */
-	ASSERT_EQ(0, setup_signal_handler(SIGURG));
+	ASSERT_EQ(0, setup_sigurg_handler());
 	signal_received = 0;
 
 	ASSERT_EQ(0, pipe2(trigger, O_CLOEXEC));
@@ -1062,7 +1062,7 @@ TEST_F(trace_fown, deny_scope_fown)
 		EXPECT_EQ(0, close(pipe_parent[1]));
 		EXPECT_EQ(0, close(pipe_child[0]));
 
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		client_socket = socket(AF_UNIX, SOCK_STREAM, 0);
 		ASSERT_LE(0, client_socket);
 
-- 
2.56.0

