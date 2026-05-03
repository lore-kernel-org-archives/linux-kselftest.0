Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE81DED5B
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803170; cv=none; b=BdBg5XZkqo3y+XH8CF89xH/e3y+8Rvh/i1gnpoC5hC9rMAK/7oirdhMy4YFVtgRzptyOavnhq4PKQatFQ6lhiC5EpMkQ8vIxa+H7ev/F7m5Bg36I8jWchtpQvX2VawzszoVBsTnOmE2ttLTOGDbbs+cll8us4A7CsEpoV6a9zCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803170; c=relaxed/simple;
	bh=EFb7TNt4VwiCtPt3PXxCkkBd+zHC4DEywPS7trRs7cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UptXDfULDHWjJIE07rIGiQBXJdzkDmygRs8u316CiYhGc5Tlj1g7+K+XIB9y6rmSTfYOVJsHMBjwwqa+KxRobU4I9jXx7qTG8l3TQIfiUkJijb9kZ8DYKNPRghjvD27LnRzmNSCV+AUgrEtAhn5scKEphncAdIOUsOGwd6JoBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUR5UWUD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUR5UWUD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3650a4eb605so909687a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803168; x=1778407968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KccpdQywlOlMR9K3mAv2UCpXK0oC+hyiMnrZpV5kK7I=;
        b=fUR5UWUDl013W/vcgMSkFx/d6iga9aHDGSojMTkHE8uQAwB52Nz/BvAwiQ4TmCU8MW
         AM9ub6YcsLRjijM+7osu4OKUtYd2cTclLq92+pdFOfjfPn/3TiIleaV6tvzC+dzKmUM/
         98IyxAdWDHIWeu1HFzu198FHZOk3qPRQK4C2TBRv1LwDc2FVnlZSW0nxa4t1tmXwLMIc
         hHTNAA60yaeJbUc3DtR8exNE+Hsj6LwEC7KXnkVmWuDQFuPDhOtm8BKnmXOTKFRH8NKa
         /Sg0KdFGZ79RWMi4rRPWreEoHAOG8BME9xdBfjHM/DxsHt5RmbTeZwx/1jwRU1bvcjuV
         DmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803168; x=1778407968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KccpdQywlOlMR9K3mAv2UCpXK0oC+hyiMnrZpV5kK7I=;
        b=D0P7hyN/QmAAdhGNqkmKDWrxR0NN5574X66x/ok1r7Ed0aAven/Pt0dmH74YfjJybl
         87elFYyMwBH5S8xWneTuS+xmRFeq/6687asis6h3Jiz7qdd6zniowFrXs3b2qBIe7QO+
         lzHgFYiH4KZ/IsJfigcjrB2dDj900jc4Px/SbiMPg6jZG9iTMOdL+pmTGQDFqdw4HMws
         GpePu25VPMvdJTwPsQojmvRMnvjHPamEmJphssF9xMjd4LPS4g5RPb6bTXyQyGw9p+1e
         tAUsPT6oZ9BjFEb2k3TIUJ5WQnSlN5HEmylnCcpn+iaXewYquvjdk7MZ4/RsPsI6pbKh
         irpw==
X-Gm-Message-State: AOJu0YxJEI2LVtupREL2VFrTUf37JS5jf0WXVsaxqQKmpkWLMMqAkIxi
	lRy2X66d7VOORFQFU5iMNss71wbidnaJ+SKGYq2ButdahsR4Nspby/qM
X-Gm-Gg: AeBDiesjDHYpk2as1h1Q+X68edze4fx3nND3TjiX3R1KleqRkdSmgQFudkzM6GSaAh8
	GaptEnU8slJ4fKRrzlPx9bVTbryxhBAAdJ+WdAoezaQFOeiGITH+vwkmhu5vuUQFo1o+k6mDpMY
	sDe5n3Dtm/SoaC0hQVruOoAOIbzA8Ms47RbehgJeQTzr+F8wtafGugm6J5tR0Wo2hMAKPe9kHzB
	htpTjFdrpsKum+bYf4FtTbjMmgUbZ/dg5gg6m/fpYShMgDXbDI6BwZ6St+okawDdywz65H9wL0P
	Yjss+dyvo0GTWYH2LuBLlqP2j+pf5iAruorpVSXVcUxs8XNFr4Ddk9gKZzCkkC/lyhsRYo6KPbp
	ZmKuBC/v2cDUiE7sIduu+LrcGE782GJS17ZWewriEkef/YoLXdE3e2iq3gWitcVkUJyCzgkmvet
	P3v4RVKJEFzVIWFlx7Ycy/QcvSa9siczGsglNYamjnHKsoVyAk0g==
X-Received: by 2002:a17:90b:46:b0:362:eaa6:a3a2 with SMTP id 98e67ed59e1d1-3650cee0153mr5713172a91.19.1777803168025;
        Sun, 03 May 2026 03:12:48 -0700 (PDT)
Received: from vini ([2401:4900:8fcb:edbd:7155:edb6:dac:107e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec736dsm7810834a91.3.2026.05.03.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:12:47 -0700 (PDT)
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
Subject: [PATCH v3] selftests/mm: ksm-functional-tests: fix partial write handling
Date: Sun,  3 May 2026 15:38:40 +0530
Message-ID: <20260503101229.654763-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update write() checks to properly detect and handle partial writes.

Previously, partial writes (ret > 0 && ret != len) could be treated
as success because write() does not set errno in this case and the
code returned -errno. This could result in returning 0 and
incorrectly signaling success.

Fix this by verifying that write() returns the full expected length
and treating any mismatch as failure.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>

Changes in v3:
- Simplify error handling as suggested by reviewer
- Return -1 when write() does not complete fully
- Rebase patch against base tree
---
 .../selftests/mm/ksm_functional_tests.c       | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 8d874c4754f3..4abd98be3f59 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -498,6 +498,8 @@ static void test_prctl_fork(void)
 static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 {
 	int ksm_fd;
+	ssize_t ret;
+	size_t len, sleep_len;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
@@ -506,11 +508,17 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 	if (write(ksm_fd, "1", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan)) <= 0)
-		return -errno;
+	len = strlen(pages_to_scan);
 
-	if (write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms)) <= 0)
-		return -errno;
+	ret = write(pages_to_scan_fd, pages_to_scan, len);
+	if (ret != len)
+		return -1;
+
+	sleep_len = strlen(sleep_ms);
+
+	ret = write(sleep_millisecs_fd, sleep_ms, sleep_len);
+	if (ret != sleep_len)
+		return -1;
 
 	return 0;
 }
@@ -518,6 +526,7 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 static int stop_ksmd_and_restore_frequency(void)
 {
 	int ksm_fd;
+	ssize_t ret;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
@@ -526,11 +535,13 @@ static int stop_ksmd_and_restore_frequency(void)
 	if (write(ksm_fd, "2", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, "100", 3) <= 0)
-		return -errno;
+	ret = write(pages_to_scan_fd, "100", 3);
+	if (ret != 3)
+		return -1;
 
-	if (write(sleep_millisecs_fd, "20", 2) <= 0)
-		return -errno;
+	ret = write(sleep_millisecs_fd, "20", 2);
+	if (ret != 2)
+		return -1;
 
 	return 0;
 }
-- 
2.54.0

