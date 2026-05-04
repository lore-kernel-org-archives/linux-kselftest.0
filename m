Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F329D264
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882622; cv=none; b=L4mE42wvrcwLcueYdaW4hX6xNkzarGzC9axL2JLz5z2Fm/fXEgo+EexG2M3LYM5pTfOxez8eOATLCQgbzJiXU+H3VfKlrqPX8kqgOiNmYKGpCqtcX1Thwr2Vl2m7Allb0i9KdP6zMmuEtRRnjShJuKmw8RbY2YuEmnDL8Qz37P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882622; c=relaxed/simple;
	bh=3A1k5ni0B6qXjtjH+BjKMcAQh7v4i9bZoRl0/Tlxbu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4O4tIK1jtpSC2fykzMIHefxRCVR3Whye7akIvbY8kW6AGpQ8WqUrrx2dcR6ojcha+MMq5KOeQ8JbExRZTkqx84VJ6MuWf6GJ9oqF9w59HCJobZQ3U/eUXkcT62AVZsaFLrzGuhLO8JwXqs+NnW8EkAmGK6DiKiDS54+OcVghOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyztMfaG; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyztMfaG"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-837b39eb078so381482b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777882621; x=1778487421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVbyjWaaT11NL9Dp5r+fBVJD7feswt259t9Gsa0JTNY=;
        b=XyztMfaGVpAyvTPgLaJJizdpnFm1OoFw3/ilr4AR45uJu/BQ1Epj8znVdFwni5jqF1
         qYI2+0Y5GZfH9RR9LnZSmKm4QCWdv60QTOMun5SNY4hHc/3eQDWp0VvS7q04kzVfFYo8
         QwN3NADbvg08D4KSxR8hrH2cxf3vS4HciGIyy3vVofd1Okt6Vj1pRfncky3waXnyEItr
         w9bWctkVQRWAr9kCEL4GpcS021vfOezoEQqo6LnxlxL/Evvd4T7TUhmFnpEgnigsM9lG
         ajwgqAVf8PV3HjPWWrOqoWQ9zv0DkSVEZQmOejd4cjbh5TxIDr0huY1xg02g7n969WIh
         BB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882621; x=1778487421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVbyjWaaT11NL9Dp5r+fBVJD7feswt259t9Gsa0JTNY=;
        b=V4Tt7GAAP+5wDPg764eagsGSpo+N0etqlsCGdmjhUhAp/SkPzrXDWyBg2c2Q4v7JsQ
         +xY57/TIXZNTKh2c9o1nsh6tFoE+cGgA0BBX4dKNUGg61TltC1Oi/CTgI3OJTRIzpZNx
         eHOUEzTfCrYXXsTJfY3KAjlU+1xyjBpNoyJJFJzdq50w4fFxuBm6nOoPXB74jWEitNga
         mObLm7iNqtzrs7vgIFNLTOqoG3LyNB0nl2Bud/bI3jJg5bJ9EsNjzdF3uZD4y8nNYXat
         X1Yv6zfotzVsBwqr1U2B/Kf0eWkYWhxTKGnvpU7A2h8kRhoJEiaMGQNHEoH7hDAdO3m4
         BlLA==
X-Gm-Message-State: AOJu0Yzam/LZg9YBj36Y0RU9P+GVeDngwMQ115sWtP8tPK62xd1wYMbF
	HUxFUR90eqDecw5ZdwU5ywFBmU2IHQ3DhzdVOtB7qZApzlpw1RKgc9cY
X-Gm-Gg: AeBDieuisJvrcpUwgQUjRQIlgPyD0Ot6ubiVfL7JR26ULctQzK3Jn3FDZZavYPcDe8P
	AYCIDXzRBQfDgE6vJi5Ucrztod4qBAku6saW/L1z2v70vlPCGUVZkM69pBgxXrxTX6MUumPz5tQ
	Zs6UpzF4ZJglCUf0I9YcxfnzCYfJAAwYuwZj0cDD7c7rPiA009vOx69qOxIkrXQ4H5T1dWu2p/6
	Hx2Xii+6Aq9TjpdRVIzMfnzthuRTi9pplK7nvOOvZs90go7JWrps+m5KrIBc48cWwp/FhEhfoKC
	XS7X2Ktz/B6n2gwUNIFe24oxOnM0NxyqvxiCLRjbdlkjZ5WMI/pv8Sy1u3FvuVnwXC0MeRjHFJ4
	teBo8+qn0nQJer+gv/M3Unn7l7qe182ozxAlMNa8BD/IyC7f79pXfONdiTHCS/vs7IRPz8Ssi81
	pdVV51uVg5hnfWoNBO+8UtDYUOm4x8AiV/JDdy7Zg=
X-Received: by 2002:a05:6a00:17a8:b0:837:80a:5aaa with SMTP id d2e1a72fcca58-837080a7537mr3460040b3a.45.1777882620904;
        Mon, 04 May 2026 01:17:00 -0700 (PDT)
Received: from vini ([2401:4900:8fcb:edbd:7155:edb6:dac:107e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8352bfe7a49sm7644356b3a.46.2026.05.04.01.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:17:00 -0700 (PDT)
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
Subject: [PATCH v4] selftests/mm: ksm-functional-tests: fix partial write handling
Date: Mon,  4 May 2026 13:43:13 +0530
Message-ID: <20260504081638.683223-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update write() checks to properly detect and handle partial writes.

Previously, the write() calls used <= 0 to detect failure. This
condition is never true for partial writes (ret > 0 but ret < len),
so partial writes were silently treated as success.

Fix this by verifying that write() returns the full expected length
and treating any mismatch as failure.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>

Changes in v4:
- Simplify write() checks as suggested by Mike Rapoport
- Remove temporary variables and use direct comparisons
- Use a single len variable
---
 .../selftests/mm/ksm_functional_tests.c       | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 8d874c4754f3..31c06c72203f 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -498,6 +498,7 @@ static void test_prctl_fork(void)
 static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 {
 	int ksm_fd;
+	size_t len;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
@@ -506,11 +507,13 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 	if (write(ksm_fd, "1", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan)) <= 0)
-		return -errno;
+	len = strlen(pages_to_scan);
+	if (write(pages_to_scan_fd, pages_to_scan, len) != len)
+		return -1;
 
-	if (write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms)) <= 0)
-		return -errno;
+	len = strlen(sleep_ms);
+	if (write(sleep_millisecs_fd, sleep_ms, len) != len)
+		return -1;
 
 	return 0;
 }
@@ -526,11 +529,11 @@ static int stop_ksmd_and_restore_frequency(void)
 	if (write(ksm_fd, "2", 1) != 1)
 		return -errno;
 
-	if (write(pages_to_scan_fd, "100", 3) <= 0)
-		return -errno;
+	if (write(pages_to_scan_fd, "100", 3) != 3)
+		return -1;
 
-	if (write(sleep_millisecs_fd, "20", 2) <= 0)
-		return -errno;
+	if (write(sleep_millisecs_fd, "20", 2) != 2)
+		return -1;
 
 	return 0;
 }
-- 
2.54.0

