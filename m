Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551CCC433E9
	for <linux-kselftest@archiver.kernel.org>; Fri, 19 Mar 2021 16:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41F486198D
	for <linux-kselftest@archiver.kernel.org>; Fri, 19 Mar 2021 16:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhCSQyI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 19 Mar 2021 12:54:08 -0400
Received: from foss.arm.com ([217.140.110.172]:56890 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230096AbhCSQx6 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 19 Mar 2021 12:53:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CECB4101E;
        Fri, 19 Mar 2021 09:53:57 -0700 (PDT)
Received: from e104803-lin.cambridge.arm.com (e104803-lin.cambridge.arm.com [10.1.197.64])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4670F3F70D;
        Fri, 19 Mar 2021 09:53:56 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Amit Daniel Kachhap <amit.kachhap@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 10/11] kselftest/arm64: mte: Fix clang warning
Date:   Fri, 19 Mar 2021 16:53:33 +0000
Message-Id: <20210319165334.29213-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20210319165334.29213-1-andre.przywara@arm.com>
References: <20210319165334.29213-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

if (!prctl(...) == 0) is not only cumbersome to read, it also upsets
clang and triggers a warning:
------------
mte_common_util.c:287:6: warning: logical not is only applied to the
left hand side of this comparison [-Wlogical-not-parentheses]
....

Fix that by just comparing against "not 0" instead.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 tools/testing/selftests/arm64/mte/mte_common_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index aa8a8a6b8b6d..040abdca079d 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -284,7 +284,7 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 
 	en |= (incl_mask << PR_MTE_TAG_SHIFT);
 	/* Enable address tagging ABI, mte error reporting mode and tag inclusion mask. */
-	if (!prctl(PR_SET_TAGGED_ADDR_CTRL, en, 0, 0, 0) == 0) {
+	if (prctl(PR_SET_TAGGED_ADDR_CTRL, en, 0, 0, 0) != 0) {
 		ksft_print_msg("FAIL:prctl PR_SET_TAGGED_ADDR_CTRL for mte mode\n");
 		return -EINVAL;
 	}
-- 
2.17.5

