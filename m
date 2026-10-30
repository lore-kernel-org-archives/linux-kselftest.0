Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397530;
	b=J8B/jDmcYqLJlVI31F6jYBo152RWWkcvVid9CdxyKCng5l2JwlYTziQxFd+lnW69mzWD
	 ZrQUFXhe2+nT+SCw2LlkZNsMUCT8ayeoDmqLvMvOo+OAp5DvIQb7riDoiqlrm4pGJqgwO
	 00OvKdUAAcMviLB3RAJDl/ECbIdCJyITFnfpRFXgF8cINNamjkYlx3FqIFP9E+ZGMQNEy
	 7vhARNjSKfmODOOxr8J4M3uO+iWXMo7t7rydVNrsCim1p1/gw4FdghSNVrayHur+wUiZv
	 LbMVnxIo4u7nEZQkUHCYODL00m3Cc7rQF3SEpb3HuP+LA3x5ygT5l5Q9bJjOXE4QAew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
	b=p8rgnnF2gxTIo0HxeARW+VS0XE9Q0bY6e6xdgSaQ/nky00rEavqxNm6tB35pH/fFuHcM
	 zi5tp2w7aTMyBdd+wp1CUKJjkeGM4KdWTnnvUpxyWMjoyMIG2+b7BW2xZNS08ab3jAiZW
	 SK5Vbjo560mVks9s8DvyW4DiFpxnE6Cr+LYzaeOZ1akTyddNF3PiHqyHUk5TOIA4kGOpC
	 bGmVU/puI3F+Lpm5hwvwwqp2Y2i/P76KM886b2GKoS2CvtYz/DJd5v8dda1WChHNFEaov
	 C1Te0GnOWCuNwl4EuNBrGaHt0Xi1svZg+Tw+F/VwAKijuOSaBeMBvqLP/0gXlR7toDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i92gPEUD;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD9606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 21:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i92gPEUD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso601427f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397528; x=1794002328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
        b=i92gPEUDyMGl87Bni12lIhJYA35+je6eGDu/IbhGrl7zFcJgHN70Ms7/OIyFCpPAch
         5sJ4rGyxEJsLPUxGBJEXDaGq5vx0uUN5EfuEEVQjPzIkeXXzdyuVaxxcZkupYg44rg92
         C2JFcS2DQENfuR/iH6TUaJXf9Xq+WC4S80JLVRjP7R9VkZySw1E3nLM3xx/Z9K+XtbzW
         wHSJgLt40uz+jeFIGZOQAuYfsv5Fo5lWWmi+LlxGluHoL4dv59dgkiKmITSmRqLF+EhA
         O+8vUjGeKNjs0GT7Jc26SNfLsJF3D+/N7wdE67lWwhtf+Mqj5SKzCk4y5NBe38mImVRp
         Yfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397528; x=1794002328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx1pZLwwkBWkRpnVSBKgTH165jQvpQXHy1+6SegQOjs=;
        b=0E4BxdMK6NIKRWFrV2FHkUj/oKkyiAhHQc8GKEoqgdJG/vkLrx3jVKFB6pf5JGO5fj
         rBjw7asXo9e4lRu26Ebtv8fWwPUBnDw1/IetBGaLUEO/jk6ENHFpsxrQPoYg6thYP3/8
         p3DSJCW8wjU7UsQkNjtot9n+T7h53IiU12Q4uqDBFqfyA8AfwEciBmKmhdbzt6Zaeovn
         AbfaogjomrYwBCjMDOXun3Os1nA01KwjMIUCL+ugZIEBb6KO63swJnWJs6uv/8CbsuSr
         oFjKeoZxmmOACf9NS7RqtIwUGHYytN8GTBoN3+kdh2vcjtYfzFQAb1/tIJs8RRG+QmQE
         By5A==
X-Forwarded-Encrypted: i=1; AKwUvByJLz77JF1zPvmw31ZU9THKfiuLpREZy8zd3n9bEIDxUNSooH3Xae9Xlqaoq6bttm+872ABCGwUDx2pFqnRtGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8naSQp/Vk3l8vdO9L86unaWeeyhy3rdIsTf6hnTEuOHTjf8pB
	yorfWaXNIa4N97zv0D3e9HijXNw8TncdUBWcPti+o+xqH5nMWuoIXiAo
X-Gm-Gg: AYBFou2dA+DgRTCpa8tVlWUXWPlG2rt+XbXlzkfnnPduiz20B/nDlOnKkF+BPCQS+8J
	ASFL80ffXQOlPbNfJZ4GlDTyJR4fNQM4MWVxJlhwUsknf9Xu0ejBgZSlc0qpEd1gW5Ed65XPQZk
	kWq8fBm0PNmzty5PIbDa8YeOVbS+/DEeN5fjw8oQsi+Jsvfut+BBtpNV80dJ9I1WNJv+XLAwkbl
	rCS1hUJq22riSWWkEYWPw2bnYHd+WTOOf+V9HnBGddnO1VISoCYh31ZrBJMAWG1E+ybpQUeqXl6
	HOAKw6lXQPg3QYb030BChqYuOJa32N0hqXkSakusEx3fcCqYUMkqDNEtNTAowFhcQY4sGXLSvYd
	ZxfCTPSlo6oQiFJ409QZPP+MfwBY9Lgv7DW5jLasZ0oz+Yu5F3kurHCbG8VIQNszO+AlB9QPVge
	jx1VxMRLSzVTxGoxeb1RVcv0mOeZkuQba1ukvKOFtmt/i+eEfeeYvD1DiTo2DIN0H13VSzLMziH
	tenGK8pVxxHrJGq/hFbXES3/hdZm+zqSVSZ8L0LXNMOj94dRQMQDc5flQyrQGwrDXp7+J36vHat
	Zywre0juV4msMQISahdgTXmpXozUSWJHPLiEkUCNVVjfW4LcL9rO+WIX7AdP
X-Received: by 2002:a05:6000:402c:b0:48d:f39b:83de with SMTP id ffacd0b85a97d-48e6e2bdf87mr10007670f8f.3.1793397527950;
        Fri, 30 Oct 2026 14:58:47 -0700 (PDT)
Received: from fedora.domain.name ([217.218.153.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm5312409f8f.47.2026.10.30.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:58:47 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	yeoreum.yun@arm.com,
	ziy@nvidia.com,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] selftests/mm: handle child status safely in khugepaged
Date: Sat, 31 Oct 2026 01:28:41 +0330
Message-ID: <20261030215841.229969-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The khugepaged selftest reports child exit status through a shared
variable without checking that the child actually ran to completion.
When fork() fails or the child is killed by a signal, the status is
undefined and the test can report a false pass.

Capture the waitpid() result and distinguish normal exit, signal
death, and fork failure before interpreting the status. Report the
child's actual termination cause in the TAP output so failures are
visible rather than silently masked.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 57 +++++++++++++++++++++----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a46..2dd68dde1c14 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1007,6 +1007,7 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 {
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = ops->setup_area(1);
@@ -1019,7 +1020,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		fail("Fail");
 
 	ksft_print_msg("Share small page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
 			success("OK");
@@ -1034,9 +1036,20 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+		fail("waitpid() failed");
+		goto out;
+	}
+
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1054,11 +1067,13 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *ops)
 {
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1084,9 +1099,20 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
+
+		fail("waitpid() failed");
+		goto out;
+	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
@@ -1105,11 +1131,13 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 {
 	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
 	int wstatus;
+	pid_t pid;
 	void *p;
 
 	p = alloc_hpage(ops);
 	ksft_print_msg("Share huge page over fork()...");
-	if (!fork()) {
+	pid = fork();
+	if (pid == 0) {
 		/* Do not touch settings on child exit */
 		if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
 			success("OK");
@@ -1145,9 +1173,20 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 		ops->cleanup_area(p, hpage_pmd_size);
 		_exit(exit_status);
 	}
+	if (pid < 0) {
+		fail("fork() failed");
+		goto out;
+	}
+
+	while (waitpid(pid, &wstatus, 0) == -1) {
+		if (errno == EINTR)
+			continue;
+
+		fail("waitpid() failed");
+		goto out;
+	}
 
-	wait(&wstatus);
-	exit_status = WEXITSTATUS(wstatus);
+	exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
 	if (exit_status == KSFT_FAIL)
 		goto out;
 
-- 
2.55.0

