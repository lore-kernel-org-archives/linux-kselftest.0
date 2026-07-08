Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B176F3BB9F3;
	Wed,  8 Jul 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507072; cv=none; b=QomtjosPZ/rNU4l40r8MCofQSVIkpmbU7GrNy/FHocIPtt35z6yYsS761exolQkZeKHzWfVyC1g0maHFWXPpr6DAB0oOyd0rQX6P6LFMIB2GLmqeF5YnWshPsQNWAFeMVRP5nlietnDiANP/uS7i9aZCUwoUXqnAZkD9w8ssHNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507072; c=relaxed/simple;
	bh=2777Z2cyC/y/pxFwipwNwnmT/UhgeaQZwxJ2MXWrNLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rLDQRH567n+pOBcPQoGp1hC/thzvR6ztexVchmagV81da3uBxwNlAc4XkkwsXfHQEyEK6/t0UIFpiGYvJNOxn2996zKmmSy4TOVHebgdDR1viHJ511r3S/9lYWCuLngytwSLDq50Sm6pfkHbxt86c/OaMi8cojvtc9+gOHE7/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 06c9273c7ab911f1aa26b74ffac11d73-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c23825d5-3195-491e-8317-821eaef60e32,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fe6896bd86603073a49c39b8f3e94cdd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06c9273c7ab911f1aa26b74ffac11d73-20260708
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 209197117; Wed, 08 Jul 2026 18:37:32 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: jgg@ziepe.ca,
	leon@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/mm: Fix memleak in migration benchmark
Date: Wed,  8 Jul 2026 18:37:05 +0800
Message-Id: <20260708103705.840679-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several early return paths in run_migration_benchmark() skip
hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
label.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/hmm-tests.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index e4c49699f3f7..e8046675a0c3 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2828,8 +2828,10 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 
-	if (buffer->ptr == MAP_FAILED)
-		return -1;
+	if (buffer->ptr == MAP_FAILED) {
+		ret = -1;
+		goto cleanup;
+	}
 
 	/* Apply THP hint if requested */
 	if (use_thp)
@@ -2838,7 +2840,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
 
 	if (ret)
-		return ret;
+		goto cleanup;
 
 	/* Initialize memory to make sure pages are allocated */
 	ptr = (int *)buffer->ptr;
@@ -2848,11 +2850,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 	/* Warmup iteration */
 	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
 	if (ret)
-		return ret;
+		goto cleanup;
 
 	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
 	if (ret)
-		return ret;
+		goto cleanup;
 
 	/* Benchmark iterations */
 	for (i = 0; i < iterations; i++) {
@@ -2861,7 +2863,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 
 		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
 		if (ret)
-			return ret;
+			goto cleanup;
 
 		end = get_time_ms();
 		s2d_total += (end - start);
@@ -2871,7 +2873,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 
 		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
 		if (ret)
-			return ret;
+			goto cleanup;
 
 		end = get_time_ms();
 		d2s_total += (end - start);
@@ -2886,8 +2888,9 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 				 (results->dev_to_sys_time / 1000.0);
 
 	/* Cleanup */
+cleanup:
 	hmm_buffer_free(buffer);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.25.1

