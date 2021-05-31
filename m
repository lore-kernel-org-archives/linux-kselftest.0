Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB638C47082
	for <linux-kselftest@archiver.kernel.org>; Mon, 31 May 2021 16:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3294610A6
	for <linux-kselftest@archiver.kernel.org>; Mon, 31 May 2021 16:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhEaQzT (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 31 May 2021 12:55:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbhEaQxQ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 31 May 2021 12:53:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 7AC591F41FCB
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, linux-kselftest@vger.kernel.org,
        shuah@kernel.org, dave@stgolabs.net,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 0/2] selftests: futex: Expand futex testing
Date:   Mon, 31 May 2021 13:50:34 -0300
Message-Id: <20210531165036.41468-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This patchset expands test coverage for futex, implementing two new
selftests: one for testing different types of futexes and one for the
requeue operation.

André Almeida (2):
  selftests: futex: Add futex wait test
  selftests: futex: Add futex compare requeue test

 .../selftests/futex/functional/.gitignore     |   2 +
 .../selftests/futex/functional/Makefile       |   4 +-
 .../futex/functional/futex_requeue.c          | 145 ++++++++++++++
 .../selftests/futex/functional/futex_wait.c   | 180 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   6 +
 5 files changed, 336 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_requeue.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_wait.c

-- 
2.31.1

