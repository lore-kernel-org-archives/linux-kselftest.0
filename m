Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12E433A031
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773636249; cv=none; b=ZgI+fJAqgPe+AtjMbxdn9BaPPsB306fAiASuKDbxD0Wd5IujY+oI/YtDkhpFxstzidcm2XIGghrpcheqZvB/Jq9xAIY9yKu1KCAx1VT7YNpCTMayKsOiUX2Y9SwVI6bM49rbDS5XCCdHJtWqOuuAbhmRYppBNF330vlsybd4DBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773636249; c=relaxed/simple;
	bh=uZsOlCM8eZ/P7EcpQCXUQJOYm4UtVBsO6fbeUS3+gJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOnQ/YtsKMaRxgEitTFrKenmYxzdz2nZqYamTDLrCI2JjmnBacy9LkcZRy5/ufjxS5S+4JZSk63+bMe7nsZkTEVy5jRWkIUSbgzhogji3evK4pMOPcrCtaxf9CJT4sm31OfWyi4qjKUpV5EUcK9FkyuIdIAlySh37C9ANS9YTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kk4g3Pti; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kk4g3Pti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773636247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2x6ia0fOtjNFpMwFjrWEQ0OzFaYrAPdncllfx5wNUeo=;
	b=Kk4g3PtiukrbE4cSR8QAgNlXFfk+bCoHNnOwnPVkHrpi1M+Nhz2IPvSavAr9YjDqtkivIP
	6HBSHn5c6uDV31wbqxdJTZAlz8xJ0TRHjPEnzpOFY3B5GQZJp76b+wsIULb9x0U0vRFq7q
	coCI5S8OE+XBLxEHvKX5Xshv1b4yp74=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-V2YXIBYvOvuT3hqnEv4IEA-1; Mon,
 16 Mar 2026 00:44:02 -0400
X-MC-Unique: V2YXIBYvOvuT3hqnEv4IEA-1
X-Mimecast-MFC-AGG-ID: V2YXIBYvOvuT3hqnEv4IEA_1773636240
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 907C119560B5;
	Mon, 16 Mar 2026 04:43:59 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B3571955E75;
	Mon, 16 Mar 2026 04:43:49 +0000 (UTC)
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
Subject: [PATCH v2 1/5] selftests/mm/guard-regions: skip collapse test when thp not enabled
Date: Mon, 16 Mar 2026 12:43:31 +0800
Message-ID: <20260316044335.1390608-2-chuhu@redhat.com>
In-Reply-To: <20260316044335.1390608-1-chuhu@redhat.com>
References: <20260316044335.1390608-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

When thp is not available, just skip the collape tests to avoid the false
positive.

Without the change, run with a thp disabled kernel:
  ./run_vmtests.sh -t madv_guard
  <snip/>
  # #  RUN           guard_regions.file.multi_vma ...
  # #            OK  guard_regions.file.multi_vma
  # ok 89 guard_regions.file.multi_vma
  # #  RUN           guard_regions.file.basic ...
  # #            OK  guard_regions.file.basic
  # ok 90 guard_regions.file.basic
  # # FAILED: 87 / 90 tests passed.
  # # 17 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0
  # [FAIL]
  not ok 1 guard-regions # exit=1
  hwpoison_inject
  # SUMMARY: PASS=0 SKIP=0 FAIL=1

With this change, run with thp disabled kernel:
  ./run_vmtests.sh -t madv_guard
  <snip/>
  # ok 90 guard_regions.file.basic
  # # PASSED: 90 / 90 tests passed.
  # # 20 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
  # # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0
  # [PASS]
  ok 1 guard-regions
  hwpoison_inject
  # SUMMARY: PASS=1 SKIP=0 FAIL=0
  1..1

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
Changes in v2:
  - add reviewed by from Zi and Lorenzo
  - add acked-by from David
---
 tools/testing/selftests/mm/guard-regions.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index dbd21d66d383..897af9c512f9 100644
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
 
+	if (!thp_is_enabled())
+		SKIP(return, "Transparent Hugepages not available\n");
+
 	/* Need file to be correct size for tests for non-anon. */
 	if (variant->backing != ANON_BACKED)
 		ASSERT_EQ(ftruncate(self->fd, size), 0);

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.53.0

