Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7034749D6
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312728; cv=none; b=STGMneyaRnEqH6I2jx8LxoBuzTSS6Po5oMyXyVVPSQDCJXViLehI7IxDCqfzvmQ+KDGBpxrN4KuYM5wLEKc+BH2tAc6C9Ko8aoI2Rl+Pt0u1kPkXlFYagQTSfftvFmfYS4r0Ubb4PfGW0MfgNPGRlRW3TNt4T/jZxs8LyCjzZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312728; c=relaxed/simple;
	bh=gmpADQjqRAeqL6GeAdarpZCon3lnJxV4Ps618bZVbQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otpuImeAs31uiTLMy03WDuwBD8s67ZCogl3a5lGb9cwZmFZU2AEOl2HhLTy6vKqwi/DbxWfF2IfV5m6kip3yfjLqryEJ+rc/p35rE57Gzya7WMCbXJdvjGjBxFk2XNCSOMDgOGtQT7TgYgD54xdgTa5f5f7wrjpxcBqgHPm1V9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lROOrJnq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lROOrJnq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so12258205ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312725; x=1787917525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSy4cnyR4S+sHUGi7h02BTfopN89+3p/alRrTWBOPrA=;
        b=lROOrJnqLHU9rOcJq1AiNJODelouTnuFrSCXR7s52JHkITQcm/l7z/LIvkA4YsBzT/
         dRd9rmaoBiARLqkZMzkd6ipmskn5iMEXjqtgHBVHMivWMTexQzjE8fzcCV0nl833f71f
         FwcdUFLWPeuRPoWuk+K+6dAjSdmPpORlsa5k1se3GCSedG0bPW+htn14wyL80UnxuoJV
         xjpGPQlEfzGgnDljj/ubd6fgfLtMHj8aSkZUgnzuC8GemOCYyB1wV9IbgQl4MjC1fTXj
         FHj+wxwULcW6BYe4yJXi4THul4uI+qOivovSW5WB1ES3yvmcFuGgloF51Xt1XMemoHfi
         31Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312725; x=1787917525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSy4cnyR4S+sHUGi7h02BTfopN89+3p/alRrTWBOPrA=;
        b=qzoI+a4kREraZZMvFjSX2y6XBuFFOU++KtcJV8rseH5pFL+viRd6ooNJ9wv/nMv6+M
         cbNq0ckYFDQOQJYj7ZIJrQIiTmEU+O6l4C93KI3GvLPf1kpxI2BGgIoSBAmrQouQoDxY
         ELQsxs6txFtIvodTrHZpXitLLUVUP/eKa3r1yZ3t+Q0fDtSXzwUoz+Jju8c+Z07ler/y
         SSeiPIsm98r/1ga/huixnw6BD7NQlbPQucBHX/AR4wRXt8aLmNDfqG7rgSn51ifHn52/
         bA769QM2+Mpf28p68c0HaIDfoVF0ORdT9gypKFeycPDdRvAcFDfxXrDdqzIxGotkH8wH
         MISA==
X-Forwarded-Encrypted: i=1; AHgh+Rrn3Ty1pZvvwhKjZ8daD9RSZsXAvWDBiW9OrAYTgcSGwkc8qgxKo63qQRGizOOQeydwQq7Tqoc3R/BhDDbyKBA=@vger.kernel.org
X-Gm-Message-State: AFuF++kMGv5XYqtykBDFCxMZkJZLaVrNWFxf7R8O5+Ya5TpbkTDr/zG/
	dL1OuHOITfvS++bfdJvKadSrkvQ+kQNxi+1DqunfY8EQjvLK3NcG7N90
X-Gm-Gg: AR+sD11LCa4PPkDCpGCmzl0m3EZ3xPxaPQ46tjIqyNhye2NX+dUOZwJNfsrQ9g3vZ+X
	Ln5plEhYxnxHS55LbLSUqg14IKbO8GAmlEXWRgxbWiIdzkw1YjmRZbyoOiifX2vvaJ/sV4CQ7we
	WJpbwKtJUgf93WCIHhIOw750A3gDcWcn1GgcK0jres5vDp8KoiiqGDBzgxIj/RHuxeo2skTV/gb
	rHShXjtT1mGvvIIk9yIbppUpx/rlr6e7z4FIXFVXJ55de55sQIIMA5X5GNaYBGLBwHV9VqDo9hP
	O3+OqPNNkEDUIIEhDAX14/srIo83Y4jItdzjgC00ZFLhUzBVGsLq9+C+bGDGNar5Ps76WVigeK6
	3cPeZXwPb/NilNHwYA7XLPbhhyH3B67vYin2qbU8yQHXEmOwdpWz9ekAB0NkC/6zVSyCUxiDTWq
	pqRlxujBFR5Ana24qLYHAUGTwN6ItbvVNe6f08MJjk2XutOHoCE6QoakRc08Kp0YPplBWhVG4/8
	FVBKc1Otfkm/Qj7qsSLMDvX1lg=
X-Received: by 2002:a17:902:fdb0:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d64b0b5652mr124872615ad.14.1787312724901;
        Fri, 21 Aug 2026 04:45:24 -0700 (PDT)
Received: from Anshuman ([103.161.223.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c946293dsm20771743eec.22.2026.08.21.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:45:24 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anshuman <anshumantewari123@gmail.com>
Subject: [PATCH] selftests/mm: check strdup() and fix buf leak in parse_test_type()
Date: Fri, 21 Aug 2026 17:14:16 +0530
Message-ID: <20260821114416.12255-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of strdup() is never checked before being passed to
strsep() and strcmp(). If strdup() fails and returns NULL, strsep()
returns NULL as well, and the subsequent strcmp(NULL, "all") is
undefined behavior, likely causing a crash.

Additionally, buf is never freed. strsep() advances the buf pointer
past the first token, so by the time buf would normally be freed,
the original pointer returned by strdup() has already been
overwritten and is no longer available.

Check strdup()'s return value and fail cleanly on allocation failure.
Keep a separate pointer to the original allocation so it can be
freed once buf is done being used, after all parsing has completed
successfully.

Signed-off-by: Anshuman <anshumantewari123@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 10e8dedcb..a84fb87bd 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1110,6 +1110,7 @@ static void parse_test_type(int argc, char **argv)
 {
 	int opt;
 	char *buf;
+	char *c;
 	const char *token;
 
 	while ((opt = getopt(argc, argv, "s:h")) != -1) {
@@ -1135,7 +1136,10 @@ static void parse_test_type(int argc, char **argv)
 	}
 
 	buf = strdup(argv[0]);
-	token = strsep(&buf, ":");
+	if (!buf)
+		ksft_exit_fail_msg("Insufficient memory\n");
+	c = buf;
+	token = strsep(&c, ":");
 
 	if (!strcmp(token, "all")) {
 		khugepaged_context =  &__khugepaged_context;
@@ -1148,26 +1152,27 @@ static void parse_test_type(int argc, char **argv)
 		usage();
 	}
 
-	if (!buf)
+	if (!c)
 		usage();
 
-	if (!strcmp(buf, "all")) {
+	if (!strcmp(c, "all")) {
 		read_only_file_ops =  &__read_only_file_ops;
 		read_write_file_read_ops =  &__read_write_file_read_ops;
 		read_write_file_write_ops =  &__read_write_file_write_ops;
 		anon_ops = &__anon_ops;
 		shmem_ops = &__shmem_ops;
-	} else if (!strcmp(buf, "anon")) {
+	} else if (!strcmp(c, "anon")) {
 		anon_ops = &__anon_ops;
-	} else if (!strcmp(buf, "file")) {
+	} else if (!strcmp(c, "file")) {
 		read_only_file_ops =  &__read_only_file_ops;
 		read_write_file_read_ops =  &__read_write_file_read_ops;
 		read_write_file_write_ops =  &__read_write_file_write_ops;
-	} else if (!strcmp(buf, "shmem")) {
+	} else if (!strcmp(c, "shmem")) {
 		shmem_ops = &__shmem_ops;
 	} else {
 		usage();
 	}
+	free(buf);
 
 	if (!read_only_file_ops && !read_write_file_read_ops &&
 	    !read_write_file_write_ops)
-- 
2.55.0

