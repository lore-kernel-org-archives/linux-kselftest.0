Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB9C433FE
	for <linux-kselftest@archiver.kernel.org>; Fri,  1 Apr 2022 22:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352618AbiDAWUb (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 1 Apr 2022 18:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347803AbiDAWU3 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 1 Apr 2022 18:20:29 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AF83878D;
        Fri,  1 Apr 2022 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648851518; x=1680387518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ib5lnXmoJA4QJKvWOoMpeHIvErHafsZXbhOJjciS+tI=;
  b=izcHfkXq3nqg2FzeIrWizcXIxN/N+9Bn0xS+z8+C+EgCi0DN1KS98/UI
   iQDnqhx9V6uWRD7vgu7qSUMjqeEO1fqFDrqhuG0GcmMmPR84p7Gf6B3xR
   YrNrSqIjXxHe/J+zdXsHK2ts9QS31ncRAZFxMZhPCNGn3am45qtbFL//H
   rJYmzABsQ02MQP0/0guvTSJE49cDB7o5CdhXODSXF3DvuNFjHhTro2Mw5
   RsIr7BRDJNqPA8q317qmBVXQXx6uVpsChP+S1Xm+1PJkobhSKwQ1mlB+G
   B4KwGgewJK9vdgGRKZG35NaM0u15NIPJ048T7hRBfW2xZtAEoVruxpSum
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257822124"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="257822124"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 15:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="567860540"
Received: from chang-linux-3.sc.intel.com ([172.25.112.114])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 15:18:35 -0700
From:   "Chang S. Bae" <chang.seok.bae@intel.com>
To:     linux-kselftest@vger.kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dave.hansen@linux.intel.com, tglx@linutronix.de, bp@suse.de,
        chang.seok.bae@intel.com
Subject: [PATCH 1/2] selftests/x86/signal: Adjust the test to the kernel's altstack check
Date:   Fri,  1 Apr 2022 15:10:13 -0700
Message-Id: <20220401221014.13556-2-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401221014.13556-1-chang.seok.bae@intel.com>
References: <20220401221014.13556-1-chang.seok.bae@intel.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The test assumes an insufficient altstack is allowed. Then it raises a
signal to test the delivery failure due to an altstack overflow.

The kernel now provides an option to tweak sigaltstack()'s sanity check to
prevent an insufficient altstack. ENOMEM is returned on the check failure.

Adjust the code to skip the test when this option is on.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 tools/testing/selftests/x86/sigaltstack.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/sigaltstack.c b/tools/testing/selftests/x86/sigaltstack.c
index f689af75e979..22a88b764a8e 100644
--- a/tools/testing/selftests/x86/sigaltstack.c
+++ b/tools/testing/selftests/x86/sigaltstack.c
@@ -88,8 +88,18 @@ static void sigalrm(int sig, siginfo_t *info, void *ctx_void)
 
 static void test_sigaltstack(void *altstack, unsigned long size)
 {
-	if (setup_altstack(altstack, size))
+	if (setup_altstack(altstack, size)) {
+		/*
+		 * The kernel may return ENOMEM when the altstack size
+		 * is insufficient. Skip the test in this case.
+		 */
+		if (errno == ENOMEM && size < at_minstack_size) {
+			printf("[SKIP]\tThe running kernel disallows an insufficient size.\n");
+			return;
+		}
+
 		err(1, "sigaltstack()");
+	}
 
 	sigalrm_expected = (size > at_minstack_size) ? true : false;
 
-- 
2.17.1

