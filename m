Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACB2D6E58
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357451; cv=none; b=LvaYefZfgrXq/gQ1uMCXYicHCtRm5I04L3A2ZcKBa0DcynWXVFucOWPBJdSXB9A+OVbNJ1SQxWv9o53Hsj0QqBFEbyj9yOe6VcmOCHaL94trc/pVQ3qcUKXFxhjA/uD8RqjJ6WRekaie8uCbLqQGjnVNQNmbd/Y0S+4QDP3rZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357451; c=relaxed/simple;
	bh=G5pZnsK3YRw+anFbPEqRhBrG/5spNqtr4N8O17T6kJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBD6bu89xVjBRcZLmFbj9XKsh/CqB3ulTPGZ0JgInQw7/vHjNEjdNpNz/BVlTPO/D5zQLsHfCArIMaOFMPMdbJWXsI1LQgFWeuSLFPLTNwvndxQFPmiH3vL1l+y6gT5bGxOZHnMBZV3/BSChvpeP4t+cWhOq4rWuSKJh4fDkNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxXfeHoA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxXfeHoA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f69a286dbso8310001b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777357450; x=1777962250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCR2byQYfe0lorBCX0yQhVcHegZI42GX5HyJDRNPA3c=;
        b=NxXfeHoA1pK91VDoaNFCQ8Z7q9Jwp5JHGnyOQPbVOp+r/mDZ9T06K2hwcmZf3CyalU
         5SYGtLydxEieC2RjJZONODHB12F0f5evKGCFAUYR2dtNoOIwwPzgxZsdLTPZto9PHuAv
         JWrygT5j3DAkCakTMJwmpt3/FsqbEBYQHbDJWeM98JOgeuhqQvyFtdfX5ISCD6xGNSWJ
         tP4jFviqgkek3fc6GWgOyt3rq8pTEOCYYedWINAgqTuBJOTh8dLViRfH7Bmv11BeCL8I
         0BacmCh+YEshEKDGZ+jr/+m8j3w+0QMwWl0yq+ylyxwcA9f5a47qUcsRtw8FS+nuvfff
         5K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777357450; x=1777962250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCR2byQYfe0lorBCX0yQhVcHegZI42GX5HyJDRNPA3c=;
        b=axGBSbCrh9Ni3MOgPHxy03iViZ5AXkMSwsZSS3gGWAGYsl+BJyYJABk2MsG2I7Dko4
         RkBT5jzpd7wQl/2b0hJVPgVYMnt8wFuujFAHd1FxKym+PG2iPoKpuWNq6NcjspJlBiHc
         McYm+83Nm6KqvgdEPBa9lJNXlxYw4EmH851PxeyWasUxpqfT7RMgsZFJsiu2mwb/8l0L
         X3srdrAWOOWJrXaIeEKZlbweDkxpZB5i5jJZS+vxgNQlfOsn8zUi79PZyTal+J/gvowO
         f9YynfQDnRxQ/hfReJgbvfJnRYWq78HSQoMlWLorsa0TDuP8XWkPoaEHW8LgxazP/6Ls
         5bBg==
X-Forwarded-Encrypted: i=1; AFNElJ8V7gJoUz51WT4D7cEPHTLbu5/bb9VAZ2qgBhsCbPfH0J7+a6JU2OV7sJsOE3VW4U3kxRkrjVQCKNZ1mxEwVz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8R3N4FQpXSNeOBbYH9PPDFeYdjB+giQgnCYYPpzyiXkHnCUT
	JEBf9Y/jNjt/mv8zn95Steuw8sSD+scCdY+w3dLqZGVOtDaS06H71DGV
X-Gm-Gg: AeBDies2IRnQey5ErC69eOb6QxakM+GiAN70DC2icR7Fekt1rjwaeLxk1GR7uEiebBN
	jezSaUCmWvIXEGhRoSgyoUZjIKEMO11P6sKS8zqgL9pYFYY1gWzeB8tJf7wTG6n0A3iWiwAqEl+
	ZVCa4e992hMlJBO0L68BFZ57Ddh+rtHlbTtw6WsUha2ne5n8AAjdtJuFxanrutFaIoPg4vuC50I
	4R6I389aNxaVsJuJ2yBpRBbwKtwH+L4GQkpSlWbI/XBlND/g7pAtqWgac08ZQCJx/5soi5qJIPL
	ki4uQpCdGxWW6xljgt7M7+n0acZQyeHwy9uBJMcioqMvRkg7aHqE9x+1TpAtQ/yMTAr6GsghPqr
	ekH2612sJULtuBfblC7itBIZEsacccgHlv9Tnaa/AG1oYyEPeePByO+eW7oHN8xWOSTrNVbkwvs
	Gxqe82+m2JLcszXsNziV9vpO9zD0wyZKYRKE2FawJv
X-Received: by 2002:a05:6a00:bd0d:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-834ddc2d14emr1807018b3a.29.1777357449562;
        Mon, 27 Apr 2026 23:24:09 -0700 (PDT)
Received: from vini ([2401:4900:8fca:e7b6:f223:6319:a79e:7616])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2249esm1514843b3a.21.2026.04.27.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:24:09 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH] selftests/mm: khugepaged: handle partial write in file_setup_area()
Date: Tue, 28 Apr 2026 11:53:22 +0530
Message-ID: <20260428062322.20417-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

file_setup_area() writes initialized test data into the backing
file used for collapse testing, but it ignores the return value
from write().

If write() fails or completes only partially, the test continues
with incomplete file contents, which can lead to incorrect test
results and make failures harder to diagnose.

Handle partial writes by retrying until all data is written and
abort the test if write() fails.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..c13f06758750 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -369,7 +369,9 @@ static void *file_setup_area(int nr_hpages)
 	int fd;
 	void *p;
 	unsigned long size;
-
+	size_t remaining;
+	ssize_t ret;
+	char *buf;
 	unlink(finfo.path);  /* Cleanup from previous failed tests */
 	printf("Creating %s for collapse%s...", finfo.path,
 	       finfo.type == VMA_SHMEM ? " (tmpfs)" : "");
@@ -383,7 +385,19 @@ static void *file_setup_area(int nr_hpages)
 	size = nr_hpages * hpage_pmd_size;
 	p = alloc_mapping(nr_hpages);
 	fill_memory(p, 0, size);
-	write(fd, p, size);
+	remaining = size;
+	buf = p;
+
+	while (remaining > 0) {
+		ret = write(fd, buf, remaining);
+		if (ret <= 0) {
+			close(fd);
+			munmap(p, size);
+			ksft_exit_fail_msg("write() failed while preparing test file\n");
+		}
+		buf += ret;
+		remaining -= ret;
+	}
 	close(fd);
 	munmap(p, size);
 	success("OK");
-- 
2.54.0

