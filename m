Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7F39DBC3
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315660; cv=none; b=XV52wGZxMl/lZLeplrk1pnnReesK+MAOKHzumYA8Bn44CXJai155VUJPdGN8rt4ofSBEsIDsaTminRE2ul7MtpLVULOPL9ePbPkAzTS/Oq5mLEttIdaRniKgBAP2qEyr4Yypm7sVFsWqBlsmutpOgqmyk6PlmbmpblhlJzANnGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315660; c=relaxed/simple;
	bh=jH7Fen0vwsFiTlqBpdufHCwlg84kXvI5dx8Xozoa2gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJue8ep1LuBVWyQywDvEFV+BAVEEMUwoZ51KvOMh3Y4dCcGNDdmRkXg4Ch9M4pscPW+b2ETfxawS0NtM+QpxupJ68IOoOfJtHg1M59CMBsb9Pd/ZkuD6e4pIZuwU+vW4IwGX1ptG4lyLd5HeaJ/13G46IDPeFfITDi8NonzsP3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibJKbbh8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibJKbbh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773315658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeeUzwD9xvrgBKbuAuUTCtoCEVa+RZ+bhwLWLOTaBdA=;
	b=ibJKbbh8CCiL5QAc+zPTLqNOkmJMu54uMJ7/Meq4ENyeVwkG1J44MZhJrOzeKmZiBuQPn9
	UxjyoCaka44S12AvB+ecTElH3C1Jyzy2adYoeDve4n+13EyCOsFVRZRxv6/XIE4QKKOkHJ
	v2cxWsFm8uSA3jHkbNmSFyN4gWt5xeE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-LtDIuIs8PaWgaGruvmlnmg-1; Thu,
 12 Mar 2026 07:40:55 -0400
X-MC-Unique: LtDIuIs8PaWgaGruvmlnmg-1
X-Mimecast-MFC-AGG-ID: LtDIuIs8PaWgaGruvmlnmg_1773315652
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2ECEC18002D1;
	Thu, 12 Mar 2026 11:40:52 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1694A180035F;
	Thu, 12 Mar 2026 11:40:41 +0000 (UTC)
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
Subject: [RESEND PATCH 1/4] selftests/mm/guard-regions: skip collapse test when thp not enabled
Date: Thu, 12 Mar 2026 19:40:24 +0800
Message-ID: <20260312114027.634559-2-chuhu@redhat.com>
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
-- 
2.53.0

