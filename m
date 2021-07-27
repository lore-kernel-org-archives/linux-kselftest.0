Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2058AC4338F
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Jul 2021 03:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EED5C61077
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Jul 2021 03:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhG0Cyz (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Jul 2021 22:54:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:58530 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234422AbhG0Cyz (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Jul 2021 22:54:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199586971"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="199586971"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 20:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="505307685"
Received: from fedora29.sh.intel.com ([10.239.182.87])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2021 20:35:20 -0700
From:   Pengfei Xu <pengfei.xu@intel.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Pengfei Xu <pengfei.xu@intel.com>, Heng Su <heng.su@intel.com>,
        Yu Yu-cheng <yu-cheng.yu@intel.com>,
        Yu Fenghua <fenghua.yu@intel.com>,
        Hansen Dave <dave.hansen@intel.com>,
        Luck Tony <tony.luck@intel.com>,
        Mehta Sohil <sohil.mehta@intel.com>,
        Chen Yu C <yu.c.chen@intel.com>
Subject: [RFC PATCH v1 0/2] Introduce XSAVE/XRSTOR self-test
Date:   Tue, 27 Jul 2021 11:34:42 +0800
Message-Id: <cover.1627355565.git.pengfei.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The XSAVE feature set supports the saving and restoring of state components
such as FPU, which is used for process context switching.
In order to ensure that XSAVE works correctly, add XSAVE basic test for
XSAVE architecture functionality.

This patch set tests XSAVE/XRSTOR instructions on x86 platforms and verify if
the XSAVE/XRSTOR works correctly during signal handling.

Cases such as signal handling, process creation, other xstate(except FPU)
tests for XSAVE check, etc. will be added to the Linux kernel self-test.
If appropriate, it is even planned to add the [1] mentioned XSAVE issues
reproduce and some XSAVE anomaly tests to the kernel self-test.

[1]: https://lore.kernel.org/lkml/0000000000004c453905c30f8334@google.com/

Pengfei Xu (2):
  selftests/xsave: test basic XSAVE architecture functionality
  selftests/xsave: add xsave test during signal handling

 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/xsave/.gitignore      |   3 +
 tools/testing/selftests/xsave/Makefile        |   6 +
 tools/testing/selftests/xsave/xsave_common.h  | 246 ++++++++++++++++++
 .../selftests/xsave/xsave_instruction.c       |  83 ++++++
 .../selftests/xsave/xsave_signal_handle.c     | 184 +++++++++++++
 6 files changed, 523 insertions(+)
 create mode 100644 tools/testing/selftests/xsave/.gitignore
 create mode 100644 tools/testing/selftests/xsave/Makefile
 create mode 100644 tools/testing/selftests/xsave/xsave_common.h
 create mode 100644 tools/testing/selftests/xsave/xsave_instruction.c
 create mode 100644 tools/testing/selftests/xsave/xsave_signal_handle.c

-- 
2.20.1

