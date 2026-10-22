Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671524;
	b=FjVyI3kfvna7LuydFtO/hPQTSL+TXvkRcLbcu+cCCjZ3xdD2q+VY6O3zek3B0YvZrCvq
	 B6RTU/M8VxQrDkt/Nw5GZ4s2ZjrnTs3nm5blWHesRTfZxXAQAKBK/1dA209H8MvzoaAaa
	 WDS0aZatocrKkeIuMxSJ26ZkVCL59BNVaqvnoebsTvG/hEHV0j26c4llE8+Th6ICRvgN0
	 +aevIoY1P5zbi5OzzRAW+z+KckWMLGxvLaQxXVcdN2U4+lNJLo3ULaGmZk0eaZfyMT5pR
	 tzyB/Kmxvnztn4LKA0MUZ4I+FHlnrAMS3cpvzZKfSX3UMFBvIUml4hVnpOS+dqHmxjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZU48ffXnuc37LAObRV7DmUJm85ZVuXLv374YtKlykA=;
	b=akhViW6iVO1ahwtJvpTV496lqDyHiWvwNypItNJwWl4KtUkdC2mGJTfCi+83entuenbk
	 lvmSX392bAEUl3SKpia0nH5SQmVFfY3tk155pDPKUHd4eSBAPF6lYK8o+O6fpyZiQPFeb
	 GL24vHWaD2QehSnmsq7DXlICVwG8EP/fftHCwqo/WWSPd3XUORS9CIuptX5ZYB/DUzSo0
	 OKujmVFkofhbBA/nwQII6aERuVmtUVAXX+dVktbqn0jGWx+kBLWDzOMN7HK64Cis2Syrb
	 A9kDX8PL4gaO3593JS/bLEbHxSQ/nG5Jy3bz3LZqi2GWyJPn2IdM1mMXyu+jNtHwBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2ASOcMa;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530B606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 12:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4530B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2ASOcMa
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823b938464fso1271598a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671522; x=1793276322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZU48ffXnuc37LAObRV7DmUJm85ZVuXLv374YtKlykA=;
        b=q2ASOcManVMzJ92iTMR9F0a0jDtHq2cnRLuXEPOk9KgjUwAALFBFWNdo18KZRiCFa1
         dxie2octdDwzpCG9SLU1Du7nZzm0arzjG3iBWcSfrrCXNLC1MswGwnhwBTzL1XUR4EM/
         A06ZZngcGr0BqDyxncc6e+VZSUnfpSMhrwoRhGzUTWy3EF+pm3pkIYaBJD1q3ML4TnQ9
         /ZhQlFr1LbGguUB9F9K7U/r8fyz4qMtkYA+l/Eut5xwYORSyXvZNbvEWVY2vFt+UMC0o
         F6FU5WKRS3OEAXWApTPvXnjlgKzWGlho2+dFbkCd6qZNzg/y3e2Fw+C9viKmL1sVX5Ee
         DuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671522; x=1793276322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZU48ffXnuc37LAObRV7DmUJm85ZVuXLv374YtKlykA=;
        b=sHHYQT+XtYxZ9H1S6J15AhEopY3jt5cPjM22M69CqodE6RZ5+/YupY7QxpH9pj+A2y
         0OO3Yt+bI9dJx8MhlHLhgFwEWICGmjtJQz/NFwHLSdOZSL2m86Dl710NIoQmAgsTWuOh
         IQw9WDgTVgj3H9fdMcS1Crhs6U3aWvKuZJj8Di+MVcU3giNmUzgkov3lGZj22p74PNHm
         fZhZZOBRjJYhKM2Z22pfXx17UX2K+HhvnbLmuo9WqLKfPvTXiMRxUAjcAD+mVD5ld2PS
         4oCmGLAVvA3a7PXp0G5k6ZzhwV1d73PfCLuOduQFjO5Bt3pu4mVLlIRQXzoe95an0SQp
         FXbg==
X-Forwarded-Encrypted: i=1; AKwUvBwCqaAB/gAoRengTmj9I1nO+aFVPGs330mJj9dNshNteeDnMVagDdPAYucHNiUWYkrpQ/A+hwMDkArm0exL5d4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmF9XeWyu6+e1V2bt29hes2Q2w0kOQIQLmPdjLHfcHzmhavI2+
	WTVdP4LkB3WG1E7MpFf/rE0nK7dZHLQoGVKkvOoWTLJK+M2cirJc0X+h
X-Gm-Gg: AYBFou1UGYCL2/SFveBy5/09rdbqCsqtoncrCaZFwGEsosiCDfhh0nZw1F8VtAjRICx
	Nzn/tadS5A0vUtzYExoNalyGSxDbhraoTqNV2DBPK1rUdRfIdnG0Frr0hFuOXYpq6CbgseHFKDS
	WVhLyhSh5Y/oA6ZfJWqbbUbCt08ED5oloWlO3eUzXIwrVmS1gv8i0Ue1FtINtgbwW2vkpFEzX+7
	538l34jSkbpd/oskLh8WDcqPrML9McQwlo7UJxgG+NNx0i6fQpbe/miXxAr0qYVMy+tKdsjD9/1
	Xxfn01Ig9xR56TvQy+N7M0X3/xsHDcGRa+RIa/Ik26NbQ/hlo75Oj1ju4lWdG4H/mqxuryCp9H9
	dRV5ykxaeDKqMwOmoHZ+TalnTperqoYJWmH99Vsvp0tA5FttnEJIvzK7adEBbObvPdV47k8SJ5Y
	BpLMNbskb1ZRjE9uuzOchA5otckHYB/ctQkRpEAUTcRFcijTb9RHDwOxtLnj8Q0tROdhl5x79JR
	tWgvV2eZSLHxijpDbIH93z/96wP83bQrddtBPpSFzzOHI1cDAx8lOSqKp6V/YbqMqdRz/2s5GOF
	ofIwTKMdhJcG8JkkYsb6Sk3XNY2vROsxBV/U3PVrcls=
X-Received: by 2002:a05:6808:1301:b0:537:3bdb:2d7b with SMTP id 5614622812f47-5535d4e1eb9mr4210437b6e.11.1792671521547;
        Thu, 22 Oct 2026 05:18:41 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b4104048sm4469598b6e.5.2026.10.22.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:18:39 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Gregory Price <gourry@gourry.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v3] selftests/mm: merge: keep the far mremap() targets in the carveout
Date: Thu, 22 Oct 2026 07:18:37 -0500
Message-ID: <20261022121837.28723-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The merge tests map their areas at fixed addresses within a 30-page
PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
pages away to separate it from the others, but those targets are outside
the carveout, and MREMAP_FIXED unmaps whatever is mapped there.

Under virtme-ng, the shared libraries are packed right above the
carveout and the dynamic linker starts about 4 MiB above it. The moves
then replace part of its text with an anonymous mapping, and the test
crashes in its next lazily bound call:

  merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14

Two to four of the mremap() tests then fail with "Test terminated
unexpectedly by signal 11", depending on the exact layout. On a host
where libc is mapped at a 2 MiB aligned address, the targets happen to
land above the dynamic linker and the tests pass.

Since the areas are all within the first 30 pages, moving one by 30
pages is enough to keep it apart from the others. Add FAR_PAGES for
that distance, move areas by FAR_PAGES or 2 * FAR_PAGES pages, and make
the carveout 3 * FAR_PAGES pages so that it covers every target.

Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v3:
    - Drop the comment above FAR_PAGES (Lorenzo Stoakes).
    - Add Lorenzo's Reviewed-by.
    v2: https://lore.kernel.org/all/20261021164810.45846-1-danishkhateeb03@gmail.com/
    - Replace the 1000 and 2000 page offsets in the tests with FAR_PAGES
      and 2 * FAR_PAGES, and derive the carveout size from FAR_PAGES,
      instead of only enlarging the carveout (Gregory Price).
    v1: https://lore.kernel.org/all/20261021011929.89150-1-danishkhateeb03@gmail.com/
    
    Tested under virtme-ng (9p root, glibc 2.44) on next-20261020 with a
    KASAN/lockdep kernel, three runs of each binary:
    
      merge before:  pass:22 fail:4 skip:1 (SIGSEGV in ld-linux-x86-64.so.2)
      merge after:   pass:26 fail:0 skip:1
    
    On the host (glibc 2.44, libc mapped 2 MiB aligned) the results are the
    same with and without the patch.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/mm/merge.c | 33 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 7dd2933417c1..6def490186a9 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -22,9 +22,12 @@ FIXTURE(merge)
 	struct procmap_fd procmap;
 };
 
+#define FAR_PAGES	30
+#define CARVEOUT_PAGES	(3 * FAR_PAGES)
+
 static char *map_carveout(unsigned int page_size)
 {
-	return mmap(NULL, 30 * page_size, PROT_NONE,
+	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
 		    MAP_ANON | MAP_PRIVATE, -1, 0);
 }
 
@@ -73,7 +76,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	/* May fail for parent of forked process. */
 	close_procmap(&self->procmap);
 	/*
@@ -115,7 +118,7 @@ FIXTURE_SETUP(merge_with_fork)
 
 FIXTURE_TEARDOWN(merge_with_fork)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/* See above. */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
@@ -660,7 +663,7 @@ TEST_F(merge, mremap_unfaulted_to_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -721,7 +724,7 @@ TEST_F(merge, mremap_unfaulted_behind_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -785,12 +788,12 @@ TEST_F(merge, mremap_unfaulted_between_faulted)
 
 	/* Offset ptr3 further away. */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -870,13 +873,13 @@ TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
 
 	/* Offset ptr3 further away. */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1035,11 +1038,11 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 */
 	ptr3 = &ptr[10 * page_size];
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + 2 * FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 	ptr2 = &ptr[5 * page_size];
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1075,7 +1078,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1110,7 +1113,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1168,7 +1171,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *      ptr                     ptr3      \       ptr2
 	 */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1203,7 +1206,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *            ptr                         \       ptr3
 	 */
 	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr3, MAP_FAILED);
 
 	/*

base-commit: fcec4f4bcc1101dbd7e3aff267856b3bbfe128c6
-- 
2.56.0

