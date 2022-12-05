Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107BFC4332F
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Dec 2022 19:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbiLETmE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbiLETlY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 5 Dec 2022 14:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C007760FE
        for <linux-kselftest@vger.kernel.org>; Mon,  5 Dec 2022 11:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670269061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TJPhHvXoEWGArXjq8wabcPZKm6Vu3pXc0PH2frV06/s=;
        b=FqGaicG85Q7MU07BrJ5M5+XxlSV4KwGxqfYHv0vhI/7GATcgBNBGyf1r7zjaVWIoExBwW1
        aOWW2tlUM89vdBiyG2AKdB+A5zcBvk5ZGcz6RlXWtOefGQY9Ci0PSslF0Gn/fXTO5wlZC7
        KuLD2NRY8HRUHdHAHANAWOu1THnlwGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-_50uqGV7N52EuauiOE6EBQ-1; Mon, 05 Dec 2022 14:37:30 -0500
X-MC-Unique: _50uqGV7N52EuauiOE6EBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A538486F12A;
        Mon,  5 Dec 2022 19:37:29 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.244])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 308142028E98;
        Mon,  5 Dec 2022 19:37:28 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH mm-unstable v1 4/4] selftests/vm: ksm_functional_tests: fixes for 32bit
Date:   Mon,  5 Dec 2022 20:37:16 +0100
Message-Id: <20221205193716.276024-5-david@redhat.com>
In-Reply-To: <20221205193716.276024-1-david@redhat.com>
References: <20221205193716.276024-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The test currently fails on 32bit. Fixing the "-1ull" vs. "-1ul" seems
to make the test pass and the compiler happy.

Note: This test is not in mm-stable yet. This fix should be squashed into
      "selftests/vm: add KSM unmerge tests".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/ksm_functional_tests.c | 4 ++--
 tools/testing/selftests/vm/vm_util.c              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/ksm_functional_tests.c b/tools/testing/selftests/vm/ksm_functional_tests.c
index 96644be68962..b11b7e5115dc 100644
--- a/tools/testing/selftests/vm/ksm_functional_tests.c
+++ b/tools/testing/selftests/vm/ksm_functional_tests.c
@@ -42,13 +42,13 @@ static bool range_maps_duplicates(char *addr, unsigned long size)
 	for (offs_a = 0; offs_a < size; offs_a += pagesize) {
 		pfn_a = pagemap_get_pfn(pagemap_fd, addr + offs_a);
 		/* Page not present or PFN not exposed by the kernel. */
-		if (pfn_a == -1ull || !pfn_a)
+		if (pfn_a == -1ul || !pfn_a)
 			continue;
 
 		for (offs_b = offs_a + pagesize; offs_b < size;
 		     offs_b += pagesize) {
 			pfn_b = pagemap_get_pfn(pagemap_fd, addr + offs_b);
-			if (pfn_b == -1ull || !pfn_b)
+			if (pfn_b == -1ul || !pfn_b)
 				continue;
 			if (pfn_a == pfn_b)
 				return true;
diff --git a/tools/testing/selftests/vm/vm_util.c b/tools/testing/selftests/vm/vm_util.c
index 710571902743..40e795624ff3 100644
--- a/tools/testing/selftests/vm/vm_util.c
+++ b/tools/testing/selftests/vm/vm_util.c
@@ -50,7 +50,7 @@ unsigned long pagemap_get_pfn(int fd, char *start)
 	/* If present (63th bit), PFN is at bit 0 -- 54. */
 	if (entry & 0x8000000000000000ull)
 		return entry & 0x007fffffffffffffull;
-	return -1ull;
+	return -1ul;
 }
 
 void clear_softdirty(void)
-- 
2.38.1

