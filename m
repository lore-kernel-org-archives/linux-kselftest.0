Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13E503BD1
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057111; cv=none; b=aebJYh/Rou0p4uaQT/xvzyarw2hu/CjnaOr2u5D1F79xo6wE4rHQPa+zCBBmkWwPWkPfYTY4i0ay8urfOOrHtE8C07ro/OljlCVPxMRxuRJ/Pge5SPZQoF9lgTS2u/3nxHcU3ZXVjJ8OyxEwVO9BMOO2rVRYTHkPwhObz7dj3TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057111; c=relaxed/simple;
	bh=xGSW1HB9xuLPOxOviM6j5dkn3NfHltnvNZ07I548HfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZ7juTAnMnURawGxcaABUoTPFqlSsTNhwbArjJEnHTlbGb24VCWRTXiEktFvj0jB4kYdSH7Lgp9yK7pfVKGrKdt8akzHJsJqJ8IUykJ3M5Z4+2D8qG8lGyvWvYtPnCrIFvGOn2HRnJu55c2rlUUtw9MfFOJasSgFZjwHdrW4L8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Gj40T3WJ; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Gj40T3WJ"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9906034086cso539932241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057105; x=1792661905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QvPtbhrFSm5FoNNWvwj4y3Q4nd03scqDRxnUx7itX/Q=;
        b=Gj40T3WJrU4PlZ0H6cGKc5KPdahOaeRHUgFJjxqL6gPGDKHpXBUAUxN+lOaCkuGIPF
         EcpAjnOpeqE8K9q7B4AeQ2eSThX9+grNnSlvq+abqk2e64aSmtHhE+Z57sucXn68K99Z
         vwYApeooPhk9TyeVXKEIzYiR41+2iZq6qs4irRzddLGssr4U0PYnDipLN0PFqYY75CQU
         kGRKLB30xfbnm8IZaJFP6ky9zS7DaLWl4zKTnOlYaV4/pqujA1fLBFAWlwY+DoNwZgm7
         PIDc+xwV9gOAG47506FO/zqJG1UhpvE94+E/iwpb8y5vRKZSeluxzsMY2BKr97iOwgQq
         XG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057105; x=1792661905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvPtbhrFSm5FoNNWvwj4y3Q4nd03scqDRxnUx7itX/Q=;
        b=OxyWDssVRoqr5WEJ+0TxELjR47iZMFf2fVrd0vACa2MfAuae3PC5tqw4eSo0GfQ5Y8
         0S12mAL/0fnlVedr7SeQ0hIGSCXWjXQRjIcKeha5wIE4iR1O3KmvvJfl/QND186WUKqT
         6iG2dq3jP5ib5C1jBVsDBJtRj/XuU19jpCP5bxPXipnxJGQ9GKF4PsQ8+f1MYxJLTx+B
         nrMRKVyODVQWgc3sRIrdxuKHsRszwmBnjzW+BLuMK5dAyD74Lss4JXuXkctEn7sMbPAK
         sqEAZXSmMsb4nsvvLL4ko+2LWZmFEGYykCy09FaivhlGoMS7VwU+QwYb9VcoBXUfJmbk
         XPsQ==
X-Gm-Message-State: AFq9FYK3CgkmwA2SrGxkfSMZGdeQ8pzqXGQaRKkWA1XiMVCoJ2fIOmJM
	wo5iH6AlzQhu6499k1sLUAD6FOAf0j6sivNSqAD6vCNNGFIK30BS5pehYQ0JuNSlNSIdUu7ox3a
	ugJLM
X-Gm-Gg: AYBFou0llM2WhqsrzOH4tO/Iol8wBi8cZgDMJL2R8zpFiOLmVA74qkFvzD9Aj/mKPHc
	Kd45CFlvIr9p5RIKRyYwv7gp1l3u0TnfOwooygq/zTpVNdNPi9e59btk2xZ99QRMwItXX6yG0T6
	YhwTnzQKTnA0r/yWm9RfWUvbmQqCIRNnxcBMVwo8RmxaDf7hUDiR7mzQvy+5qbnr3RBJtjZlACP
	mcSrqGzurEHVBaFdMVg8q4Q3i7MK0keBEVrvqJJjZ/g2i1KoMed0w9VlHfR5B1QLlzoEbMKgHPt
	+VgPoUfiG+oj6SdJYY/19rgPOOjw/MHsAmbZT7Iqmn5ZO4ALfxHpZ8RFuHnzuNmuNy5Hz+b7qn2
	VCHYSsx1hsjbtZF87hWs7I2xp69uPlA1hVN8oyE6MoBUMJAOPcleJ4luauGil5Njvcip8wqe2ab
	S/LR6841zzh9GuP40Ac26lOg6j6/iI/0rVkn2aCZO07P8RN0taFTDx5iDoFn/K3xdfaHyZvLE5r
	I9KsQnDOYNr40F+U/PEHNmONLIM5F7Y1NxYUqDri1Dp3ku0BFiRwCEr3gWPpEWpIhVfj1cbCQbb
	TMzV+3q77b3VdOi/QTnCX8x+aIOoi0E=
X-Received: by 2002:a05:6102:c07:b0:7c3:873c:b3fa with SMTP id ada2fe7eead31-7cb36885ff2mr3914174137.4.1792057105254;
        Thu, 15 Oct 2026 02:38:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:24 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v1 2/7] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Thu, 15 Oct 2026 05:38:11 -0400
Message-ID: <20261015093816.2438942-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide luo_session_freeze() in the liveupdate test library and add unit
tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
tests verify that an outgoing session with preserved files can be frozen
early, that freezing an already frozen session returns -EBUSY, and that
attempting to preserve an additional file descriptor into a frozen session
fails with -EBUSY.

Also freeze the test session early in luo_kexec_simple.c to exercise
LIVEUPDATE_SESSION_FREEZE across a kexec reboot.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++++
 .../testing/selftests/liveupdate/liveupdate.c | 40 +++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  5 +++
 4 files changed, 56 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed083646..15a7db3a6b3e8 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,7 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 int luo_get_session_name(int session_fd, char *name, size_t name_len);
+int luo_session_freeze(int session_fd);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c2815..6315746ff08f8 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -198,6 +198,16 @@ int luo_session_finish(int session_fd)
 	return 0;
 }
 
+int luo_session_freeze(int session_fd)
+{
+	struct liveupdate_session_freeze arg = { .size = sizeof(arg) };
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
 void create_state_file(int luo_fd, const char *session_name, int token,
 		       int next_stage)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534f..9de068f31c3ec 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,44 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies that an outgoing session can be frozen early via
+ * LIVEUPDATE_SESSION_FREEZE, that subsequent freeze attempts return -EBUSY,
+ * and that attempting to preserve an additional file descriptor into a frozen
+ * session fails with -EBUSY.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze-test");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Freeze the session early */
+	ASSERT_EQ(luo_session_freeze(session_fd), 0);
+
+	/* Subsequent freeze attempt on an already frozen session must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd), -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
index 786ac93b9ae38..ab108c7f1d855 100644
--- a/tools/testing/selftests/liveupdate/luo_kexec_simple.c
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -40,6 +40,11 @@ static void run_stage_1(int luo_fd)
 			  TEST_MEMFD_TOKEN);
 	}
 
+	ksft_print_msg("[STAGE 1] Freezing session '%s' early...\n",
+		       TEST_SESSION_NAME);
+	if (luo_session_freeze(session_fd) < 0)
+		fail_exit("luo_session_freeze for '%s'", TEST_SESSION_NAME);
+
 	close(luo_fd);
 	daemonize_and_wait();
 }
-- 
2.56.0.385.gd3acb90ef8-goog

