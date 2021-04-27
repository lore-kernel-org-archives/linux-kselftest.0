Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7FBC433ED
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Apr 2021 13:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6032D6127A
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Apr 2021 13:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbhD0Ny3 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 27 Apr 2021 09:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbhD0NyX (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 27 Apr 2021 09:54:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83474C06175F;
        Tue, 27 Apr 2021 06:53:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 9E50B1F41F07
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, linux-kselftest@vger.kernel.org,
        shuah@kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 0/2] selftests: futex: Improve timeout testing
Date:   Tue, 27 Apr 2021 10:53:26 -0300
Message-Id: <20210427135328.11013-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This small series expands futex timeout selftests by checking if all
operations that allows timeouts works as expected. When some version of
Thomas' series "futex: Bugfixes and FUTEX_LOCK_PI2"[0] get merged, I'll
add the new rules to the timeout test. This test should be used to check
for regressions when modifying the timeout path or changing the
interface.

Additionally, fix a bug in the Makefile that can be found when compiling
selftests with new operations, like the one defined at [0] or from the
futex2 patchset.

[0] https://lore.kernel.org/lkml/20210422194417.866740847@linutronix.de/

André Almeida (2):
  selftests: futex: Correctly include headers dirs
  selftests: futex: Expand timeout test

 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_wait_timeout.c     | 126 +++++++++++++++---
 2 files changed, 112 insertions(+), 17 deletions(-)

-- 
2.31.1

