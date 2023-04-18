Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF4CC77B76
	for <linux-kselftest@archiver.kernel.org>; Tue, 18 Apr 2023 11:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjDRLrP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 18 Apr 2023 07:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjDRLrN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 18 Apr 2023 07:47:13 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30129023;
        Tue, 18 Apr 2023 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681818400; x=1713354400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R9lx3mKsxWCICNzKODU56YjOQHjE2EbrIY9NXu/7ouA=;
  b=licig3845S1bzRzEzqCsqYnz2iu+UkIYKxS6nuQhgdGIdfsmN1sJto5G
   I8CzAQtLo1TgPytGMcmk6p9Nous6AOyTi/3ileVkDzoV1HXS3NUVRV2h0
   4eKBAH3h8HARGhd/t9OME38mFr3p34zArEa8QjiEyDVTQkZwrH5q/SxZI
   s5l5YpGPBmPDNYc4JjadLvS/lREyH0Giu/JuyMs/kPQLzqrP4KLVsSfpC
   97qLDw2hC45TXMvuM2cbmBmDVUZKxxm/acivgWM7CjyrvQIoHLyXXNc6v
   NqsAvB70qyjQ+KrJ/gBNgziFH1aeG2OgshzqGUplvVQBetg9QDHNoMeM2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346994387"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="346994387"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723601705"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="723601705"
Received: from yvolokit-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.213.103])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:46:04 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-kselftest@vger.kernel.org,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 13/24] selftests/resctrl: Add flush_buffer() to fill_buf
Date:   Tue, 18 Apr 2023 14:44:55 +0300
Message-Id: <20230418114506.46788-14-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418114506.46788-1-ilpo.jarvinen@linux.intel.com>
References: <20230418114506.46788-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Currently, flushing is only done after allocating and filling the
buffer and cannot be controlled by the test cases.

The new CAT test will want to control flushing within a test so
introduce flush_buffer() for that purpose.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 5 +++++
 tools/testing/selftests/resctrl/resctrl.h  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 677e1a113629..7e0d3a1ea555 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -58,6 +58,11 @@ static void mem_flush(void *p, size_t s)
 	sb();
 }
 
+void flush_buffer(unsigned long long span)
+{
+	mem_flush(startptr, span);
+}
+
 static void *malloc_and_init_memory(size_t s)
 {
 	void *p = NULL;
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 8748121345f3..ba36eb5fdf0d 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -97,6 +97,7 @@ int perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu,
 		    int group_fd, unsigned long flags);
 void free_buffer(void);
 int alloc_buffer(unsigned long long buf_size, int memflush);
+void flush_buffer(unsigned long long span);
 int use_buffer(unsigned long long buf_size, int op, bool once);
 int run_fill_buf(unsigned long span, int memflush, int op, bool once);
 int resctrl_val(char **benchmark_cmd, struct resctrl_val_param *param);
-- 
2.30.2

