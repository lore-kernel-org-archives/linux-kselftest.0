Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4815C001B0
	for <linux-kselftest@archiver.kernel.org>; Mon, 24 Jul 2023 08:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjGXIZ4 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjGXIZo (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 24 Jul 2023 04:25:44 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBCF01AD;
        Mon, 24 Jul 2023 01:25:42 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF3D9DE0;
        Mon, 24 Jul 2023 01:26:25 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D04CD3F67D;
        Mon, 24 Jul 2023 01:25:40 -0700 (PDT)
From:   Ryan Roberts <ryan.roberts@arm.com>
To:     "Andrew Morton" <akpm@linux-foundation.org>,
        "Shuah Khan" <shuah@kernel.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        "David Hildenbrand" <david@redhat.com>,
        "Mark Brown" <broonie@kernel.org>,
        "John Hubbard" <jhubbard@nvidia.com>,
        "Florent Revest" <revest@chromium.org>,
        "Peter Xu" <peterx@redhat.com>
Cc:     Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 5/8] selftests/mm: va_high_addr_switch should skip unsupported arm64 configs
Date:   Mon, 24 Jul 2023 09:25:19 +0100
Message-Id: <20230724082522.1202616-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230724082522.1202616-1-ryan.roberts@arm.com>
References: <20230724082522.1202616-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

va_high_addr_switch has a mechanism to determine if the tests should be
run or skipped (supported_arch()). This currently returns
unconditionally true for arm64. However, va_high_addr_switch also
requires a large virtual address space for the tests to run, otherwise
they spuriously fail.

Since arm64 can only support VA > 48 bits when the page size is 64K,
let's decide whether we should skip the test suite based on the page
size. This reduces noise when running on 4K and 16K kernels.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 tools/testing/selftests/mm/va_high_addr_switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 7cfaf4a74c57..cfbc501290d3 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -292,7 +292,7 @@ static int supported_arch(void)
 #elif defined(__x86_64__)
 	return 1;
 #elif defined(__aarch64__)
-	return 1;
+	return getpagesize() == PAGE_SIZE;
 #else
 	return 0;
 #endif
-- 
2.25.1

