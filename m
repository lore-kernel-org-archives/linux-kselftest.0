Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792545574;
	b=cbD8UkRNbU2lUGQ0LF+hHSLq0C7cteYwaBkXO3d+hVufYWztZWcFhO4QJhtJmsvkbFd5
	 gYJ0jR0mgdSAr1MtbzFsgXwIiUcEiL2g9zohWhPHPh9rA3u6W7WkIjXO5lvJUWE4j5isz
	 +32OJh+N5BzWQPQlb3i1tn5fW2ZqOnch3kQPzQvwq9SGwC9OPJTAEfdC/tcAZidKIotlA
	 /YmyKEGmXjpEpLPi18jIf4cxVh5RwUV9S8Vki+4Wyrfckk/IciVD6dcMgAjoOM669bOhF
	 5OzWDvVeh6PuheX1iEDZJP/UaQ13hMRnoUN+Loyuw5OZKJV0RVveqXPbvZCq9/2J7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792545574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
	b=VXor43LROkZNaU4mjvw/j0RHGPyJia9yunVfosN2CL+lfnonmxlI9oDfP5fl3j9D6zkU
	 8TZzRaTJIOliJdtEK1dMUdtuEzugctMtPi81ZUUbR6I/JRZYvuSTrOBV5WcHw4/q4lIoW
	 SNTU2Ln98VRUQz3KG7g79cNu/SK7+ViK/FR6kHnok5zp1Bvsmhw1nqb/OGvoiDV8PjUQQ
	 tT688f/IodrdpipU19up+EbUi827a3pI9KpYSPmje/TvdSUk1AfChEQ9Tsru257yQ80dt
	 KrPTdpd4G4dGGckUE8pXFmH1dZLpxN9btLJH22j4wdl7Drp2Ur0lxmdC1kLluD24Qcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xlqq5oMp;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4324606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4324606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xlqq5oMp
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d7c729fso121515b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792545573; x=1793150373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
        b=Xlqq5oMpf943Xvhb8O1NkUrqlJd5lq0Lj6dM6tztMTEG7kJNzXT09ydQysJVVR6VPj
         n3q05dIcDoD8LbhPLi9TrwC16oir32LJRYhm6V5/HD90tQSVDrPtv4cw9YLWs3vGhoDn
         apt40jNR0n3sTZwjlN/s2FOe4SVsU6T68STpvy4VZXnWfSE7lQJx4bLS3VkOK7Dguo5b
         lP2IAEAhOLKm1sBNQg+/j5qZ0Lj0eURG/6o4Wtu9Dc/dDrPXS39BAPA6zjVCbLEzKQX1
         dZi33cLXtogq9iItqyNmAxHD3WL0LjbkoU8faiWczhQ+xmM73fLm1CXCD41LYV6jgX74
         ss5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792545573; x=1793150373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGhEhiwx/DAjk4ecDWk0fGMz5/0MGUCdDypcHzAbbM4=;
        b=kyQDzJ07QEjNPVZISBEhXW7lizqx86tYHPXfQOjTpfSYXF3Ik4nNuyfuLgTifSPda4
         eGGCGV7lQSGqKaMVsHZbwehwliPhyOI6yPqu4/WgUQfRX3FoThtSHRXp4nSgac/nq8+X
         ry0yINYfjZRAiAO9YyCQ59t6grNaP3ypIqHEkwMWHQYSRc1bEijrDnWcQsSkDlhJAFPp
         +iad6uUE8Y9PEeIpA5JfSg7ao1APaB8fRhBZxxY4DiWHx2rq/kXwWyZAcRe3iInCCs5/
         8x2GLpSfZB0ZZ9QuHA3JUqbodU2zKGelJrzCKfB2Zx1uKw4jUH/ynlOeKWwLFuzDwZ+A
         VDdw==
X-Forwarded-Encrypted: i=1; AKwUvByzK8kPePM0wR0F9bw8g4A90JPlxZNjUejB2BUFBHiCUK5meTwt0UCMcGSyRnC0BxnjMAmtDqk+qMa/ydcIEcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGQF0SgFTTdJLVmfP32XqYLnaep5Ku5U29lDkQPwkMStKhS6zU
	FXyc5u84biIoqpcZuPvgDHMNr9xiZrcKF41DpZrge6t6k4i8fWsEx5ik
X-Gm-Gg: AYBFou2QPormn9rOunalzeR0eNjDxtG9objA5NVNQ/c+CRUqkewNYRVgzqcbmPQMhnu
	2TuZvTp6fIHFRqmqU7whTyXiucZ36Qu7xLnuI4uVEJG+q471Ws3UJwwljJtv270AmuPXp6bhikI
	u9+lcOA7tLTQxKEORbTj85hFJb0d01UGeO4JupofKnAxTqhUx14T0NISg4LUPl7PtvXyWsmAhph
	fgeEx1kgi7ba4DeuRZ9Cxv6R5gQh1oq9tyz8a9DBOw2pue7OEehRZyoPKIi35x97g5nGGSDmpkM
	7bWyexvIAP6JCQ+U6PLHexX/ahXvFL12T1OC2Vab4u3gl/b3uOpBdRJgpb59UW51W8oIR4dPe/6
	V+znbbG3pgqW4PGIlhdZ0vKM2i+Uy+2tvpRriYFD1Kz7T0Apox1/F0lGn2N+3np6bSSWjkWefQb
	KZztuOEfj1e43Ryo0SheEz/DPcrklaQToq8ZSC8opR6czFzS0rZbABnWQVTHRiTOZ85CpQQUyv5
	0u0CGfpxF5NTHgA8VYMoldaYvOCVPBuahsnpVa4wZXV48b9jD3Kwm82ArvEZtZYzLzj+mHpOKkw
	4w8ilX3iCwE33WNB8+dbcA==
X-Received: by 2002:a05:6808:c40a:b0:552:9d62:f1b6 with SMTP id 5614622812f47-5535a767ef3mr353032b6e.51.1792545572736;
        Tue, 20 Oct 2026 18:19:32 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b4104048sm800659b6e.5.2026.10.20.18.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:19:31 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
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
Subject: [PATCH] selftests/mm: merge: reserve the far mremap() targets
Date: Tue, 20 Oct 2026 20:19:29 -0500
Message-ID: <20261021011929.89150-1-danishkhateeb03@gmail.com>
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

Make the carveout large enough to contain the targets.

Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested under virtme-ng (9p root, glibc 2.44) on next-20261020 with a
    KASAN/lockdep kernel, three runs of each binary:
    
      merge before:  pass:22 fail:4 skip:1 (SIGSEGV in ld-linux-x86-64.so.2)
      merge after:   pass:26 fail:0 skip:1
    
    A /proc/self/maps dump at the first far move shows the target inside
    the text of ld-linux-x86-64.so.2. The same tests crash under virtme-ng
    with v7.2 and v7.3-rc7 kernels, so this is not caused by a kernel
    change. On the host (glibc 2.44, libc mapped 2 MiB aligned) the results
    are the same with and without the patch.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/mm/merge.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 7dd2933417c1..8291c208f0ae 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -22,9 +22,17 @@ FIXTURE(merge)
 	struct procmap_fd procmap;
 };
 
+/*
+ * Some tests move a mapping 1000 or 2000 pages away with MREMAP_FIXED, which
+ * unmaps whatever is mapped at the target, so make the carveout cover those
+ * targets too.  Otherwise the test can unmap its own code, such as the text of
+ * the dynamic linker.
+ */
+#define CARVEOUT_PAGES	2048
+
 static char *map_carveout(unsigned int page_size)
 {
-	return mmap(NULL, 30 * page_size, PROT_NONE,
+	return mmap(NULL, CARVEOUT_PAGES * page_size, PROT_NONE,
 		    MAP_ANON | MAP_PRIVATE, -1, 0);
 }
 
@@ -73,7 +81,7 @@ FIXTURE_SETUP(merge)
 
 FIXTURE_TEARDOWN(merge)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	/* May fail for parent of forked process. */
 	close_procmap(&self->procmap);
 	/*
@@ -115,7 +123,7 @@ FIXTURE_SETUP(merge_with_fork)
 
 FIXTURE_TEARDOWN(merge_with_fork)
 {
-	ASSERT_EQ(munmap(self->carveout, 30 * self->page_size), 0);
+	ASSERT_EQ(munmap(self->carveout, CARVEOUT_PAGES * self->page_size), 0);
 	ASSERT_EQ(close_procmap(&self->procmap), 0);
 	/* See above. */
 	prctl(PR_SET_MEMORY_MERGE, 0, 0, 0, 0);

base-commit: 59d7f9ec14ad4b6f38c04d254f8f2bfb991e888e
-- 
2.56.0

