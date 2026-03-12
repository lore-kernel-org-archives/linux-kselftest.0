Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FB3BFE20
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314806; cv=none; b=f9dNrADL4kiGoCkFw1jAKtcxsv6Tr5FL+fFchhqVCIPdeUnlYPfZxW5y1tNloqqaoXBza2N37TNNynXGvDhQRXaBaoJyVuwv2wfFxe0z85gEaLK0hh3brCRAvxaAOZmujDs5tQVuhFvjgiqSyX0rTBk84WbufqL8ZlzdnXCEgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314806; c=relaxed/simple;
	bh=Hv8FWWrJbyY27UAT5exVyh5mxhQipixUB7544wYP5Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnAEwo6W1+5O5HuznrqbjM9C/fgBFwFflm/KX+7+oDM1yPfnfsHoAO2+9TMCrTwlzpTgXqC9mf7x8u6ATqgAe1p+d9s2msGCuwoB0/Pk1UsSpMJgYoWSJmpwlTdcfp+MF2CJgeqXobYsmdtGeJAxUwqLJQ9VzUn2VcmH4x/8sw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hxuxkprc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hxuxkprc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773314804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RS4GMvKlK4/Sj9p49EgJ5m59kYkjl/i0vUA6l6Qn/oU=;
	b=hxuxkprcNEj4jq0YPXIs5myp84458EyF1sNhCCUiHoLvmmme/Zs2Y9WGbGJwDhz4lWjwfL
	bGvVmAgmlOIEc0QjYyviQFpy3rA3P0CkXcy6EprOkeXE4WU/sDR2wYZvOwzMAYVz9AKNI9
	cpI214Lw0TBMwBqDnLcgS+RmcarhmxM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-bmMlgpqgOG-GIAMR6SmlmA-1; Thu,
 12 Mar 2026 07:26:41 -0400
X-MC-Unique: bmMlgpqgOG-GIAMR6SmlmA-1
X-Mimecast-MFC-AGG-ID: bmMlgpqgOG-GIAMR6SmlmA_1773314798
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F7021800629;
	Thu, 12 Mar 2026 11:26:37 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B6031800351;
	Thu, 12 Mar 2026 11:26:27 +0000 (UTC)
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
Subject: [PATCH 1/4] selftests/mm/guard-regions: skip collapse test when thp not enabled
Date: Thu, 12 Mar 2026 19:26:08 +0800
Message-ID: <20260312112612.633138-2-chuhu@redhat.com>
In-Reply-To: <20260312112612.633138-1-chuhu@redhat.com>
References: <20260312112612.633138-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
CC: Li Wang <liwang@redhat.com>
Signed-off-by: Chunyu Hu <chuhu@redhat.com>
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

base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
-- 
2.53.0

