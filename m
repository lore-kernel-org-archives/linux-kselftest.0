Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826577;
	b=t357OHko7lAwSy5tADc78chL44hYD/p2QFuaKzUIERlNqaOKj4hEvq8S/JKIaRXdZhuH
	 QWfnkgrmM/4QobE3CXF3Ml9Mw9Sdv3LYKOAPKrGegigLT2mkOPFcHHbxBLExjn8g3wM0S
	 r5bx0q9nzJwA5aW9IcuwGOea7hThinN34nXHXVAjW6tnG9tcUFNGhBQGZKs2wIYOX//TF
	 kKbMRXMB8brcPOlmaNDrQ9eaM8qAaRmlIstpMZLNUnMR909nFOMWwgdDbl1Ytod/+WT9I
	 aZ6A47euvX/NmE7e53qeV6n0+2dxRMqRS2hw4lzaQP4jC727Vf0SEtlsyy65P+k/xWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
	b=1HL/LBTq4q8Um20TGstzLmTRG3gPv68BE9oc89hkY22oG7DMgCZG1/3E9wM2dFuUkIkD
	 juAgJr0EX3/Vn/4VMhtyWbhKJ+34lJBIQn9Yjcb1nmyHw2yhcDTPNCtWN4oUN5L3mPO9p
	 pJLXmVqvxprHvmqmIUd5TPIKvmHeXJ+GuE1jnfDUH9SAPjxmvOxtDlaisG22/+TTnTCur
	 ht1GDJPJBZ40cEOPmJp5rcvFM2+zi06YC//rDPYLHWkyLLmjyU/d5Wk+zIReOd4KhLLtI
	 feovoLpyvqkEDg1qYpELiu4r2oqTck/seKERUDQhNzPDR1Oti10ZUtReTkLO0vK5B/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3CiICk1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6BD607E916
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6BD607E916
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3CiICk1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4910b863b84so10495f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826575; x=1794431375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
        b=D3CiICk1IU3LYOkkUsP513zcLWLMA5i0GRg6LkkHP7BB1EcQ9D0tGOHgvlqQic9CyG
         V9De65zZ6pPKCjXt8CLX8huiMGmVM8Inj2UUFzrZY0nCvugX/vvz5/2JWSXbVIrBdXTU
         Re0JRKL42TnXy9iCrvGCJI5MoqYTj730qvHIH19f9+ROUvad/DUzXDNEgITCVKtx2Qp+
         oYXgOh34bDIWWKeKUvRqnI7wBV449fL2F+7jYT9no/Z00SI4itNxQLWOv/DNusGaCG45
         /SHfXt9/FBavBlhJuvypvpJYwYR0aHSalFMIqYLv5/ghs3VUk1YWys0LyB9z38PfEY45
         JGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826575; x=1794431375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
        b=VEXyfCAM1V6idwhljxY9xJelPeqPuzgjOMhk6yo+1bfpZaoXFYsswOdthCvfwMhVEd
         Y2bMJ+e18E8/JjMnVjuxYFzsKvasG3nCuVMrZPAq1l+1YXOUj5sB6QjXRxWHbOlq2BZz
         wbphaBrhcHY0IQ+mDpu3a2MBqc/8E0eKwj68wjNfPRmj6uhM/0o0SB02SB3aypu8o6SQ
         DN8N8CFoR2PoF5QCm/gB2RxMrTwsyjfKOr/FFEWXGzIA1eyebJUOjcGrD0MD/3TOzlos
         tSStMXKK0DWAXUAmfyKv3HkrNQ8BCjReLOxmzbxMR8ZGmLZA2UeUZMUDxvMuVf7K5Ob2
         YvzA==
X-Forwarded-Encrypted: i=1; AKwUvByikPgpwn4q1YbZvWJKm9fCkkhHdebzUNKKjYswbi9Hn17JdG71qQBAA4ymEJyGeWNCP7zkepP3WMrJPP3Ltd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z90QFXr6PTmDbfL3Uy0C1z99mV+bByT0X/dPj5c5JjL5XoQsDQn
	+cP8raaVLK+Etr+LVGoYZ7jKtjos6ruB5CCsPNA/4q/A8rMj3TG/8NDA
X-Gm-Gg: AYBFou2GbvLd+OONxy5LsDyDYYhlTX3jFGW+KqVeZR/efcwj6G6StAxIDjfUe56DLg3
	UyNRglysiQLnCImA0ggol7ynVBfco2xnRDX1T1l4P++wu2ULQSqnTiY/IUXKwou0Uon6luf0zsi
	MIcRGlOcxNeqrWYNmdNyxs7PNkZ0kaB/NEECRIhVWtP62mctLYecCmJx9H7jFHKLQUCNqdy7d7T
	lBqd9QTfFx7uyHjFQ6sMYZ5sOvWJL5+SWmKdt5gHpJUu1PCWOgJqPqLMXXeJIWqEmOGOTREt108
	BRe8thoVLHgV/VfXcdv3xOHP55flEYpGVdEY5qX0Qro0OcX+FvUdx2N3UrEolBMeEG0ZOsFUMvz
	6C9XhBppsZHxYtrzC3vI2/k5O14Tk+3ppkHujgLB5Qr72TSzbkOiud9X5hiyl1h2PeyN5jLY7C5
	+rWJ7q1rNGQq+DUne+o0uhE/DM8hIAa5uNT5PaX2OtSHckueVabZ7FwUE0Ltq+stGUBCjIi1qWN
	HoXDXal6PYC5BkAj9+bvp5r6giZnnbw6Gk3v6pkHpBdu7T2Zg0VTtTOn2ys+fkZmygWZRYEYL+O
	JB/NYuXUmWMtS5QC/8LPwRhvmx4h7SsgMYeeBor1cEqMKo2gYgUSfA==
X-Received: by 2002:a05:600c:46cf:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b55e07e569mr10214435e9.15.1793826575088;
        Wed, 04 Nov 2026 13:09:35 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm77710365e9.4.2026.11.04.13.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:34 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:03 +0100
Subject: [PATCH v2 17/27] selftests/landlock: Fix SIGURG handler setup in
 scoped_signal_test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-17-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Drop SA_SIGINFO, and rename the function to setup_sigurg_handler()
without the parameter.

* Drop the SA_SIGINFO flag: This flag implies that we use the
  three-argument sa_sigaction signal handlers, which is not the case
  here. (c.f. sigaction(2))
* Remove the "int signal" argument and rename the function:
  The function was already specific to SIGURG and this is better
  communicated through a different name.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/scoped_signal_test.c | 14 +++++++-------
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

