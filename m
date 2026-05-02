Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BF21CC51
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777683439; cv=none; b=DAaAfDLDQzxwb0rGflkeZVAOMq50D/5NIAlsl5GzKtxi+Hx/pZwxAv4+y6qOz4S2wjbu723hXKu3kLtlzcPKzJvhoPTXsQqLO1EnE6e2LloQ5op16IeaSkDa6M1NOeL4A/nA8tBr058ZmIHUuXAX9oT56xmSCOkrJaHdEF8ICqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777683439; c=relaxed/simple;
	bh=rJrgB01k/moXH1SGs7r8v4NJTcON9M/AuXbz/nXUtRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNw7rGyjWGoXVKmiZIRnCmOx1m6SudIprifiLAsQdkeUD1jOGAQIzJFnFV+56EfjVjumgFdVEgFVggy9Eg5WPzCUXLamGQChS639+graLnhgZXlH3Y9IcjIl1StzAH1DYjkKQVQvM8qDIiAPaliQ2+1W5fpuG+Tb3AjCUvDGYx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7O1rBJq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7O1rBJq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b458ca2296so14717195ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777683437; x=1778288237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wjZHNgAlc5fbakN7Rg2PZWjwbctlYdmA1M6spjYH734=;
        b=d7O1rBJqN+6/qRdxf3qn7wVCQYE7k7/ZP4i+nyvmM52Zjzo/pP2f7yqQ5p7djG53aK
         KTdGoJs9T7VYP24ljX3MvIW5MOYVxZZwokH6uTCkTj6Xc/uO2q/vQcnujtHh8E+iJRrn
         vvbnYGNBgA4dUzX/PUC3V+a9EkaCI1DhapiV4EbMqFy9CcB1WUxtNmYmBWij5Ls89TcB
         j8TfuwJTkBmgiJjBlJ43PYZfseVm8zX8wDJr+MlSJf8THc4VnQdG6DFP9WQFWGhdutnT
         TOKj2BwRS5lZShSp4uHct3SQWoNBUkaWYKZ6jJLJLfWpOqBMWdJcPJIvLufo0EvxXS5v
         xqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777683437; x=1778288237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjZHNgAlc5fbakN7Rg2PZWjwbctlYdmA1M6spjYH734=;
        b=HDg0qJitiDbqFzEPSMR6AAmIUCit4j1fIFbWFploRbLh7RbA6ieex5YNDRiSN60qBx
         oDVJEkA/CFz6eM+RTiKSj6PhBVWdBr4ohGqMV3p5Hdde86jxLfmIMfNQh5I1bWelhIdv
         2++eyPEjeXZtl1GwcIgeNm54u+620Uf5uU49z2xkPONF6uOEsO9tqyUXdvjhSXuaCciK
         mERTV8eXaooZRmEjLh/zGdaahaUxYyxJngBWbtzu0EFd8XYribEcPUkgld6BvJ+B6wNL
         Y+ycQmKhrofVd1ZiL09nfGJ//RcupHVvva8De/OW8vCouuEFUrcIgY04Y2WTzafEI8rp
         Tpcw==
X-Gm-Message-State: AOJu0YxryvgeygAq90wKeCBe+MIUuDFrnp3d8RQGVTMo7fokA4UO+Vaw
	+/gtDCK5sZoc8zAxb3dUM1D77plhLdK797f7bP3aG0HIoWCZh+FAAm41
X-Gm-Gg: AeBDiet5BS6H1ghmjR6JtQ8dfw0G+peUCDcxCbJQegZDFTLWSjpNAMKW53s30GCsWWN
	fQ+c+PAWX2E0XIYLTk6fNTw7J+K64bteLCja0joL7IZ6XDiY+fGv2smKRVXj6OOaOLbbhSIpB2c
	ZYG3zTHyc2bZmfeNI2xP8AZSPXSR7hRE9ACHeBkoCv3ksKiPlZXZ8uEpILxlxJi9UdDo7hQsEF6
	KAECJavqxERgy5WA3Ad76tTpUbqyul/o9t31MJMw2+2TaS8LzFW6+suc/qMe+wocOnDrcKWbnB4
	T70MZutnRIsWZ+mcTDDZVZSHUaLH97nas0MDeMO1zR9ajfL9Bwr5uchRSlp2oOb8CGvOqu+MeeE
	wm0g993bgIl4SwVblC1huuvwa6n+CuTxcJiuC0NKCrkxoTcVTJMT36Ia2AnV/MITIInH0babB0z
	qervbAEH3pZy5tUbGAOILA8+3lePzzDuwCxzoVa4Q=
X-Received: by 2002:a17:903:4b24:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2b9f2595fe2mr11583295ad.12.1777683437390;
        Fri, 01 May 2026 17:57:17 -0700 (PDT)
Received: from vini ([2401:4900:8fcb:edbd:7155:edb6:dac:107e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaae66fsm34192445ad.21.2026.05.01.17.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 17:57:17 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: shuah@kernel.org,
	akpm@linux-foundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH] selftests/mm: ksm-functional-tests: fix partial writes
Date: Sat,  2 May 2026 06:27:02 +0530
Message-ID: <20260502005702.593878-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some write() calls only check for <= 0, which fails to detect
partial writes. A positive return value smaller than the requested
length is currently treated as success, potentially resulting in
truncated writes to KSM sysfs interfaces.

Other write() usages in the same file already verify that the full
length is written, making the current checks inconsistent.

Fix by verifying that write() returns the full expected length.

This also aligns with recent improvements in vm_util write_file(),
which enforce strict validation of write() results.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 8d874c4754f3..9a8c852acd68 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -498,6 +498,7 @@ static void test_prctl_fork(void)
 static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 {
 	int ksm_fd;
+	ssize_t ret;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
@@ -506,10 +507,12 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 	if (write(ksm_fd, "1", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan)) <= 0)
+	ret = write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan));
+	if (ret < 0 || ret != strlen(pages_to_scan))
 		return -errno;
 
-	if (write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms)) <= 0)
+	ret = write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms));
+	if (ret < 0 || ret != strlen(sleep_ms))
 		return -errno;
 
 	return 0;
@@ -518,6 +521,7 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 static int stop_ksmd_and_restore_frequency(void)
 {
 	int ksm_fd;
+	ssize_t ret;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
@@ -526,10 +530,12 @@ static int stop_ksmd_and_restore_frequency(void)
 	if (write(ksm_fd, "2", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, "100", 3) <= 0)
+	ret = write(pages_to_scan_fd, "100", 3);
+	if (ret < 0 || ret != 3)
 		return -errno;
 
-	if (write(sleep_millisecs_fd, "20", 2) <= 0)
+	ret = write(sleep_millisecs_fd, "20", 2);
+	if (ret < 0 || ret != 2)
 		return -errno;
 
 	return 0;
-- 
2.54.0

