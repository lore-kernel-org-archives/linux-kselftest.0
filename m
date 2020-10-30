Return-Path: <SRS0=eqYf=EF=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE49C56201
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Oct 2020 06:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37F04221EB
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Oct 2020 06:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnLy5KfW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgJ3GRR (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Oct 2020 02:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3GRQ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Oct 2020 02:17:16 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CE8C0613D2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2020 23:17:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x125so5206093yba.17
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2020 23:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=YO54Tn56HJNBVhbrimlUnxLhvXTbKZkDHGpoiKtBB8k=;
        b=MnLy5KfWi58tKQmOi2bgN2hpIYNcmF6fRMhxl/0fIFvHOAZM/y613TiU51QwVPcGvl
         GHPUCVFq9YqY5jdTE5zLuUhcNY9hTZ5bi8gIx63LDC6PIGPoaCiYjET2qE+Rhn+xCXaj
         u4UIeb79ld6YqpGT6RCBpY3/A2PRZ9694fSgcGaB0Evz/xICV/r10IR5yLBK+I5MAMfD
         dIbaj4jKQioH0kK9g88DONPnN1yk3pRnbZtWt43prTokvwuv3UGjFJU9OW/lim1PO/5/
         6PIoSVjKrVybXSu5BiO4w9kRbP4rTy/T1n61BJgMx6gZ0O6bsFFB4RPhoqip2whwkWmR
         77yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=YO54Tn56HJNBVhbrimlUnxLhvXTbKZkDHGpoiKtBB8k=;
        b=sVjMfrQJDAgBC7jD+azKI2l7KhB2dK33r37cFpgh0cs2xUPjCGUQcmidt2IIA4uJiU
         qMSMbzbV3ReaRyDGCxjGe8JHh9BwN+OUQ2a8zKiV/VAuuoddjEDOZzp9J1DjjBaHz9a+
         wNx9BUZRZ0NwxQvJLWktWX4D04Lhkeu/g4KyP41pza2eUFJtqVcMqALqmFj5084/hxmW
         uoiM/1BhhY/uj4ApGzbO3gBLzlLjy4/i7P5N7XPYkTlggpyWbgBV07X1VvmwqPWbztTU
         eYmSPFurSIpqnNYa6wmygsHT6XcSunGJbTdjN65ahWkReuGd9Sr4To8yeog9oGmlFAVo
         N0Gw==
X-Gm-Message-State: AOAM533YUbqC6hA80qsXjmIKO2Wn6jfz1uVdH8+Xt+E4NgSIk5HLyn/Y
        U/B+A9rDAvplhMsI0EpLSBRvUzzkSQCZYg==
X-Google-Smtp-Source: ABdhPJz4h/cncIdfXNYFCHiItiL5FrOJHZuYoxPSW9rrDLIqk7gZlypHCWiSfBSDItF67J+L/vzk/4+1oryyvQ==
Sender: "dlatypov via sendgmr" <dlatypov@dlatypov.svl.corp.google.com>
X-Received: from dlatypov.svl.corp.google.com ([2620:15c:2cd:202:a28c:fdff:fee3:28c6])
 (user=dlatypov job=sendgmr) by 2002:a25:b53:: with SMTP id
 80mr1548340ybl.45.1604038635364; Thu, 29 Oct 2020 23:17:15 -0700 (PDT)
Date:   Thu, 29 Oct 2020 23:16:55 -0700
Message-Id: <20201030061655.162839-1-dlatypov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH] kunit: tool: fix --raw_output to actually show output
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com
Cc:     davidgow@google.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Currently --raw_output means nothing gets shown.
Why?
Because `raw_output()` has a `yield` and therefore is a generator, which
means it only executes when you ask it for a value.

Given no one actually is using it as a generator (checked via the added
type annotation), drop the yield so we actually print the output.

Also strip off the trailing \n (and any other whitespace) to avoid
  [<601d6d3a>] ? printk+0x0/0x9b

  [<601e5058>] ? kernel_init+0x23/0x14b

  [<600170d2>] ? new_thread_handler+0x82/0xc0
making the output unreadable.

Signed-off-by: Daniel Latypov <dlatypov@google.com>
---
 tools/testing/kunit/kunit_parser.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 8019e3dd4c32..c44bb7c27ce6 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -63,10 +63,9 @@ def isolate_kunit_output(kernel_output):
 		elif started:
 			yield line[prefix_len:] if prefix_len > 0 else line
 
-def raw_output(kernel_output):
+def raw_output(kernel_output) -> None:
 	for line in kernel_output:
-		print(line)
-		yield line
+		print(line.rstrip())
 
 DIVIDER = '=' * 60
 

base-commit: 07e0887302450a62f51dba72df6afb5fabb23d1c
-- 
2.29.1.341.ge80a0c044ae-goog

