Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2632BC433E3
	for <linux-kselftest@archiver.kernel.org>; Fri, 19 Mar 2021 16:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDF161987
	for <linux-kselftest@archiver.kernel.org>; Fri, 19 Mar 2021 16:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhCSQyG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 19 Mar 2021 12:54:06 -0400
Received: from foss.arm.com ([217.140.110.172]:56832 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhCSQxs (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 19 Mar 2021 12:53:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9236A11FB;
        Fri, 19 Mar 2021 09:53:48 -0700 (PDT)
Received: from e104803-lin.cambridge.arm.com (e104803-lin.cambridge.arm.com [10.1.197.64])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A0C83F70D;
        Fri, 19 Mar 2021 09:53:47 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Amit Daniel Kachhap <amit.kachhap@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH 04/11] kselftest/arm64: mte: user_mem: Fix write() warning
Date:   Fri, 19 Mar 2021 16:53:27 +0000
Message-Id: <20210319165334.29213-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20210319165334.29213-1-andre.przywara@arm.com>
References: <20210319165334.29213-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Out of the box Ubuntu's 20.04 compiler warns about missing return value
checks for write() (sys)calls.

Make GCC happy by checking whether we actually managed to write "val".

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 tools/testing/selftests/arm64/mte/check_user_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index 4bfa80f2a8c3..1de7a0abd0ae 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -33,7 +33,8 @@ static int check_usermem_access_fault(int mem_type, int mode, int mapping)
 	if (fd == -1)
 		return KSFT_FAIL;
 	for (i = 0; i < len; i++)
-		write(fd, &val, sizeof(val));
+		if (write(fd, &val, sizeof(val)) != sizeof(val))
+			return KSFT_FAIL;
 	lseek(fd, 0, 0);
 	ptr = mte_allocate_memory(len, mem_type, mapping, true);
 	if (check_allocated_memory(ptr, len, mem_type, true) != KSFT_PASS) {
-- 
2.17.5

