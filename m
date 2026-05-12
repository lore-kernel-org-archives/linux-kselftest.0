Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FA3CCFBD
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572178; cv=none; b=WrsLtojGcuWwCD2zsiFJIFX171Isr4QfuDLOhdNxwE8HdXNp9O0pGkq5effnTNoVD/CSZCXGEP5EnhUi6GLB5RpqU6AvG38IqxQ1Lx+spFce3tocZBUsmKx7GmhbrJfsxV6lWmFnbR0CdqWn+nuDhRfqag/xlJjQ/mJ5ZVagmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572178; c=relaxed/simple;
	bh=aJUlXv0ls/scEUSinSerTGsNaphw1VhScI4b1rsDjSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLALUR38ca3l8ev8BrhFclOLa9eO/5sDvMtgaGFmyPXp1isfkbBjh48+dWO93W8w8dhSKb0D71l4MT2DoI/cQMsJU+nwY3b/uvWqu549POWR1FhHqRzwUzq4pPKKIAz6OA+yJvCJedGmynIAfuxVuHcEkMRdA/NpZ5LdiZgsGvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7uRelp7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7uRelp7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bc763e2ba8so14269665ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572176; x=1779176976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTXY4pA4hLihSGJD9owJJpsehQXc1UOF+hNlelmcd9s=;
        b=Q7uRelp77Zfq14f6mhV1WeLPM57EgRt790lzT1FNzqdvp9tlV3af1UOcjQqPENkTf+
         189RymuZsUUT1X5LRHoxRWJ0F3V4nUWoueeGoKZWcQDGlPvhDC9V0r77Lbo+vZW64ISB
         G3KEZLM1Zd4D7h3tw+6xuacQcr0gEnLfaMyQxLsDphfoRoSt4t6WSh1PiZw2ylp4kXjk
         /J+mz5CmS7+LIGzQH7m1qtMe8QtnaQIy5Fm33cU/lrJ5MDY9JOo7dzhaJvV1yRqBgBme
         zLXIhVbkqse+CmjL104yWwz35wKHd95KRD6EPBp31zK0CkrGABPU9vz91YcHa1q8aorT
         IIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572176; x=1779176976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTXY4pA4hLihSGJD9owJJpsehQXc1UOF+hNlelmcd9s=;
        b=TTiocif6s+JnAtUUfcEiGcQ3tQJwgNm/lAHb9LtyaxKDvCNRDrg7otBcopDmV3WGIO
         k8prit7fRBX//LBpJ3RyIOBd5nS5gq8KLQtxG7NWtxrwQW9/LrZAHb6eUeRrMGbrQCL/
         M72HrlIH2YO4ATgmKY5vAI9E07+eypjsnIlquYpVJHT7pCzmGv4OGSbM5EDLdl2TLFRu
         xGL2NBcHlgN4mBIU/h2NcHOBhT1VQBMS4+E8mwAR0R8ZrM+0M9p5cpczvcxLLDcQNVaG
         0ARc7kh2w5nYqtXP95nmAZ1qWQT8iy4DcrywEmq2O93CojNOwIYwoLPNfvsLtHD/HCoX
         qY3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9yOUwvuqT3w85JAH3ePls++0rv/6qC01JQl5wvdjfXcFloWsxZwXxZRGJUtDmMnUlKOnmL+k1jDqFJ2y3cJw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUj5fmcS0JvpbXJhLHv9mItiy/8Y1Fbx8qmUiZOU8olZX4MlYb
	U6HowH1nWKF9FHre7FXbNHp8N0S3IcWEjx2wJMlKh64fIF5ptv4cyj/U
X-Gm-Gg: Acq92OFd7h6XjQQxO28dCyIEM7LKUTenuF+6IT/+mnlj/tuTO30iz11UzYCHLIFnpdL
	s/b4eduSL1hM7XhuhS2xA3NcozcrUYrZhcJFDuIi99kf9WB58LjJKlAyF8LJEV62TuO1wtjFZ1+
	nSTg2xSVlhuuDucGLUaXd1plWJrBC/ufslqwGUL2Ck2evtuWuUW2w5ybW9jv5iKEclfzJcninxl
	fo0q9csvd4U5zvPA2fUObZ1FF6I7FpsQQUwP1flysusPjS2Ulga3HO9siPvfI5TvXSQD1W8m6Yq
	jafie1+n8hofRk1ZvURv06qNp2/YutHdUVJQ2yPSaJcbRhA4Q60h6NtiazVU9TqRyBiUMtikEm3
	iVigfO5c5LddrMAjdASke8SCsfaMsKoty7TpfvcFcSo9lQNU78gk4H43laC2NwQohrtkxiYFBCh
	nUe6qF/DLlh7y02mZwVLXSSsFDcoOuVA==
X-Received: by 2002:a17:903:32ce:b0:2b7:8a56:7cda with SMTP id d9443c01a7336-2bd010f53f3mr23860395ad.4.1778572176149;
        Tue, 12 May 2026 00:49:36 -0700 (PDT)
Received: from vini ([2401:4900:8fc8:73c6:dda6:576b:fa0d:f68e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm127554695ad.25.2026.05.12.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:49:35 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH] selftests/mm: check file initialization writes in split_huge_page_test
Date: Tue, 12 May 2026 13:19:24 +0530
Message-ID: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_pagecache_thp_and_fd() fills the backing file for the
pagecache THP tests using repeated write() calls, but the return
value is never checked.

If a write fails or completes only partially, the test may continue
with an incompletely initialized file and produce misleading results.

Check the result of write() and fail the test if the expected number
of bytes was not written.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 500d07c4938b..eab69b0f59a0 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -609,9 +609,16 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 	assert(fd_size % sizeof(buf) == 0);
 	for (i = 0; i < sizeof(buf); i++)
 		buf[i] = (unsigned char)i;
-	for (i = 0; i < fd_size; i += sizeof(buf))
-		write(*fd, buf, sizeof(buf));
-
+	for (i = 0; i < fd_size; i += sizeof(buf)) {
+		ssize_t written;
+
+		written = write(*fd, buf, sizeof(buf));
+		if (written != sizeof(buf)) {
+			ksft_perror("write testfile");
+			close(*fd);
+			goto err_out_unlink;
+		}
+	}
 	close(*fd);
 	sync();
 	*fd = open("/proc/sys/vm/drop_caches", O_WRONLY);
-- 
2.54.0

