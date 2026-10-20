Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507649;
	b=dqo0VAoGg7gDpSbNo1fKaEmzIk2gSkXYT+vULtzCwNXFxtvxSuLKrUEef8MyAIWT8TGP
	 57S0RGX/Ao9e51TvWmPgsIS32VP2SrkqkEVUTHa+NLd1tAPwNl5Ou/FsEBM3PzcNbGbcI
	 UR6rDKn6XoIBpIkmMD4dTIicWR0HT0eZHDTcF+HYhzUiyfcjvA7KFfDqu4gQU09PLxvky
	 3MS12ybVaoJcS5zK7+xd1eskwt1GCmS0XQWJMK2RKc97UhFftCINHQJBdk7u/Np5yPAim
	 NzPPQ6oHolmeqlNvBseeFOifpuHtRaBhDwna7ithoSHk6NMlT+VRnmTYczEvmQwSKig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
	b=EMc4BDstTUq/rtNWW0d1iqNBBrAxenMheC3N85bSju9m4HS0ejZAOwAJlh4S09otWai2
	 7DmfMzuPP7NEjIQs+d2UqX9Oi010eYq0cqrT5Zo0OyMrwMCrFRp7H/UckC3woR4LQEtlU
	 lxIRAk3ZhdcFgbE/Nc+n60a+yT2Q5+vDKOBGkuGAvcNbAGk6tKGVOdHW+QeNq3iKJf+zP
	 MsWL7TnNKO/lPhxNdcaFuVKzJltgd5TB1m1JkcmH8hSEgqHwRBKTNcmlf4Mw8jCq2KCTS
	 oCABQwc3XDLX3L3l1+WXLnh52lPCWhWyXJ9K+ZD3NkN8BdQWK0EQK/l3pVcjlQz41PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RjHbqNNn;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646A606A31A
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7646A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RjHbqNNn
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eae12762c9so250927e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792507648; x=1793112448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
        b=RjHbqNNnRXOUwAzaGsC8B2dAL9RvpcNhU0+ZZyi0KA5RvjgvaMWDASTQt5fhU53TCM
         Ckon4JHOuy3SyVOBkqWP9Pozi/eRMZX0U1iv2HLN//OO+25gyvfDSKCHA6WbURsq3z/o
         onJtgPR4vwu0N4R8OolkhfDsA7pLh9qbT2m4LaKBMpKZ947XRJudpYIF+Lgt1oqMPxxu
         Lw/ngvdWBCaP/j+yLAN9YcmVSILZPOXoHT7vFdmzheunWSnHveRWSoiQ5MFtbUCuhOMk
         eLDNZxJ4YRjLVNvV/3wLYvLMHVa4cMx1WpoarMHnFZ4Fru6k5Rf91BZ4SQUTTfPnlVMR
         adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507648; x=1793112448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
        b=VWazaEUjkqn9V047aZncLlJEHHJoJFvs41u/bp447KTELay58F193diR1R+fQdRU6a
         nJtPANoqV4S1qqETH/6nqyHmFLWRdzR9e0mZz7rTV1GfsCFy9mfS+mpd+Vj5GIO7VP5Z
         QXZGnAEeU84X63wLILlBX8+CongfCzXgVNkl5q+ooVV2MVLWp0ecaz0t2Em1UGji1MUC
         QZianAL+TH++Gwi6rdFsUwVYcSFSK/e4ZZ8QzRhvGsLhdn8guLKb6sk+jwH/7+6Od742
         AYCIaAvL6ja/XBcohIzFCgjfJON53L1+3hoD32Rhrd/veFFG8yTVy5retwc+5IsUYanw
         oRdw==
X-Gm-Message-State: AFq9FYJh6DrLFfBikRj44UBbSTAKjZ5IoCeTW3iK9FHtqX+JT6DAUOPo
	5gJvNM8Ykehb/QsXssDf/lXMzr8Zv9U6Mf2v6l2ciCDJpWGLvSeD/r7n00kJnhGnYqQdG3j5G6Y
	dm8t4
X-Gm-Gg: AYBFou3CdWCpOJ/GqycFkl95ItK5LHV0NdHBJ1964d1riR6NCDcd9PPnh/iclwHS/1w
	DboJEqREnOCsP/YROg9HlpU5ALfnL1l45nQ44S5qbIFDEboFUJYlSIQIKiwqqEJSsk9L29uZyLO
	0VEFnG88Q5NfzDcTdKVFBIPH6pMbn/j1A1jyB99Hlj8qfDmeDuYaBipKNoYMI6VaSewAqciezOi
	ZLd++XNhvRH78kyIAeUZ7tx4tBBLcJX7DBvPOW5vYwexv/4+V0nsdsgkxZsyP/mik9LG/JzTjBt
	QUyqQmvSzwJpmIw5OgBBTyJrIVUdrorTSRaX/NkamwC2g1Nw2xaZ3zTQ/emWWstf+12hkFaUp1R
	QDpvsUg6z1vUNlov06ckgbWxoyzobbLJCLBd6at4s6Jr4cz6JGuEuhpMdYbCfwcpyPOjdPgbuJh
	4hZOaBm4s3f3gT/au2a8eT/A1+gl1AZ27aLnH0lAslRfd+jFz/91MzV80eCpG0RETX37APKp/Gf
	vPQdhcowdmDtd4IRvnph9tkAw+O4ZkuI14eMG3cljMuS6ow7Wia7+V2l4gK5EMgSl3gTGA2boyo
	EGL43yN3Jkg5FbrRoRU=
X-Received: by 2002:a05:6102:4487:b0:7cc:1045:610 with SMTP id ada2fe7eead31-7cc36ab3f59mr2581207137.27.1792507647537;
        Tue, 20 Oct 2026 07:47:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12920421e0c.13.2026.10.20.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:47:26 -0700 (PDT)
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
Subject: [PATCH v2 2/2] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Tue, 20 Oct 2026 10:47:04 -0400
Message-ID: <20261020144710.4154339-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
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

Provide luo_session_freeze() in the liveupdate test library and add unit
tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
tests verify that non-zero reserved bits are rejected with -EINVAL, an
outgoing session with preserved files can be frozen early, freezing an
already frozen session returns -EBUSY, and attempting to preserve an
additional file descriptor into a frozen session fails with -EBUSY.

Also freeze the test session early in luo_kexec_simple.c to exercise
LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
attempting to freeze a retrieved incoming session returns -EINVAL.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 ++++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 +++
 4 files changed, 68 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..15a7db3a6b3e 100644
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
index 74d41115c281..6315746ff08f 100644
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
index 2dedd5fc2534..74004e4276f5 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,53 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies that an outgoing session can be frozen early via
+ * LIVEUPDATE_SESSION_FREEZE, rejects non-zero reserved bits with -EINVAL,
+ * that subsequent freeze attempts return -EBUSY, and that attempting to
+ * preserve an additional file descriptor into a frozen session fails with
+ * -EBUSY.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
+	struct liveupdate_session_freeze bad_arg = {
+		.size = sizeof(bad_arg),
+		.reserved = 1,
+	};
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
+	/* Non-zero reserved field must fail with -EINVAL */
+	EXPECT_EQ(ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &bad_arg), -1);
+	EXPECT_EQ(errno, EINVAL);
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
index 786ac93b9ae3..9bc8dab2e074 100644
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
@@ -60,6 +65,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (session_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", TEST_SESSION_NAME);
 
+	if (luo_session_freeze(session_fd) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Restoring and verifying memfd (token %#x)...\n",
 		       TEST_MEMFD_TOKEN);
 	mfd = restore_and_verify_memfd(session_fd, TEST_MEMFD_TOKEN,
-- 
2.56.0.212.g129ede20d9-goog

