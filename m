Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601294;
	b=QuVATP37U+upMsg68xHfRMO5klvPS6q6TtCsLTQU9+o+SpgA0FtgUhzYvTab0p0/6+at
	 e8cyRAA78Y2C9y+mHC2sj9mTCr0J6pv1UEp5jPDILFD8Mfw93ELn0Dns/YiqtZQrIWnxz
	 LzUhVPQYlzyMMXasQIXHuqBe7tJoAWO1thnjOrVgmLrTYCleSlxkEy+oMunVcZKEOzMx+
	 F5x1NNLfy6VqhMwzLX4ifBN/vfTeCKaIsEZNutK8xNoWu/2suudW/sksapNFYm0dlaphn
	 meNOXzN8SaTiF6Bb/AVWPRVuij9nK5LsksgHUtHdouuEaV9sWe4eXbzMaJ7rlDdoH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
	b=Y4uCpwq8/eFez7xvvNz4ekUxpQZlPhdbJg7OtbxGWpwEZLQzU/mDtyy8doMDsmtNsVVH
	 46V/s4QrWkr0vtjVvBZimHFiucMaDW4GEMX5rS3gQcAIuKwwEhhiohyH4Qpe2z0hHr2Tp
	 Ns3YZOndo8PcSjNI92d2cOLTt5HO/2eNCYde5OM4kje7EKIYi8IjwR7aUnbO0gAgb8Hur
	 tG6bq3OJwKJNPT3AAuRM3VHvpQ58+osUMY9KgCj3YjE9T4fIcFvxs/+OW/O6EeH1tQVXQ
	 M0UVhayEp4oQ1yrorjT95BSV7nyIE7KOUBH4meGka5/weqKvDMr0MQb86izDa2X68xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt4Yp0AB;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761F606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0761F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt4Yp0AB
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso367561eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601293; x=1793206093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
        b=Wt4Yp0ABVW+4BLVnDmXGHgWq+ks71wPVWpo3al2hAuzXhfKXAS1ixU4sCf7NIQJiWb
         NSn79iNFs1WUjqQahECsu/wgVMunSQ/nqGuhT01p4cSt5AnHenOnEAhbEtpa9K+SQzne
         z4kA+V5RHC/rDwH5cAhqOVhTplcPLIcMxelGGhjziaLDg6LRQm0vnhRGHfz0xnktshgy
         WiScW9Xdda+JKYsejEJuNP8AIfymqqGPSwq3kcQaeEMDvLv/10ZnXljnKDuXDUAdU9Fu
         v6Efxxg8bFqBmFtXC2ajzi9PBR2bnwmbAMPNsqnVOvliIw6atESLVbASO0E0FlKx54W5
         EzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601293; x=1793206093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXeINQ4QIp7Up68Y8ta4qvgRYMF1gZWIV5kShFfvhqw=;
        b=MbMWhGRqe70kVBv8ajYDijVPuYLq7B1zjs9DMd9V3lGRytUeTRekHktLoh2wSpBbEC
         tdkaGSQY/4mw3Ly+4qju1ehT14PGo38C5RWYhWWPYMtO/kVLSIzn9qcoTXMzqP6b5sc6
         09e61asVW8y08A7JRHGtWtKaeMWGF47CieUdsMmpObRCvW53lC/IEB2CtnBIZMXN6OOu
         I/lvECpv91rCLGbAeSTOWIz30kWBox/9uxtcrX6V7Fkf9TFTY8vezg+AtDlHvjnd7p36
         iEN0Y1evc1pw9KDUNMUFl4JQF8ODSji2qDFNmKP6V3XC3T1c+mewA+HHtHvlSwHJ9P08
         S+0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOo7XaPVPq7l2fxfoee2/ez7jduorNmbpx9yA4Cad3FAzc6oeDWwABWLO0LSMvqn/qKRkxSETVDok7fzxBxY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVHxX6DNvLvSZo0xHOtyoTz18Gz/mQb/b3I6OH8ny/MmcqOslm
	jrX5rYJ3OAkAjJ3gz5uUo7S0rTzuiMBhYhF3CVOQuAqHeVQugHWcEvXQSTfaxV6m
X-Gm-Gg: AYBFou0VkSHOrB1DuYhrMLtciEYwtGmJQYx/ZYI6O6dP3yAguKSwPzwNc/HOQwtRBNm
	3RrwnJQ16/WDF5Wcc1rMTiGuAUraoFhbCP0Ix+vGWDcBw/LtZF5kwRtUPnjTUQyrVkURd9EAgfK
	0GLmoozrixCLo74cTwmXLhANYryJJZ4pP3WD6Y2FQeWjpZHSfXmrOgVHGGeJSfMOP6cFmbqb8sa
	Sw4KXr4aLy8/y3AS/o2nqBhf/D9myEchydY3ZuqdI9Ze+Xcw8SDeUPzaWgsduyl8M39kLywHOV/
	WlvuqsCDAFPQuFe9HKWz7yHR1xnjbMp38cyKv5cx2BRf5dEsUa0g9fg6mQUIYBUqJkApuEgwcXE
	s+YmKI0EDPqymMFrle0H8xRm5yNB1kx3+NY3fLUhIMuvXs5LXnamfRmGUpNLTiYfWXxfiHPY/qk
	u0QQyXdstQhN6zNJk9OgTi4sy4PC4u0RxS4yu8oiokFPOAh0aA3WCsNRkya842ioI2zS1bxfi+T
	woNfsfOED25HpWjxrieXLpwceVav3uBMBwZYm6UaOv/0KoQcBnwgmPwtfKPeSu2371Ia3EXzdO2
	QeVXrXRKwmbI4EvCgPPtMw==
X-Received: by 2002:a05:6820:821:b0:6bd:f79e:501c with SMTP id 006d021491bc7-7093f8b08f4mr1720613eaf.16.1792601292924;
        Wed, 21 Oct 2026 09:48:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5ebc240sm2352610fac.2.2026.10.21.09.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:48:11 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Gregory Price <gourry@gourry.net>,
	"Liam R . Howlett" <liam@infradead.org>,
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
Subject: [PATCH v2] selftests/mm: merge: keep the far mremap() targets in the carveout
Date: Wed, 21 Oct 2026 11:48:10 -0500
Message-ID: <20261021164810.45846-1-danishkhateeb03@gmail.com>
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
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2:
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

 tools/testing/selftests/mm/merge.c | 39 ++++++++++++++++++------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 7dd2933417c1..208ad7e340fa 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -22,9 +22,18 @@ FIXTURE(merge)
 	struct procmap_fd procmap;
 };
 
+/*
+ * The tests map their areas within the first FAR_PAGES pages of the carveout,
+ * and some move an area FAR_PAGES or 2 * FAR_PAGES pages up to separate it
+ * from the others. MREMAP_FIXED unmaps whatever is mapped at the target, so
+ * the carveout must cover those targets too.
+ */
+#define FAR_PAGES	30
+#define CARVEOUT_PAGES	(3 * FAR_PAGES)
+
 static char *map_carveout(unsigned int page_size)
 {
-	return mmap(NULL, 30 * page_size, PROT_NONE,
+	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
 		    MAP_ANON | MAP_PRIVATE, -1, 0);
 }
 
@@ -73,7 +82,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	/* May fail for parent of forked process. */
 	close_procmap(&self->procmap);
 	/*
@@ -115,7 +124,7 @@ FIXTURE_SETUP(merge_with_fork)
 
 FIXTURE_TEARDOWN(merge_with_fork)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/* See above. */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);
@@ -660,7 +669,7 @@ TEST_F(merge, mremap_unfaulted_to_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -721,7 +730,7 @@ TEST_F(merge, mremap_unfaulted_behind_faulted)
 
 	/* Offset ptr2 further away. */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -785,12 +794,12 @@ TEST_F(merge, mremap_unfaulted_between_faulted)
 
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
@@ -870,13 +879,13 @@ TEST_F(merge, mremap_unfaulted_between_faulted_unfaulted)
 
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
@@ -1035,11 +1044,11 @@ TEST_F(merge, mremap_correct_placed_faulted)
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
@@ -1075,7 +1084,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1110,7 +1119,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *                  ptr2      \       ptr       \       ptr3
 	 */
 	ptr = sys_mremap(ptr, 5 * page_size, 5 * page_size,
-			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + page_size * 1000);
+			 MREMAP_MAYMOVE | MREMAP_FIXED, ptr + FAR_PAGES * page_size);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	/*
@@ -1168,7 +1177,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	 *      ptr                     ptr3      \       ptr2
 	 */
 	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
-			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + FAR_PAGES * page_size);
 	ASSERT_NE(ptr2, MAP_FAILED);
 
 	/*
@@ -1203,7 +1212,7 @@ TEST_F(merge, mremap_correct_placed_faulted)
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

