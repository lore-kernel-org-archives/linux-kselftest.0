Return-Path: <SRS0=phc0=Z3=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E022BC43603
	for <linux-kselftest@archiver.kernel.org>; Thu,  5 Dec 2019 12:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF66C24648
	for <linux-kselftest@archiver.kernel.org>; Thu,  5 Dec 2019 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575548453;
	bh=uIUv41va5yaHQx+UtxnPI1aouIJjYFJRX8SbnOfox9U=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=kCKSWMeUnjTJZc7kvF64KM0GrkEoMm9ZULoppx+W39NfTzC07T5qSOzkO4ya/Ej52
	 igV5SX0HM06GIg7a30aHUsZuiwN6d9lMcF5Qv3RhsNfOsqDz5W1nh+Bafd1k935CQ0
	 3OiKHEMGUnhatQK77E5nlfxT1nzYBKO7blHSXpjE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfLEMUx (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 5 Dec 2019 07:20:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:36970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729074AbfLEMUx (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 5 Dec 2019 07:20:53 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68D862245C;
        Thu,  5 Dec 2019 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575548452;
        bh=uIUv41va5yaHQx+UtxnPI1aouIJjYFJRX8SbnOfox9U=;
        h=From:To:Cc:Subject:Date:From;
        b=ULP20YFiMAzHdk971hN4rjF37Itr0qXAWTOjvWePGTUK86TS/w+OafYkhx/l6hVXc
         Sp24YIUcXwj49Hxc4nMRhhXtI1S/lBcVHrGCJAuGTY6Dk0ITQH9mUm3eebChJK3xV1
         dGFMchDc8bVO1jbL1+Z46GF48NG6ifdgrilU+atU=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Micah Morton <mortonm@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        jaswinder.singh@linaro.org
Subject: [BUGFIX PATCH v2 0/3] selftests: safesetid: Fix some bugs in safesetid test
Date:   Thu,  5 Dec 2019 21:20:49 +0900
Message-Id: <157554844882.11018.13436399905210284553.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi,

Here is the v2 series to fix build warnings and erorrs on
kselftest safesetid.
This version includes a fix for a runtime error.

Thank you,

---

Masami Hiramatsu (3):
      selftests: safesetid: Move link library to LDLIBS
      selftests: safesetid: Check the return value of setuid/setgid
      selftests: safesetid: Fix Makefile to set correct test program


 tools/testing/selftests/safesetid/Makefile         |    5 +++--
 tools/testing/selftests/safesetid/safesetid-test.c |   15 ++++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
