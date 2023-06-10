Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D565C7EE29
	for <linux-kselftest@archiver.kernel.org>; Sat, 10 Jun 2023 18:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjFJSF7 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 10 Jun 2023 14:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjFJSF6 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 10 Jun 2023 14:05:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DEFE50;
        Sat, 10 Jun 2023 11:05:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1D1C6105C;
        Sat, 10 Jun 2023 18:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A357AC433D2;
        Sat, 10 Jun 2023 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686420356;
        bh=DdYmafNwiT1/eD53wB0QiM8uQZ9x+y5+IkqrAqX/48U=;
        h=From:To:Cc:Subject:Date:From;
        b=uwBvm9611dkZAN0IUuOdAD8ba8jbc9cZg8LOeD03vJ1iklBTfkM54CdShAwcmIf+J
         0H4JX3qyOXekOhkd3K1Jlri/o+sxt2dZEi1+P6gEgBT0jp7IRG7m17BUrTfPOy4LXB
         KIReYqoBylXxap+6nsIssxLko/MO3AikZkuWdd1JHeZUETltbxUkq2ZCL61B6fpG31
         1VFgtEuQ9r8/A2GBV69nkLxfdZcBb9ocN6qhoYoznNHg39PiAuW6Z4HdvDNLxSBTGF
         7yFs20J4l/mhFPj6yO/S7JLVa1bZl2YgbXuHyBoXGcQAdy3tGT2hTh9Ag3EPQkoolj
         xJKnY2KzGZ36Q==
From:   SeongJae Park <sj@kernel.org>
To:     brendanhiggins@google.com, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: [PATCH] MAINTAINERS: Add source tree entry for kunit
Date:   Sat, 10 Jun 2023 18:05:49 +0000
Message-Id: <20230610180549.82560-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Patches for kunit are managed in linux-kselftest tree before merged into
the mainline, but the MAINTAINERS section for kunit doesn't have the
entry for the tree.  Add it.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce5f343c1443..8a217438956b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11327,6 +11327,7 @@ L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
 S:	Maintained
 W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
 F:	Documentation/dev-tools/kunit/
 F:	include/kunit/
 F:	lib/kunit/
-- 
2.25.1

