Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36871C4332F
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Dec 2022 19:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbiLETlv (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbiLETlS (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 5 Dec 2022 14:41:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED45286F6
        for <linux-kselftest@vger.kernel.org>; Mon,  5 Dec 2022 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670269048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=38Lo8jK2a+uHnv2nru3s1Pe1r5U79n0K0BCMSGaNAFc=;
        b=UzDDI9XYVqo9q5+ZxNSSvWl/U0VstYYZXrglTZMwKVHvoyDxLGNjlGp67PaNN3Fq7BKfHv
        gTf2Bvm2b6MoF6NQ95NYjmp7Ku4cpz5lR59SZJ9qENp41oxUsjjYyX8/Q4VDozbWeTdnHO
        kD++Tk8IIhRylWoqUvnrdNAy91WOydY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-UTDgVgLcNcCzT2vNICZE4A-1; Mon, 05 Dec 2022 14:37:26 -0500
X-MC-Unique: UTDgVgLcNcCzT2vNICZE4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B0B185A79C;
        Mon,  5 Dec 2022 19:37:26 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.244])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 852762027062;
        Mon,  5 Dec 2022 19:37:24 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH mm-unstable v1 2/4] selftests/vm: madv_populate: fix missing MADV_POPULATE_(READ|WRITE) definitions
Date:   Mon,  5 Dec 2022 20:37:14 +0100
Message-Id: <20221205193716.276024-3-david@redhat.com>
In-Reply-To: <20221205193716.276024-1-david@redhat.com>
References: <20221205193716.276024-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The tests fail to compile in some environments (e.g., Debian 11.5 on x86).
Let's simply conditionally define MADV_POPULATE_(READ|WRITE) if not
already defined, similar to how the khugepaged.c test handles it.

Fixes: 39b2e5cae43d ("selftests/vm: make MADV_POPULATE_(READ|WRITE) use in-tree headers")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/madv_populate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/vm/madv_populate.c b/tools/testing/selftests/vm/madv_populate.c
index 60547245e479..262eae6b58f2 100644
--- a/tools/testing/selftests/vm/madv_populate.c
+++ b/tools/testing/selftests/vm/madv_populate.c
@@ -20,6 +20,13 @@
 #include "../kselftest.h"
 #include "vm_util.h"
 
+#ifndef MADV_POPULATE_READ
+#define MADV_POPULATE_READ	22
+#endif /* MADV_POPULATE_READ */
+#ifndef MADV_POPULATE_WRITE
+#define MADV_POPULATE_WRITE	23
+#endif /* MADV_POPULATE_WRITE */
+
 /*
  * For now, we're using 2 MiB of private anonymous memory for all tests.
  */
-- 
2.38.1

