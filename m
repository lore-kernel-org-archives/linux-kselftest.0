Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE653C433F5
	for <linux-kselftest@archiver.kernel.org>; Mon, 20 Sep 2021 12:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92B6A6109D
	for <linux-kselftest@archiver.kernel.org>; Mon, 20 Sep 2021 12:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237541AbhITMOS (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 20 Sep 2021 08:14:18 -0400
Received: from foss.arm.com ([217.140.110.172]:46518 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236213AbhITMOS (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 20 Sep 2021 08:14:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4391711B3;
        Mon, 20 Sep 2021 05:12:51 -0700 (PDT)
Received: from e120937-lin.home (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ACC33F719;
        Mon, 20 Sep 2021 05:12:50 -0700 (PDT)
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Mark Brown <broonie@kernel.org>, cristian.marussi@arm.com
Subject: [PATCH] kselftest/arm64: signal: Skip tests if required features are missing
Date:   Mon, 20 Sep 2021 13:12:28 +0100
Message-Id: <20210920121228.35368-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

During initialization of a signal testcase, features declared as required
are properly checked against the running system but no action is then taken
to effectively skip such a testcase.

Fix core signals test logic to abort initialization and report such a
testcase as skipped to the KSelfTest framework.

Fixes: f96bf4340316 ("kselftest: arm64: mangle_pstate_invalid_compat_toggle and common utils")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
As a consequence KSelfTest TAP results will now report this when a signal-SVE
testcase run on a system missing SVE:

\# selftests: arm64: fake_sigreturn_sve_change_vl
\# Registered handlers for all signals.
\# Detected MINSTKSIGSZ:4720
\# Required Features: [ SVE ] NOT supported
\# ==>> completed. SKIP.
\# # FAKE_SIGRETURN_SVE_CHANGE :: Attempt to change SVE VL
\# ok 7 selftests: arm64: fake_sigreturn_sve_change_vl # SKIP
---
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 6836510a522f..22722abc9dfa 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -266,16 +266,19 @@ int test_init(struct tdescr *td)
 			td->feats_supported |= FEAT_SSBS;
 		if (getauxval(AT_HWCAP) & HWCAP_SVE)
 			td->feats_supported |= FEAT_SVE;
-		if (feats_ok(td))
+		if (feats_ok(td)) {
 			fprintf(stderr,
 				"Required Features: [%s] supported\n",
 				feats_to_string(td->feats_required &
 						td->feats_supported));
-		else
+		} else {
 			fprintf(stderr,
 				"Required Features: [%s] NOT supported\n",
 				feats_to_string(td->feats_required &
 						~td->feats_supported));
+			td->result = KSFT_SKIP;
+			return 0;
+		}
 	}
 
 	/* Perform test specific additional initialization */
-- 
2.17.1

