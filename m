Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A1399362
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315682; cv=none; b=MFSfktmPql/W7UIzsUG5k4RlnhWAyISM1BUmUXeMe15q8Y4zHk5HGmzzCVtC0JncKKln+f/XeUo765N7tBBBCWRV+yO48XiHWA4fJwCBOz85DAB+7wPqM8s4x8UGk/ng2lMnA/JVcboOeYeYorlm8hy3uE7nGeqOcIDRy7iDHNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315682; c=relaxed/simple;
	bh=9g8V5pG2xl1qxGcmympXzly6LC1lqeNauW6r+g0kqD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWuMiuxAPuHL9dcd0EtieMysHexk5ghmwo2FiUYwbstL9kmoXXraDMtsIG9DBpCOsdYl6dsweKK7jYMEYnlalic4Z+ALxBYmXI6Rwa2hiMMReckI8fU2rBplmMzbXvHrbYOJcNQ7eTaHOkrgmdphu3DzgkcIqGxV8lWXnVVoXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL6zEgox; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL6zEgox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773315680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwjhJxQ0ePsKl4AA80EzxONZrokAXIixovBJhdLwa/U=;
	b=JL6zEgoxPlbnWIY24H1wH91UvyMZ0HKn5yTW/sGqDDbSaPXUBiVxZ6bs3kt8TAwuhIQ3K5
	Hk9i/d2KGprSmzLvA6PoGPGXsPBSNnE798+S/olV6Tk+rtC+hWKBgMRwAmVfiuzoTvk1by
	LCXlVGNZLrYTShrQAIE5lM3Vm+5ZVOo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-43TIW4ZPPuWWDee0nSai2w-1; Thu,
 12 Mar 2026 07:41:15 -0400
X-MC-Unique: 43TIW4ZPPuWWDee0nSai2w-1
X-Mimecast-MFC-AGG-ID: 43TIW4ZPPuWWDee0nSai2w_1773315672
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1D8F18002E7;
	Thu, 12 Mar 2026 11:41:11 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B50E4180058B;
	Thu, 12 Mar 2026 11:41:02 +0000 (UTC)
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
Subject: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the test when thp is not available
Date: Thu, 12 Mar 2026 19:40:26 +0800
Message-ID: <20260312114027.634559-4-chuhu@redhat.com>
In-Reply-To: <20260312114027.634559-1-chuhu@redhat.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

When thp is not enabled on some kernel config such as realtime kernel, the
test will report failure. Fix the false positive by skipping the test
directly when thp is not enabled.

There's a naming conflict on write_file() function, both thp_settings.h and
split_huge_page_test.c define it. To make use of thp_is_enabled() helper in
the thp_settings.h, rename this local write_file to safe_write_file to
avoid the conflict. The reason to use 'safe_' is it does some error check.

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

CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index e0167111bdd1..615b75ca62cc 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -21,6 +21,7 @@
 #include <time.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "thp_settings.h"
 
 uint64_t pagesize;
 unsigned int pageshift;
@@ -255,7 +256,7 @@ static int check_after_split_folio_orders(char *vaddr_start, size_t len,
 	return status;
 }
 
-static void write_file(const char *path, const char *buf, size_t buflen)
+static void safe_write_file(const char *path, const char *buf, size_t buflen)
 {
 	int fd;
 	ssize_t numwritten;
@@ -283,7 +284,7 @@ static void write_debugfs(const char *fmt, ...)
 	if (ret >= INPUT_MAX)
 		ksft_exit_fail_msg("%s: Debugfs input is too long\n", __func__);
 
-	write_file(SPLIT_DEBUGFS, input, ret + 1);
+	safe_write_file(SPLIT_DEBUGFS, input, ret + 1);
 }
 
 static char *allocate_zero_filled_hugepage(size_t len)
@@ -772,6 +773,10 @@ int main(int argc, char **argv)
 		ksft_finished();
 	}
 
+	if (!thp_is_enabled()) {
+		ksft_exit_skip("Transparent Hugepages not available\n");
+	}
+
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-- 
2.53.0

