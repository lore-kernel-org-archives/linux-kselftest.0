Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF18E2D7DD7
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094374; cv=none; b=EM1PbRbPg5Ny1q9aENM4hcHVZ5JNFkhdvZpWmdtZIn8s2G4UTxv4sDWSSg8WIAGYrKAHwlVzMG3gAGZrprbtlR2phW1s/fkafDkso2a0sv4SChgqIFMjRNvkOTFM03SmCQHeTcAV9+ET9XEOoN0k1TrITq8D9qxWbe6r0grEXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094374; c=relaxed/simple;
	bh=91ifg2wEJIjxKprIIwRg4nIUGRb1cJdHSKa9VgWepH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6xaKUzg0LR60H4K8uy6omC35RR+qKxj2qv33S80Tin3MjEpoT+y1Dm8Filq3xY6rsunNKtMDduBocTCRqWIVEatVrt0NLvM7NndTpAqtVmPZvVyFx5sghD/9OG5XKktg41yM7CETeMG82e3ParYE9rgATpYaIzY6fgJZqI1gZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpohCYRi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpohCYRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/pPSxcnZYo2SMuy8vaLW5s+T4/KTmPmuksnl9sWXmE=;
	b=YpohCYRiBll1LG300zTflAKbd2ARfkwGJH3wCpBJCbbphmXYCk6VuPoWwgIBnrI5T8fve8
	5fFnbsSMFSdAERfVbSCRDR0aqUPITDbChjwP+FqCCJwJhGMlObFUu9Af+Oj7Mwz8by7FPt
	lHWr0E3qNDo6dq39yI+a5WQl6RLsIAk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-5YxuQcR5PYealfh2_AOtGQ-1; Wed,
 01 Apr 2026 21:46:08 -0400
X-MC-Unique: 5YxuQcR5PYealfh2_AOtGQ-1
X-Mimecast-MFC-AGG-ID: 5YxuQcR5PYealfh2_AOtGQ_1775094366
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC19C1956055;
	Thu,  2 Apr 2026 01:46:05 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCF761955F2E;
	Thu,  2 Apr 2026 01:45:56 +0000 (UTC)
From: Chunyu Hu <chuhu@redhat.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	chuhu@redhat.com,
	Li Wang <liwang@redhat.com>
Subject: [PATCH v8 1/6] selftests/mm/guard-regions: skip collapse test when thp not enabled
Date: Thu,  2 Apr 2026 09:45:38 +0800
Message-ID: <20260402014543.1671131-2-chuhu@redhat.com>
In-Reply-To: <20260402014543.1671131-1-chuhu@redhat.com>
References: <20260402014543.1671131-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

When thp is not available, just skip the collape tests to avoid the false
negative.

Without the change, run with a thp disabled kernel:
  ./run_vmtests.sh -t madv_guard -n 1
  <snip/>
  #  RUN           guard_regions.anon.collapse ...
  # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
  # collapse: Test terminated by assertion
  #          FAIL  guard_regions.anon.collapse
  not ok 2 guard_regions.anon.collapse
  <snip/>
  #  RUN           guard_regions.shmem.collapse ...
  # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
  # collapse: Test terminated by assertion
  #          FAIL  guard_regions.shmem.collapse
  not ok 32 guard_regions.shmem.collapse
  <snip/>
  #  RUN           guard_regions.file.collapse ...
  # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
  # collapse: Test terminated by assertion
  #          FAIL  guard_regions.file.collapse
  not ok 62 guard_regions.file.collapse
  <snip/>
  # FAILED: 87 / 90 tests passed.
  # 17 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0

With this change, run with thp disabled kernel:
  ./run_vmtests.sh -t madv_guard -n 1
  <snip/>
  #  RUN           guard_regions.anon.collapse ...
  #      SKIP      Transparent Hugepages not available
  #            OK  guard_regions.anon.collapse
  ok 2 guard_regions.anon.collapse # SKIP Transparent Hugepages not available
  <snip/>
  #  RUN           guard_regions.file.collapse ...
  #      SKIP      Transparent Hugepages not available
  #            OK  guard_regions.file.collapse
  ok 62 guard_regions.file.collapse # SKIP Transparent Hugepages not available
  <snip/>
  #  RUN           guard_regions.shmem.collapse ...
  #      SKIP      Transparent Hugepages not available
  #            OK  guard_regions.shmem.collapse
  ok 32 guard_regions.shmem.collapse # SKIP Transparent Hugepages not available
  <snip/>
  # PASSED: 90 / 90 tests passed.
  # 20 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
Changes in v7:
  - Add reviewed-by from Lorenzo
Changes in v5:
  - updated reviewed-by and acked-by
Changes in v4:
  - use thp_available instead of thp_is_enabled() as when thp is set to
    never, madvise(MADV_COLLAPSE) will still succeed by design. So a
    failure in madvise(MADV_COLLAPSE) on guard region will verify guard
    region denies it. This is suggested from AI.
  - removed the 'Reviewed-by' and 'Acked-by' as the code changes. Sorry for
    that but it seems the changes is a little huge? (1 out of 2 lines)..
Changes in v3:
  - commit message: update the log snippet with where the fail happens and
    add the '-n1' to the command.
  - fix the 'false positive' to 'false negative'
  - add reviwed by from Mike
Changes in v2:
  - add reviewed by from Zi and Lorenzo
  - add acked-by from David
---
 tools/testing/selftests/mm/guard-regions.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index dbd21d66d383..48e8b1539be3 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -21,6 +21,7 @@
 #include <sys/uio.h>
 #include <unistd.h>
 #include "vm_util.h"
+#include "thp_settings.h"
 
 #include "../pidfd/pidfd.h"
 
@@ -2195,6 +2196,9 @@ TEST_F(guard_regions, collapse)
 	char *ptr;
 	int i;
 
+	if (!thp_available())
+		SKIP(return, "Transparent Hugepages not available\n");
+
 	/* Need file to be correct size for tests for non-anon. */
 	if (variant->backing != ANON_BACKED)
 		ASSERT_EQ(ftruncate(self->fd, size), 0);
-- 
2.53.0

