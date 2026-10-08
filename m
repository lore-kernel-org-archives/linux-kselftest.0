Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F638F226
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469631; cv=none; b=JZfd3JkU6qTCFqQ7nI3YvjreBuzVqtcaO0hbEFMcsV00FLXTh4YllljRFjAcym7pzcBxlozgL5bKJGyxn45KUKZCGhli4mEJAUW4lgR6/UGt3DaYzFcIuRyAgBr+Z20l1qr+VXwGaP1CcLFDKb3qp2D33iLzvz6DJToC8fyLRg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469631; c=relaxed/simple;
	bh=01HTrhvK/1TXl03//5om6xud88p7SoZHUhimsY2uvrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgo2f3qd0NxItcoR+ApjYY7hayXQ+SB3mgYpv1ww2q/rhpQjdhXCGbrQ6U0/+iQIsYRF4ISbh0V1O9xL0PUh+kawH77pD4PUxvAB49m/Zv2bloTHDRumRn4df9jKwMvtn4DE3FUd9/xg7GZbQadlppMSkWVcegO6ggHCkbuvr3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEQJ7UER; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEQJ7UER"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2475943f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469628; x=1792074428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EipPppNs9mR4uW/Db3aGPTGSZC3puZGsdYHjORuTNCw=;
        b=NEQJ7UER/HdsTZ1yjjBbPEqG2n1LW2BuNx0FQorjxGAdWFxY9BvywdmEo4/4q+5X2S
         HFrJaKn39537I9hdVrbWdHd4AoIaoAiydGCMprsy2hUTO4kZGoZ8HEqajfx0L0CzUM98
         ZgY0qKIBlR3CcwOGoNh1sFSzGyzbvbcKTSK3Ptzfpn0nBGF2eOcWSFKebKpmoB+Kti+3
         fZz2OozyIqj6Pdjab+l/qP6t5Bw1DBwzZntZZKHKLZH46YEv2IkPNwW+a/9DkkLCpUDq
         FHXI841Y9tceaATQTwvCoe7DP04F9gJ3W3foSamcuZg1MEQ46bGai9R5oIOo63zyIyls
         OJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469628; x=1792074428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EipPppNs9mR4uW/Db3aGPTGSZC3puZGsdYHjORuTNCw=;
        b=UcvNtTZfz3vfeReI7qbh1SzsZ1kdedK75F27WTl5BDi0O5sCG09cNfYWWVqCgjBbQU
         zs//1sy1772vCOxVMBKWgfSJziy7q4iIWG14lnIwXvQZtLUrTwMwlzYFddHbuSdk/6ST
         62jV9ayfLYta/RKblaB3DBQphlurqIK6fMl6D6Gh2EF1fVLjjLN6jCQPABgdUoCuENnh
         Au+x+SFTFfdCPVEL7jko5AWDPuLjM29PnVFOVE4buTIEkpdmnO3UX7Bs81bPsP89pEpy
         /yAJE6WWE0rjnzwXUliNlsGlH7dVZpUH+m923t+6N1NazlBMEao+R1QcMh9dxWrN1+kT
         KGIw==
X-Forwarded-Encrypted: i=1; AKwUvBxLw+xvviRc5V1aoEFONruS2IGzNS5tDFhqWhbtH9ThTlNGQhRPhAQLd2MlJBz8hc1dzfv682ev1GIyqytDUJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF1QBWnX/qV6yd5jyS3ZxQrNO4dGBQBPF3nKq9/JT+NmnLhfsP
	CQfC/aPEpShyJ1ctHC/2y+RFuW9lcORkpSzE5EkxQPRfqARY3ksSWSQP
X-Gm-Gg: AYBFou3+0qisCMzxkMEXlVqo0R8hjncs7IcXUeZKzf3jX+p/FNkh/jXbNlH15HAMl/+
	wKVBn9gijQJmnmDDvzSipgbPKvtxAMqOIxCLRIxh0lcjmRh8CyjuYEGFxaDUs6DtlUODxKnxQzZ
	BW+ziOE+Vzci9vPiIK3vpH3EEF7y1BVxXmWTK1ZXzg/LqfLw65jeX6YehH4YxZ7Bm2CAcNLufy0
	YjDC+71hEPbQ4q72CXERTmDQObeDY2Gl26xDqyqFIXinE4aT76C7nblI97M0/+Um3l7Y1D2kD4o
	gJOibLmNngBxbJrwFFDRKBucMpmTHG9vn7zegLw2uVdw2ee4E56WcW/SASP3f/ueRSL00UotXcl
	uC5vnrtQDgMKc9KW8IlZzdL41intErF96wiXLu1LdhkajezEIrMWlBN3+7KSoiMCYvDR8tZS9qH
	21A8EFk8t9wkmflditMDRsNynbw3ltwIYDBB3zvix/0hxzfj7mYB8trzzyNzLSVEBcM7iCn80P/
	8uC/TKk1eDWUNQIcV44HI+Rdf5x3vnFJg==
X-Received: by 2002:a05:6000:2506:b0:48c:4c35:3ab5 with SMTP id ffacd0b85a97d-48c7277f49dmr11077583f8f.18.1791469627740;
        Thu, 08 Oct 2026 07:27:07 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm13328687f8f.53.2026.10.08.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:07 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/27] selftests/landlock: Assert audit initialization in fixture setups
Date: Thu,  8 Oct 2026 16:25:39 +0200
Message-ID: <20261008142604.39107-12-gnoack3000@gmail.com>
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

The audit fixtures check the result of audit_init_with_exe_filter() and
audit_init() with EXPECT_LE() and continue with a negative audit FD
when the initialization fails, e.g. when auditd holds the audit socket.
Every following audit check then fails with a less useful message.

Use ASSERT_*() for the audit FD and for the audit_exec filter
initialization, whose result is used by the following calls.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c             | 8 ++++----
 tools/testing/selftests/landlock/fs_test.c                | 6 +++---
 tools/testing/selftests/landlock/net_test.c               | 2 +-
 tools/testing/selftests/landlock/ptrace_test.c            | 2 +-
 .../selftests/landlock/scoped_abstract_unix_test.c        | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 81cb31aa32ad..63b1b2a04eee 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -49,7 +49,7 @@ FIXTURE_SETUP(audit)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -652,7 +652,7 @@ FIXTURE_SETUP(audit_flags)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -841,7 +841,7 @@ FIXTURE_SETUP(audit_exec)
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	self->audit_fd = audit_init();
-	EXPECT_LE(0, self->audit_fd)
+	ASSERT_LE(0, self->audit_fd)
 	{
 		const char *error_msg;
 
@@ -854,7 +854,7 @@ FIXTURE_SETUP(audit_exec)
 	}
 
 	/* Applies test filter for the bin_wait_pipe_sandbox program. */
-	EXPECT_EQ(0, audit_init_filter_exe(&self->audit_filter,
+	ASSERT_EQ(0, audit_init_filter_exe(&self->audit_filter,
 					   bin_wait_pipe_sandbox));
 	EXPECT_EQ(0, audit_filter_exe(self->audit_fd, &self->audit_filter,
 				      AUDIT_ADD_RULE));
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 9884ce9917db..779a7bf477a9 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7508,7 +7508,7 @@ FIXTURE_SETUP(audit_layout1)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	disable_caps(_metadata);
 }
 
@@ -8031,7 +8031,7 @@ FIXTURE_SETUP(audit_quiet_layout1)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	if (getenv("DEBUG_QUIET_TESTS"))
@@ -9608,7 +9608,7 @@ FIXTURE_SETUP(audit_quiet_rename)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 
 	if (getenv("DEBUG_QUIET_TESTS"))
diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
index 50b637354b51..c1b6e288c965 100644
--- a/tools/testing/selftests/landlock/net_test.c
+++ b/tools/testing/selftests/landlock/net_test.c
@@ -2957,7 +2957,7 @@ FIXTURE_SETUP(audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	disable_caps(_metadata);
 };
 
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index e0e7f95e889b..10371c1830ad 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -323,7 +323,7 @@ FIXTURE_SETUP(audit)
 	disable_caps(_metadata);
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	clear_cap(_metadata, CAP_AUDIT_CONTROL);
 }
 
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index e006dba61652..5e8224623780 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -288,7 +288,7 @@ FIXTURE_SETUP(scoped_audit)
 
 	set_cap(_metadata, CAP_AUDIT_CONTROL);
 	self->audit_fd = audit_init_with_exe_filter(&self->audit_filter);
-	EXPECT_LE(0, self->audit_fd);
+	ASSERT_LE(0, self->audit_fd);
 	drop_caps(_metadata);
 }
 
-- 
2.56.0

