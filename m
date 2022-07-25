Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF91C433EF
	for <linux-kselftest@archiver.kernel.org>; Mon, 25 Jul 2022 22:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbiGYWHy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 25 Jul 2022 18:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236979AbiGYWHu (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 25 Jul 2022 18:07:50 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473F422BD9;
        Mon, 25 Jul 2022 15:07:49 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1658786866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=NaV3pwTotSWczUCLcr3u0HZUmIVekNWTojKE6SNQdwY=;
        b=HyMqri5hcE3oLHwylr9oBkM/zKR3PvX87dYccgUggvlny63FjWaA50r4fO69TPGd4B67tv
        y22aRmG7j6qTt6h+dTc6y0XyReCwaMaHIyHeQLFfO7CIc8mxziVPmiD2xE92K9EYnUwgys
        cRmFe3KdcT9OLqIlNaT5wP5m51dbZ/M=
From:   Brendan Higgins <brendan.higgins@linux.dev>
To:     shuah@kernel.org, davidgow@google.com, dlatypov@google.com,
        akpm@linux-foundation.org, brendanhiggins@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Brendan Higgins <brendan.higgins@linux.dev>
Subject: [PATCH v1] MAINTAINERS: kunit: Add David Gow as a maintainer of KUnit
Date:   Mon, 25 Jul 2022 18:07:37 -0400
Message-Id: <20220725220737.790976-1-brendan.higgins@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

David has been a de facto maintainer of KUnit for a long time now.
Formalize this in the MAINTAINERS file.

Signed-off-by: Brendan Higgins <brendan.higgins@linux.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64379c699903..782da36b524f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10890,6 +10890,7 @@ F:	fs/smbfs_common/
 
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendanhiggins@google.com>
+M:	David Gow <davidgow@google.com>
 L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
 S:	Maintained
-- 
2.37.1.359.gd136c6c3e2-goog

