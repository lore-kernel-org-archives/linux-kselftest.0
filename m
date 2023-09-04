Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295A6C83F33
	for <linux-kselftest@archiver.kernel.org>; Mon,  4 Sep 2023 10:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241012AbjIDKY7 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 4 Sep 2023 06:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352743AbjIDJyK (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 4 Sep 2023 05:54:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB93CE1;
        Mon,  4 Sep 2023 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693821236; x=1725357236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8sQ3qCqDltmKmKXyDYt3/9gs19z0E3/d+pnpfc744Eg=;
  b=afOF8N6K1irEG5LoF5dBUCSknO7F7LDUPQ4CDRfjaMZzhGEOL2WY/nRF
   XWFACxDzfuJ4thCabk8dpqSlioQCiyi6zAQRXdD/HAMRtbiaTBTRYw/6p
   4F+dWlexZRjElvKqLoq+CYXmzLlry5NmF9QbpIqXwWzTWnYbu1mbWslrH
   xmI8ztd0nG/oBddQsNPRP3SkqTSV7+zDJS+ROCeQ4zRLNPCMc2CmLIdOy
   nB8bvwxrDfYdp3KK0hzowcyCeNxcttzubHzDgDpEIX5YKCWRJrVYBtjik
   Jyr1bu72a94kZRDmW9SSkif4Y1uk6BI0QUALPsLheks72ft87ndsL76kk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356880629"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="356880629"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="740700618"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="740700618"
Received: from okozlyk-mobl.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.249.44.17])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:53:52 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Reinette Chatre <reinette.chatre@intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        =?UTF-8?q?Maciej=20Wiecz=C3=B3r-Retman?= 
        <maciej.wieczor-retman@intel.com>
Cc:     Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Babu Moger <babu.moger@amd.com>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v5 0/8] selftests/resctrl: Rework benchmark command handling
Date:   Mon,  4 Sep 2023 12:53:31 +0300
Message-Id: <20230904095339.11321-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The benchmark command handling (-b) in resctrl selftests is overly
complicated code. This series turns the benchmark command immutable to
preserve it for all selftests and improves benchmark command related
error handling.

This series also ends up removing the strcpy() calls which were pointed
out earlier.

v5:
- Fix another off-by-one error
- Reorder local var declarations in main() to follow rev. xmas tree

v4:
- Correct off-by-one error in -b processing
- Reordered code in main() to make freeing span_str simpler (in new patch)
- Use consistent style for const char * const *

v3:
- Removed DEFAULT_SPAN_STR for real and the duplicated copy of defines
  that made to v2 likely due to my incorrect conflict resolutions

v2:
- Added argument length check into patch 1/7
- Updated also -b line in help message.
- Document -b argument related "algorithm"
- Use asprintf() to convert defined constant int to string
- Improved changelog texts
- Added \n to ksft_exit_fail_msg() call messages.
- Print DEFAULT_SPAN with %u instead of %zu to avoid need to cast it

Ilpo Järvinen (8):
  selftests/resctrl: Ensure the benchmark commands fits to its array
  selftests/resctrl: Correct benchmark command help
  selftests/resctrl: Remove bw_report and bm_type from main()
  selftests/resctrl: Simplify span lifetime
  selftests/resctrl: Reorder resctrl FS prep code and benchmark_cmd init
  selftests/resctrl: Make benchmark command const and build it with
    pointers
  selftests/resctrl: Remove ben_count variable
  selftests/resctrl: Cleanup benchmark argument parsing

 tools/testing/selftests/resctrl/cache.c       |   5 +-
 tools/testing/selftests/resctrl/cat_test.c    |  13 +--
 tools/testing/selftests/resctrl/cmt_test.c    |  34 ++++--
 tools/testing/selftests/resctrl/mba_test.c    |   4 +-
 tools/testing/selftests/resctrl/mbm_test.c    |   7 +-
 tools/testing/selftests/resctrl/resctrl.h     |  16 +--
 .../testing/selftests/resctrl/resctrl_tests.c | 100 ++++++++----------
 tools/testing/selftests/resctrl/resctrl_val.c |  10 +-
 8 files changed, 104 insertions(+), 85 deletions(-)

-- 
2.30.2

