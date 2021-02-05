Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBA5C433E0
	for <linux-kselftest@archiver.kernel.org>; Fri,  5 Feb 2021 08:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A83F64E0D
	for <linux-kselftest@archiver.kernel.org>; Fri,  5 Feb 2021 08:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBEI55 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 5 Feb 2021 03:57:57 -0500
Received: from mga01.intel.com ([192.55.52.88]:37904 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhBEI5z (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 5 Feb 2021 03:57:55 -0500
IronPort-SDR: iAXMXhJ0uuFd7t0Ws7izw4lYADnHlYnYRpIIcls4rv09Zx+8BBri/5YZ5QYzSv6Zxnqd53hlRY
 MYmoydJgU14w==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="200406780"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="200406780"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 00:57:13 -0800
IronPort-SDR: bGV95ie11fAdgtrDeLxrxVhzgZM2Mxk+Cc4PXLyip1QeD+7LrY9nEGz8HG6tGYJahfYRybeZOT
 YwK2a0Nb/ebA==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="393769080"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 00:57:11 -0800
From:   Rong Chen <rong.a.chen@intel.com>
To:     Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Rong Chen <rong.a.chen@intel.com>,
        kernel test robot <lkp@intel.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/vm: rename file run_vmtests to run_vmtests.sh
Date:   Fri,  5 Feb 2021 16:55:07 +0800
Message-Id: <20210205085507.1479894-1-rong.a.chen@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Commit c2aa8afc36fa has renamed run_vmtests in Makefile,
but the file still uses the old name.

The kernel test robot reported the following issue:

 # selftests: vm: run_vmtests.sh
 # Warning: file run_vmtests.sh is missing!
 not ok 1 selftests: vm: run_vmtests.sh

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c2aa8afc36fa (selftests/vm: rename run_vmtests --> run_vmtests.sh)
Signed-off-by: Rong Chen <rong.a.chen@intel.com>
---
 tools/testing/selftests/vm/{run_vmtests => run_vmtests.sh} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/vm/{run_vmtests => run_vmtests.sh} (100%)

diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests.sh
similarity index 100%
rename from tools/testing/selftests/vm/run_vmtests
rename to tools/testing/selftests/vm/run_vmtests.sh
-- 
2.20.1

