Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037336;
	b=ttU+d2JVEZ/2CB8ec11D1oDIMsMKXO11V7tiBam2sVeLDHTRN9DVaguNfssWX5hSMWMu
	 Q942ZzuCAOjr/kYf0tsY26VUfxH0mrs++arxyPXT0ivz5/hsGQREOU++Z1+V5uRz2onSK
	 qRgJCqTWpXEs4bEvv1y8SdGMrbSZTcCZ/6evTSO4nJRfY0hJHSFZMTmYC6GGTEqh205sO
	 HUaoI94hjviRmxGwpb1X1kFZN3eyk0eIylakZVYSwEEtb5rdPuCSpt34c4XLaxFKwuVn6
	 XzHfgjQKMB+cwo8+ycFL3yDfj+zCPlBiM58yMJUXBNB0vEW0Amb3bxzB9bFBJ45z02A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
	b=HFVfQJhnb/JI2tY3ADySUNpxk7WtSWu6sCKGWbAAsHQI0ENJLsYQphXHQk8SIsyb70DI
	 Kg1mjm6k0WHO2Nha8gkvlE7/VXIo4qDWlrO8cPM9CQ6U+aTIcNGWzFuUvgq4aRzYgL8/q
	 U+zfKyKe9gKPU+iIPzaE0U5oEotBkqwix3rQj9Ct6abWtLUmxbT8ROKHf67HB+OL67OlD
	 2Kdqhk9Q/JOdVHSrFCNo/kXY6tBKlOVu+C4EisPu5lXC8AAEoc6WEfel0Wlc7F12jPEKE
	 CloOvjqHWCVm0bARfbFrhfkSQLd393ALO4xoGG2n8gxFU+IN76jnEAhR+7LXr8LQiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DOjwVFMD;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7D606A33D
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C7D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DOjwVFMD
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d6554d96d3so829364137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037334; x=1795642134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
        b=DOjwVFMDfcMo57qcwPQexgRTtJ0WzI9qCReEasXVrgqEWpoptSAZ8EiO6SY+KBhmSt
         /mH9YngiZeYLZlw1qcnMhSZ8DkTcEtDddhbQxHDeIB+R63DtLzHMTLeWVryjDdCLTHbz
         AWTTlvc+CjIYNgAUi6mw52l5zJ5aBZheMgFYPh2Hk51rrE74237uB4YnPOTy0AmYFZan
         B8bqcVH8j2nn+3mkI9X0uVPSXrMWlXfdTAQrGAI8bQxPgUs8uZbFLD5gYpDFkjSrk5az
         4kMLST8/D7yE6ut+5k8xblahHCDXf2wCzdWyy4eQd+8O/HTk9c2shtP2RRDIIea/7qxF
         /xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037334; x=1795642134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
        b=tsveWRKnoYXk/1fnGrApuy+9A3MFbrho82TgZvfGrbCkeHA1h8he7XoDrdxxmohOtn
         7TLq2mMw8bCtKjXVFwnWzitqY6CQuTfKdburAkxFtq0rQBLyLbNCX458HufmOXlBmgaP
         8as/RrS38qWl5xJIgJpgzKBvQuu8q/v5ViRDX+3S5dQ45cdMPWqDUi9gG1dzmeakvC3O
         NPTL4sFXdtSe8tIv7uQXQr67wxloclzpcoWwhTLU0oxCq8Oy4nvwCciZvvXPh4fdzuQ+
         Triid+novmJoXEbp8xAUgmpc6FTNf+xqT5Bb311YLeY4TPiazo8A4E6jw5QYtDUroozG
         MasA==
X-Gm-Message-State: APuU4Z9OKFP/fKEU3Ydtp3mB/B2q5eY1T5atVWdzA+RgLh+ccLKih6OT
	ebRQwWayUl/qAoqUs0sLRmBFX36DXAnWz/HaXQkxpGmhF4rfSPFxRHWDxa48iKPUoh1GXF0rhCD
	GryER
X-Gm-Gg: AYBFou3R4CutCa57RQoL2ZI3oK73NyOvH5GhA5iYkFWBoPdINtRGd9d9aEvSJdPQeu3
	tnXypVYCaJA1P5EfVKG1DKvCQpigBKe8JY0tPmVMdeZEh183RQfxwJy7pDKVnI+ndwE6SULS110
	Lz3/HPmJQ31418Nzk7u+OnAdiXwI+Nd+wKYSHxMUJ76VK/mQKSeXJsCurtbAzRvfaSQZfeH/8ee
	UguRgIupmgape7oP7pUJdPrqWafLAN9dktUeutp5cya9CgYH6FQvKDWZVgyf5ZpnzRxEN9cv/FC
	yj/nN6+T7KNlpJYl15TH5EfY5Z4QKOMAFvjhP+GNoXq7rzehbs2SDEbHIpc1fBydHL13tIEr6Wn
	1Kj2zL01i/gIDd+06WocxXqRFSHB3gcbrt87PWgMxFeyrjRctTY9qOye7mf9jhvahEvl3mdBkxA
	ahpWt5DuT8nnssrWLZbbgzIOGab4TFFp2IHKHxD3ryo8pZXbYL/8JYYPajWk1UjrBpjayvTYyQd
	OPvLMz0fGTLkQsKlHxkk0ACQrTziCpv4hfTyKair+a9ktFLhkR8GWhXlui4rclLWulVq1P+U24F
	qeMK6sAa5LO9ZQjIQl+yd2qakt8vZWTyOVVzqnajTfSTkroFVa37hH/ucUmW4HN6w38hq7YrpG1
	OzwUSAxDP0RBsT1s9uYDgwqxgctH3wjCRsZJzB+8G8sRvFWXQUAWzssmlFW7ogJBTwdCK4PySyQ
	==
X-Received: by 2002:a05:6102:4412:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d6ba3e7857mr1999245137.11.1795037334470;
        Wed, 18 Nov 2026 13:28:54 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:54 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 6/7] selftests: liveupdate: Add unit tests for LIVEUPDATE_SESSION_FREEZE
Date: Wed, 18 Nov 2026 16:28:41 -0500
Message-ID: <20261118212845.2855249-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
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

Add a luo_session_freeze() helper and unit tests in liveupdate.c for
LIVEUPDATE_SESSION_FREEZE. Verify negative cases (unsupported flags,
double freeze, and preserving files after freeze), that closing a
frozen uncommitted session unfreezes and returns resources, and that
closing a committed session retains LUO ownership of the session and
its preserved files.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |   1 +
 .../selftests/liveupdate/lib/lu_utils.c       |  13 +++
 .../testing/selftests/liveupdate/liveupdate.c | 107 ++++++++++++++++++
 3 files changed, 121 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..34657d6eb67b 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,7 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 int luo_get_session_name(int session_fd, char *name, size_t name_len);
+int luo_session_freeze(int session_fd, __u32 flags);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..51384374305d 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -198,6 +198,19 @@ int luo_session_finish(int session_fd)
 	return 0;
 }
 
+int luo_session_freeze(int session_fd, __u32 flags)
+{
+	struct liveupdate_session_freeze arg = {
+		.size = sizeof(arg),
+		.flags = flags,
+	};
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
index 2dedd5fc2534..4b0c0fb1be87 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,111 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with flags == 0: unsupported flags return
+ * -EOPNOTSUPP, repeated freeze and post-freeze preserve return -EBUSY, and
+ * closing the session FD unfreezes the session and returns all resources.
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
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Unsupported flag bits must fail with -EOPNOTSUPP */
+	EXPECT_EQ(luo_session_freeze(session_fd, 1U << 1), -EOPNOTSUPP);
+
+	/* Freeze the session */
+	ASSERT_EQ(luo_session_freeze(session_fd, 0), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must unfreeze and unpreserve resources */
+	ASSERT_EQ(close(session_fd), 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
+/*
+ * Test Case: Session Freeze and Commit
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with LIVEUPDATE_SESSION_FREEZE_COMMIT:
+ * once committed, the frozen session is serialized into KHO and survives
+ * closing the session FD with ownership retained by LUO until reboot.
+ */
+TEST_F(liveupdate_device, session_freeze_commit)
+{
+	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+	int session_fd, session_fd2, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	snprintf(name, sizeof(name), "freeze-commit-%d", getpid());
+	session_fd = luo_create_session(self->fd1, name);
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-commit-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Freeze and commit the session */
+	ASSERT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-commit-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must retain LUO ownership of session & files */
+	ASSERT_EQ(close(session_fd), 0);
+
+	EXPECT_EQ(luo_create_session(self->fd1, name), -EEXIST);
+
+	session_fd2 = luo_create_session(self->fd1, "freeze-commit-check");
+	ASSERT_GE(session_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd2, mem_fd1, 0x3333),
+		  -EBUSY);
+
+	ASSERT_EQ(close(session_fd2), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.1.708.g77570a6a1d-goog

