Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EAE3A545E
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777788176; cv=none; b=H9NT4r8LEzwsKlf4GbuL77/3MmT2HKZhhvA3ILmDmwx3ArlvLrjJAtahHleUthHfZ5jWL3fO8YSXJ1krl49DRVPwnnVTN1DEK9dqS+S3mhQFN0yZRqXeq0vTPKcZzXS9gPbOj52uqXRQr81JKoucEuAZ2kVBDKEh+6rA9QfEG1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777788176; c=relaxed/simple;
	bh=JK7G8Bm6va+k+fsW8FrWr9BSD/E2z1WqYsrh6F7xVJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1GGoNaI2IrstvFU4sHArsdwDAeE4XAvPY4YrwPSivBfWd00lHj812afzDNVnYHH5pMJLKBPA3Va0fcU5Bbffx6UqMKauruNx9OPfWigyoZ4h9MB6+JuHWFqBwfeIU9q/e93TE7WGLU7F7TORqXE+BbJfzCr6FrMuoyMviViVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNDLHGT3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNDLHGT3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8353dfdad62so297847b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 23:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777788175; x=1778392975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDQOn1JNMa2LNQKCV+MjyGaeQIvkz+XSOsnEqnhjmOQ=;
        b=aNDLHGT38fkw2KeJoJpaq8F5AVhAToLJkqKBeO/3MuZkCForHU+6zvB19hxkc5o++c
         eZ3rGAlJ3W2uJzDeR42K2XBBXr/9bD58r78dw6klp3A+qVgKOO6Xuze96wLybCOmyxBg
         nIGx8D7BZdrS71M/jRhMKP39+rjVhAzqnu9GSozltTXF2sehaudOMhcNkPWzjDiFgCFZ
         7Bs0CTtGZRwV/KS0f8sMSWTaJqTI7pISVIxWG1c/ZHKJ9cFcnNNjLPncdaqVkjKnrFHW
         Cbn8r2qkhOzTerOu5o+9gEhuUIM1Wach5B2wJ6Rr0ofFIS1SCnou0/+YHiIifx9gIrrp
         AkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777788175; x=1778392975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDQOn1JNMa2LNQKCV+MjyGaeQIvkz+XSOsnEqnhjmOQ=;
        b=AufoHraYNcoi9lJA1+1hiLcRCOYfMtgypn9z70TdIZaThGFpTo6GKNk00bHk6rZqR7
         8HJ00P2YeGOeBv1rLflT5BFfn/Q0JR3WgF/qeho51i1skhUnm/v114huaU4iiCw4pISy
         6wHFs9tZYPSSPRe00h4PnBm/ItC0fya/DVudTMrmjCRapHPLzIUypwS2Jd57eQiyn7j4
         7dBQfVAcVX+5RYMqYhq1SPHNzhmbdnDZA5JSvNyVCKUtZZUK6FHZBQ0WI3fR3Vd4Idtr
         5LJM4V44Zx4gtX0znbGXPlhTJiNsk02sEhvN2KdGZ2czlEmK7nowq176DtEwJ6Xy1H/7
         WcIQ==
X-Gm-Message-State: AOJu0YyMNsOEaAukJpfuWdtdN2wluE6FZJuzNdGx2px+IjHRn/BWDO8x
	EampM6sYMjmWczTQgzt+MxzkJjkUq6Sw6j7//ZW5h2CE4YIaQsiUUz3e
X-Gm-Gg: AeBDieugOwddu9IC6a44OLo9FK5l3m8gwEGnGj0Fck5nJZz1QzHero4rA7B9YFUTBTj
	RzYDh/sVCe0KheBzjLhWCtijxulUTwhHTYMcqIkRm3wIcjQ8zSFbGX8f64M9TNV5cZBrUNs2qPe
	W2f+zEO+tRMuRgSbVI6vkNhZDwcay84NLb+XE1AgBq81R0/Gn83OeEjOLTT7aVW2qFqLaXQDEDF
	FJ0vI/BlVbzi6EKRId6SaNZySTszPImLnTsGx593ySMv8eVSOxDhKEmCnWByDgwnYJRyVpspgf7
	J3K7LDeLwZvLp9+pPGuAP1y5bhxIxkdb0RUgYFoWeS0jAuNFQor8cNFw/xElQRQEK84bwp7EfsQ
	jSuewzBtFpyztpVe86LPDXF77oJKT6xsXUlcc6uExFYtca3aCMi1YkY8Umr/GHxxqmbeyASkaSL
	pqUzSIXT5hsC+w4OJRXyaWHLrYcDt+UoW8JaDPqn8=
X-Received: by 2002:a05:6a00:1a8c:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-8352d15b7a0mr4860851b3a.11.1777788174683;
        Sat, 02 May 2026 23:02:54 -0700 (PDT)
Received: from vini ([2401:4900:8fcb:edbd:7155:edb6:dac:107e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835293f022asm4700468b3a.45.2026.05.02.23.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 23:02:54 -0700 (PDT)
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
Subject: [PATCH v2] selftests/mm: ksm-functional-tests: fix partial write handling
Date: Sun,  3 May 2026 11:30:30 +0530
Message-ID: <20260503060234.644650-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502005702.593878-1-agarwal.vineet2006@gmail.com>
References: <20260502005702.593878-1-agarwal.vineet2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update write() checks to properly detect and handle partial writes.

Previously, partial writes (ret > 0 && ret != len) would return
-errno, but write() does not set errno in this case. This could
result in returning 0 and incorrectly signaling success.

Fix this by:
  - returning -errno only on actual failures (ret < 0)
  - returning -EIO when a partial write is detected

This ensures partial writes are treated as errors and prevents
false success reporting in tests.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>

Changes in v2:
- Fix incorrect use of -errno on partial writes
- Return -EIO when write() completes partially
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 9a8c852acd68..c80254cda926 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -507,9 +507,13 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
 	if (write(ksm_fd, "1", 1) != 1)
 		return -errno;
 
-	ret = write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan));
-	if (ret < 0 || ret != strlen(pages_to_scan))
+	ssize_t len = strlen(pages_to_scan);
+
+	ret = write(pages_to_scan_fd, pages_to_scan, len);
+	if (ret < 0)
 		return -errno;
+	if (ret != len)
+		return -EIO;
 
 	ret = write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms));
 	if (ret < 0 || ret != strlen(sleep_ms))
@@ -531,8 +535,10 @@ static int stop_ksmd_and_restore_frequency(void)
 		return -errno;
 
 	ret = write(pages_to_scan_fd, "100", 3);
-	if (ret < 0 || ret != 3)
+	if (ret < 0)
 		return -errno;
+	if (ret != 3)
+		return -EIO;
 
 	ret = write(sleep_millisecs_fd, "20", 2);
 	if (ret < 0 || ret != 2)
-- 
2.54.0

