Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890ACEB64DC
	for <linux-kselftest@archiver.kernel.org>; Mon, 17 Jul 2023 13:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGQNRm (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjGQNRR (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 17 Jul 2023 09:17:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423CE1FF1;
        Mon, 17 Jul 2023 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689599799; x=1721135799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ogx0qj3LX5irrJwshgW9nYSxrngHHmC2qLUGm2TgldA=;
  b=JulPL2T+SUUE6e1xynFRFAa2ThcMiHgaEP9W+8rkxOcic2n7iV5REJp2
   REzb2VOU5yJ4dN2v5or/sgGN0B3EEcZTr/Mzas0iVWcv545GfrKNARnEN
   C5Lwzm0r9a0jkSeVaDgnyaW10eCaplrr8LvZgRG3Nir2uVnurNx9p+42C
   QAPE5MI3t0eMJKiBHMB72snnD5Zp2OfZFv5AKa7zpCAwDy1ECefiF0A2t
   xlRPXlyKm4mGk/AK3kCqdMLzhKtHRKXM32cY+3vUfP0AY3J4571/pHnfc
   uzefV3nZOx4HnqKtv1UlxX/avAU24ZzlVGdgwHkqjVi8LEAH5FzyOpNEq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368569115"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368569115"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793247103"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="793247103"
Received: from dkravtso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.45.233])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:16:28 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-kselftest@vger.kernel.org,
        Reinette Chatre <reinette.chatre@intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 13/19] selftests/resctrl: Remove unnecessary startptr global from fill_buf
Date:   Mon, 17 Jul 2023 16:15:01 +0300
Message-Id: <20230717131507.32420-14-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717131507.32420-1-ilpo.jarvinen@linux.intel.com>
References: <20230717131507.32420-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

fill_buf stores buffer pointer into global variable startptr that is
only used in fill_cache().

Remove startptr as global variable, the local variable in fill_cache()
is enough to keep the pointer.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index d8f5505eb9e6..a5ec9c82a960 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -22,8 +22,6 @@
 #define PAGE_SIZE		(4 * 1024)
 #define MB			(1024 * 1024)
 
-static unsigned char *startptr;
-
 static void sb(void)
 {
 #if defined(__i386) || defined(__x86_64)
@@ -147,7 +145,6 @@ static int fill_cache(size_t buf_size, int memflush, int op, char *resctrl_val)
 	if (!start_ptr)
 		return -1;
 
-	startptr = start_ptr;
 	end_ptr = start_ptr + buf_size;
 
 	/* Flush the memory before using to avoid "cache hot pages" effect */
@@ -159,7 +156,7 @@ static int fill_cache(size_t buf_size, int memflush, int op, char *resctrl_val)
 	else
 		ret = fill_cache_write(start_ptr, end_ptr, resctrl_val);
 
-	free(startptr);
+	free(start_ptr);
 
 	if (ret) {
 		printf("\n Error in fill cache read/write...\n");
-- 
2.30.2

