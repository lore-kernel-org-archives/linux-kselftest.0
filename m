Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335627;
	b=EYQ7WR/8GYh2aFsgAFAcPcRLp+9xcSXgJdxLDfXy+LFApp4v/hO/2CEEou+6QQlOuGQq
	 T0aFMiIS9RL4N9ktK4Yl83M1eSR6P8IZxdtRHWAc8THotduuTGWomGhRXYQ+UIAa74WM2
	 /PfrZ5MqGedgvciqBaiAxv6qxgwZk1W0+wCjoIq2FOh0ajA69pngXrVf0xEmBnByPC/6T
	 W11uIqUoyv48iC8WeBE1Cv/erAm8u455j5ZKuchZ6QTBQSfpCp7zbu2+VwT47Tngon9NM
	 D4OZEsJCBo8rtcSCq2hwXS33X/VI9uZ6Y77sN8DYfhfSoFypQ69EYZsIPyv+Vus+oAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+LgGMW7nTxTISYX0jXbZvoZG+Dao4TWx626ci6dSPaQ=;
	b=vpmH62jpj8q/ALu/L1HpcQrGwYjeDPuybHZ5jNQW4NgS0LQ2/M4pLFlX66b+QGMWSBuH
	 3JA0JzbK1Cl8D+YBocBpVHn9OP09bUAax7C7Vp1SCcyZm8vEEXz0vR/sanec8xK3P+DMl
	 vNFLlg7hULkRIWECRw0KOweOznOs9EB8Hwwr3IN92uUVHY2yKyfR1ul2DCs4dX+UGVlAq
	 CrLsj4fWYYCFYaCV3MFriJDrAw3sFp8J2+kUxqtnY1UnpLB7NWvI2s9XwBOLRlPk6BMEU
	 mOEPZlwEemv9c5mbQDW96JuOWLgOxEb1lN1ZDSB9evumrJwjJNG2xr01zBttgpTekZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pp3oXB79;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EF606A330
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 08:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pp3oXB79
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae17c536so2269109c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795335626; x=1795940426; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LgGMW7nTxTISYX0jXbZvoZG+Dao4TWx626ci6dSPaQ=;
        b=Pp3oXB79JLI44rb+LzAxkq2F70ck7chyQolda6wVEuCrbwWSqruUYXBjG61r0N2uvy
         wjLwWmy/wGEBMAmiuskahsZWVRzeG0NDGrAl9fM9pAGlp04jKHVlgJfRbKLYFea+e3l4
         ATpV0XIBcG3cHB+fSv6ufnRvnMLgvS+0XNkQF+d249J9eD7zy018hv09Xo5Kxmo8h5LH
         JaTJZB6wPJkBMhcMmHsCwEn2Q+KcnV9yDkxRWrABBX4nP7Q48ujqLqNAaNGuqttiWe9P
         WM1xXyjO/rJXEMMLgczlETtSa+jnCoaF1fVr2PMHEnGrZvcAn6gVJsP27+ydOuH3MfPn
         5V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335626; x=1795940426;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LgGMW7nTxTISYX0jXbZvoZG+Dao4TWx626ci6dSPaQ=;
        b=LKzNoVCC9RgOx3vzTMTFQxmCBxJfGLroVNDZRO4zrCQ7XYwHjcKn4oyc5tZjnwskL7
         LJMt0ts4jU8/6DIQtE4oz5jS++zYpctZzm+Aot7aeEpPrVcikfNREdBdmPlol2rt0btF
         qVF7rPbn+It4a56OIfyZd48sz9paXBJyz5IyfnRYXLJtie7aUQJ4Y8/0G+fuoK96Rw5Q
         koqqzRmDaN8Ahc1QwE5P3nMirRaqZ9UpszZDGW5oS/b4MY/6KIwNc6EgsnR5zsID52Tw
         VlEjxB1NXILIRS8um1QiSdQZtJWWv6fDnke0zwstP5LQMHfUTp6VHzrWvOnKi6WFpGcp
         st1A==
X-Forwarded-Encrypted: i=1; AL+hErEw66ubWRrEtA6eCGkOgQwlB/bbxuubJh2e6Q7hgn2h7IYBOT7tqDJQlKbVoli/3J05fP0T+KSdsdfy1sG879w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XtMFX9gl8icwSHdlbY/APFtu0/AzbKIJJuOTsIU8xLNaBwIoP
	Sx0p5YiVnp2Wxz0QZs8ytePqbt5jWqYNefAde3296m9hb48onD4C/JMxUutZOh69mVY3EWpNFxt
	Yueet45y/XVfoZuoU+8eI65Rutg==
X-Received: from dlaj4.prod.google.com ([2002:a05:701b:2804:b0:1a1:3ce6:560b])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3f01:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b55689f73amr8620553c88.7.1795335625670;
 Sun, 22 Nov 2026 00:20:25 -0800 (PST)
Date: Sun, 22 Nov 2026 08:20:17 +0000
In-Reply-To: <20261122082020.1255434-1-kaleshsingh@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122082020.1255434-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122082020.1255434-2-kaleshsingh@google.com>
Subject: [PATCH 1/2] selftests/mm: uffd-wp-mremap: skip unsupported shmem and
 hugetlb cases
From: kaleshsingh@google.com
To: akpm@linux-foundation.org
Cc: kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kalesh Singh <kaleshsingh@google.com>

uffd-wp-mremap checks only for UFFD_FEATURE_PAGEFAULT_FLAG_WP before it
runs. With CONFIG_PTE_MARKER_UFFD_WP=n the kernel keeps that feature
but supports write protection on anonymous memory only, so the shmem
and hugetlb cases fail with EINVAL from UFFDIO_REGISTER instead of
skipping. Skip them when UFFD_FEATURE_WP_HUGETLBFS_SHMEM is missing.

Fixes: b2466bb3b495 ("selftests/mm: introduce uffd-wp-mremap regression test")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 tools/testing/selftests/mm/uffd-wp-mremap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index c48eaab8e75c..f7b272baa6f5 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -18,15 +18,14 @@ static int nr_thpsizes;
 static size_t thpsizes[20];
 static int nr_hugetlbsizes;
 static unsigned long hugetlbsizes[10];
+static uint64_t uffd_features;
 
 static void check_uffd_wp_feature_supported(void)
 {
-	uint64_t features = 0;
-
-	if (uffd_get_features(&features))
+	if (uffd_get_features(&uffd_features))
 		ksft_exit_skip("failed to get available features (%d)\n", errno);
 
-	if (!(features & UFFD_FEATURE_PAGEFAULT_FLAG_WP))
+	if (!(uffd_features & UFFD_FEATURE_PAGEFAULT_FLAG_WP))
 		ksft_exit_skip("uffd-wp feature not supported\n");
 }
 
@@ -180,6 +179,12 @@ static void test_one_folio(uffd_global_test_opts_t *gopts, size_t size, bool pri
 				swapout ? "true" : "false",
 				hugetlb ? "true" : "false");
 
+	if ((!private || hugetlb) &&
+	    !(uffd_features & UFFD_FEATURE_WP_HUGETLBFS_SHMEM)) {
+		ksft_test_result_skip("uffd-wp on shmem and hugetlbfs is not supported\n");
+		return;
+	}
+
 	/* Allocate a folio of required size and type. */
 	mem = alloc_one_folio(size, private, hugetlb);
 	if (!mem) {
-- 
2.56.1.750.gf70dc682cf-goog

