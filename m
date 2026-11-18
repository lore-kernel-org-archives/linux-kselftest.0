Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037337;
	b=vZADPQXBiRIfxIj9Mb7R9uOGrnEV8GX/JQ7vqlhp5O4WJFfWF6eQyxHS1eIZ6aoGgOsd
	 qal5uY+lgdRgHdhxGB2tL484+QkJsWPBsyK1wQddZ/R0i8u+IG2hrY+0eAlfsH35Mgjia
	 prDAHphaaoraXEWgD+1bdVtvIFu1xLA0/OYGpRliUkreQePvHs54ExAEATQ46DeDe/AJ1
	 w1QDaATX1nxUZfJTHJf/EHcN+bmC63LorM9Gujg0rdZgXl+2Oj/Q/32oPXWZZfrhPJGEj
	 Qu3yW3HiumdJinXhisWlYlKV9l0oBov4qxd5lr/6WqRytRIiC5y4lHHqOP4KdCGlx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
	b=jkzyN+RkAG05my8ZqPce7SpXfd+TA4xPXm9wanBWNF16wabTtkfnfH1/+UeiZoKNGqzy
	 1pRHseqr3S7V2sitnyy44QA/o9vIA4yIbc8l2IBu2vqELpGO8KS65YpaOlIoHprxl8E5e
	 VgNFLiU0odIGtGvZbQj9xOQ0m5nVBlt14SYmh0zcLZ/VS6d2ogsVy02XE1YBTzW+ZdPsC
	 Yubx7gTU7NDwvEuRCBWpP8zrEv4xPY+26BnX9h6Bkfck+H1jcbCEbrO8sQFC+HBfDtWaE
	 fxn7VXso9z9PsBEUH8QgYj3abpE8kemVbnmvVor62v3Y1qH7FySpc8K46GtUO09A88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A366660A5BC3
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A366660A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1017330137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037335; x=1795642135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=iSvs7k6YwjaxOvBDjp3PksIfFWqgtnS2UWETg9JQuN099NJd1V5afHew59ASHEXl0t
         /SbmR7llhG9ljkHTguJhDUZoA9ca9FbalTO6CTroVmSlRpekw/wR8CcnvQF4cq87YMYh
         mi/Z1Ga/fbnK6PtFPhzw9saeFY4wOdqc2zFxrrF8E1lFBGz3xnRD5chdVSgzoI8qQydz
         5SR8IQcafGMjeFyIm5Tfvk8qwjx2kTdHXGqG2MBjyKwUcrrAECkvG/utfbg2msB8Nnf7
         zSukO7U2vuN9arRWTK9eU1ldf7qlM0rRUB2bEzLnLXlx8rR0zp5zLamEzGabuhN/P/gJ
         /1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037335; x=1795642135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=rzs+stHDCUwKVBclAOXtGVggjPGwLRzaRJ2n6qGPPthOcUOmeoZLmbtoFKkjawutlN
         8v/p0VDB/1W08Dm+H9e0/c2FWX/hkzuWqniaLPJNSTo2LdQGJjrlnyBzOOLFph5n+5xg
         WgEd3dt8p9q1H4wFRCOCHxfvqbUdMuIk1O7XRCBBTTpFPJ28nEaxRjt0LcF7KbjQU1Gy
         9F9CU57bMmz+SNuFeRCVKjxvCJBuuOiTYnVALA0VqtcTo207+r3TM7oFxLfXfbwauWFY
         kWUBXdaQYqsiWFHvq2C+S8lidmNIZAh4UyVHubq83Vpr+z0942u1HJKlOfU8gwfIsKIE
         CgGA==
X-Gm-Message-State: APuU4Z80cmEsh1viSVpTawngQhhiLPNxIv/v/iJoqbBhJ6FO2kDfRRYB
	/zLvMDqp5m3ByfzF3WTl02oN7b3K5P0MXk6YyQFgo/QMVLOP91V+hbMlof2coKqEB9GKE1bpyRt
	9Pn0K
X-Gm-Gg: AYBFou2AhxI5L5MpQSwoEMdgnI+h+EaQSGzKdNgJE2CmyfdVXX4ZvMh7eJMWifSwuhm
	9uhUkZPzgNqdtcl0AyDObeN3/Xan5+wWFZ428UXIYcN0bh5+YsX5gxK2mMwEFY88UQWAoT/egvN
	dGdZboR1GpzMgWJdkJRvMfKiUIuheyo4FC8XCoPcjNv3DcbAvWDkZ4V9zYcNsrmN/s/nKvXjuty
	KzukQt/RmlFSuXJIKgLp5BK7a/5g1Sz2/LLcHhdojN7TU0y25xw7dHWDiHRuM1ICLUxBJmgh16/
	7zDytrbK3ncegSune60FqjwIlueD+i22BdWJ8Y0WgdqB6GJ7HHiX4nDXj+PSEduSIjGL7J7DByE
	2NXoLRWjoRBoEh6LXVerFLG+CAl1Hf+xVHKGY8WgcI3FGvI9nASqulNGTxRslQGPUih11Gb7c1f
	JxwlnOHypO0c81WZ1UlX0YREWkFE9myr6W8WBxnNZEf3U/yxYOIBgtp8rsp1M6YUjFxQyrL9jFB
	z+8QCUqEz18VTXbuMLcEOIEvOVBs5jZ6QnaqunlNDI9hUori+1xdFs0uN0TPU57RBvOYgxBFa0v
	1m29zRBqWtDnO6eeyBoXHiSGOY56Tayf6okwxvqxUhDJ7ATlGIm2+5OzpENBs/DhRP8sKW12Gjq
	D8LisdYAr2aA1wydi1l6kAfIn2JxDdvmAqc1ZmbCfHyuCsECwdAFmKuzTiefseRAjanO3hCylnw
	==
X-Received: by 2002:a67:e113:0:b0:7c3:2b19:6267 with SMTP id ada2fe7eead31-7d6ba46ca11mr1512091137.32.1795037335676;
        Wed, 18 Nov 2026 13:28:55 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.54
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
Subject: [PATCH v6 7/7] selftests: liveupdate: Test LIVEUPDATE_SESSION_FREEZE across kexec
Date: Wed, 18 Nov 2026 16:28:42 -0500
Message-ID: <20261118212845.2855249-8-pasha.tatashin@soleen.com>
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

Extend luo_multi_session.c to exercise auto-frozen, kept-open frozen,
closed uncommitted frozen, and closed committed sessions together across
a kexec reboot, and verify that freezing an incoming session returns
-EINVAL.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../selftests/liveupdate/luo_multi_session.c  | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3..3b09cd63c832 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -15,14 +15,17 @@
 #define SESSION_EMPTY_2 "multi-test-empty-2"
 #define SESSION_FILES_1 "multi-test-files-1"
 #define SESSION_FILES_2 "multi-test-files-2"
+#define SESSION_CLOSED "multi-test-closed"
 
 #define MFD1_TOKEN 0x1001
 #define MFD2_TOKEN 0x2002
 #define MFD3_TOKEN 0x3003
+#define MFD_CLOSED_TOKEN 0x4004
 
 #define MFD1_DATA "Data for session files 1"
 #define MFD2_DATA "First file for session files 2"
 #define MFD3_DATA "Second file for session files 2"
+#define MFD_CLOSED_DATA "Closed session data"
 
 #define STATE_SESSION_NAME "kexec_multi_state"
 #define STATE_MEMFD_TOKEN 998
@@ -30,7 +33,7 @@
 /* Stage 1: Executed before the kexec reboot. */
 static void run_stage_1(int luo_fd)
 {
-	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd, s_closed_fd;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -57,6 +60,8 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
+	if (luo_session_freeze(s_files1_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_1);
 
 	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
 		       SESSION_FILES_2);
@@ -72,6 +77,25 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD3_TOKEN);
 	}
+	if (luo_session_freeze(s_files2_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_2);
+	}
+	close(s_files2_fd);
+
+	ksft_print_msg("[STAGE 1] Creating frozen uncommitted session '%s' and closing FD...\n",
+		       SESSION_CLOSED);
+	s_closed_fd = luo_create_session(luo_fd, SESSION_CLOSED);
+	if (s_closed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLOSED);
+	if (create_and_preserve_memfd(s_closed_fd, MFD_CLOSED_TOKEN,
+				      MFD_CLOSED_DATA) < 0) {
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_CLOSED_TOKEN);
+	}
+	if (luo_session_freeze(s_closed_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_CLOSED);
+	close(s_closed_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -91,6 +115,13 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  stage);
 	}
 
+	ksft_print_msg("[STAGE 2] Verifying closed uncommitted session '%s' was not preserved...\n",
+		       SESSION_CLOSED);
+	if (luo_retrieve_session(luo_fd, SESSION_CLOSED) != -ENOENT) {
+		fail_exit("Expected -ENOENT for closed uncommitted session '%s'",
+			  SESSION_CLOSED);
+	}
+
 	ksft_print_msg("[STAGE 2] Retrieving all sessions...\n");
 	s_empty1_fd = luo_retrieve_session(luo_fd, SESSION_EMPTY_1);
 	if (s_empty1_fd < 0)
@@ -108,6 +139,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (s_files2_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_FILES_2);
 
+	if (luo_session_freeze(s_files2_fd, 0) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_1);
 	mfd1 = restore_and_verify_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA);
-- 
2.56.1.708.g77570a6a1d-goog

