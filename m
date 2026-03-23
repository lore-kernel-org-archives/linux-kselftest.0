Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6F388377
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279141; cv=none; b=vFPtEZ8BLe9d0kmRZ4/cqlPfB11SayoUT4iv8SylB5XyE3yAH3MFNNG6BhaO6ujkx/CDxe7f1Ypl73XBZdGC9a4vDfGCafclPmdyuImXYZhaNsQuRoBjsCiHx74yByebB0peOlMih8otpfZKgofMP77Jpx2+jAGhUQ0Y1QKz9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279141; c=relaxed/simple;
	bh=8kcSjbIIEeXJAGXv7dzdKrrWxBbWF0Q3ow1gEe2ds6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHAoVhfVABTvHbnxiKlq8AL2sK1TrM4CzqRoDEma2RQ1tSkyI6QOK/WRKHtMr8HcyZ4ebdhg2KH/9y64PfI0MZwF0vaRQuBuZqkfqaFrCEmMIDYq4PtdkMZOCiBlXAnUkFc9M8Jmk8SKup/i62+cc4P5giCCpaEra6lJ5k9NC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8xFo6rq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8xFo6rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774279139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cP9CaaUU0YGWeU606cF4HfEnHjH3cqBLv/sm6TUkYWs=;
	b=f8xFo6rq/y8zYPIC/SVcr6ueeBvWwwOcQzHXKwBCvgSG6ibACLVeWFExN7E19IWORRiB/i
	0LpqQd5xoL+X4je7TNLF75Fy9ZubFH/Rk1pxCzaxZ4juPTt1y2hD90O2VHjA/Yu0NqUDW/
	poluPBaUEOq6PBxLFHrORtBg5uvWIE4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-edeaLJ2qO7CPTH7vFI9A5g-1; Mon,
 23 Mar 2026 11:18:54 -0400
X-MC-Unique: edeaLJ2qO7CPTH7vFI9A5g-1
X-Mimecast-MFC-AGG-ID: edeaLJ2qO7CPTH7vFI9A5g_1774279131
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7451C1800614;
	Mon, 23 Mar 2026 15:18:51 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D2681955D71;
	Mon, 23 Mar 2026 15:18:42 +0000 (UTC)
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
Subject: [PATCH v5 5/6] selftests/mm: split_huge_page_test: skip the test when thp is not available
Date: Mon, 23 Mar 2026 23:17:52 +0800
Message-ID: <20260323151753.2576137-6-chuhu@redhat.com>
In-Reply-To: <20260323151753.2576137-1-chuhu@redhat.com>
References: <20260323151753.2576137-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When thp is not enabled on some kernel config such as realtime kernel, the
test will report failure. Fix the false positive by skipping the test
directly when thp is not enabled.

Tested with thp disabled kernel:
Before The fix:
  # --------------------------------------------------
  # running ./split_huge_page_test /tmp/xfs_dir_Ywup9p
  # --------------------------------------------------
  # TAP version 13
  # Bail out! Reading PMD pagesize failed
  # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # [FAIL]
  not ok 61 split_huge_page_test /tmp/xfs_dir_Ywup9p # exit=1

After the fix:
  # --------------------------------------------------
  # running ./split_huge_page_test /tmp/xfs_dir_YHPUPl
  # --------------------------------------------------
  # TAP version 13
  # 1..0 # SKIP Transparent Hugepages not available
  # [SKIP]
  ok 6 split_huge_page_test /tmp/xfs_dir_YHPUPl # SKIP

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
V3 chagnes:
  - add acked-by from David
  - add reviewed by from Mike
V2 changes:
  - removed the {} in if block
  - removed the write_file helper rename chunk, as there's a new patch 3 to
    resolve the conflict with thp_settings.h by moving it to vm_util.
  - Add reviewed by from Zi and Lorenzo
---
 tools/testing/selftests/mm/split_huge_page_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 93f205327b84..500d07c4938b 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -21,6 +21,7 @@
 #include <time.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "thp_settings.h"
 
 uint64_t pagesize;
 unsigned int pageshift;
@@ -757,6 +758,9 @@ int main(int argc, char **argv)
 		ksft_finished();
 	}
 
+	if (!thp_is_enabled())
+		ksft_exit_skip("Transparent Hugepages not available\n");
+
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-- 
2.53.0

