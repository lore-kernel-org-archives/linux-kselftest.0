Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F62ECAAA1
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Sep 2022 20:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbiIIUaO (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Sep 2022 16:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiIIU3x (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Sep 2022 16:29:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4108B12D570;
        Fri,  9 Sep 2022 13:29:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CEDC2620BA;
        Fri,  9 Sep 2022 20:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CBAC433C1;
        Fri,  9 Sep 2022 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662755344;
        bh=q2B2bEaPY32bxTmDNGxPgX/Wuh5TeAA8MV5nuqGrMY0=;
        h=From:To:Cc:Subject:Date:From;
        b=JOWwHZQRdqyALR69+cnV85S7ykdL4p0wVWzxrBTBq2FA7dWXUKUkEBYH0oNiXuTNk
         N1dSyZ3C1hSybrC5qAeuhTeVcaJu2f3YdwkT0Ih+1HnplsqaP034mNihuILp2qBRbV
         pMg+fDB4NG9qn3ppAGbeie/zRVGli3HuzNEWDgMcfnXdLMbCZ3VtB1X4emL8Kya/Y9
         LefLdbVRjEoRvwLAwM6mcejPt8YEejNCybn/YbY2vS9uh4VVktYssprBhvbsMRGhFT
         EaFqQbRVuUFI8AbfPcGL9uWO8RHDDf3w57tpXLveg7WVuXwaY5XvNPzt+4nrRn1jTT
         LiwIiJkqv7ugw==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] mm/damon: minor fixes and cleanups
Date:   Fri,  9 Sep 2022 20:28:54 +0000
Message-Id: <20220909202901.57977-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This patchset contains minor fixes and cleanups for DAMON including

- selftest for a bug we found before (Patch 1), 
- fix of region holes in vaddr corner case and a kunit test for it
  (Patches 2 and 3), and
- documents/Kconfig updates for title wordsmithing (Patch 4) and more
  aggressive DAMON debugfs interface deprecation announcement
  (Patches 5-7).

SeongJae Park (7):
  selftest/damon: add a test for duplicate context dirs creation
  mm/damon/core: avoid holes in newly set monitoring target ranges
  mm/damon/core-test: test damon_set_regions
  Docs/admin-guide/mm/damon: rename the title of the document
  mm/damon/Kconfig: Notify debugfs deprecation plan
  Docs/DAMON/start: mention the dependency as sysfs instead of debugfs
  Docs/admin-guide/mm/damon/usage: note DAMON debugfs interface
    deprecation plan

 Documentation/admin-guide/mm/damon/index.rst  |  6 ++---
 Documentation/admin-guide/mm/damon/start.rst  | 13 +++------
 Documentation/admin-guide/mm/damon/usage.rst  |  5 ++++
 mm/damon/Kconfig                              |  3 +++
 mm/damon/core-test.h                          | 23 ++++++++++++++++
 mm/damon/core.c                               | 24 +++++++++++++++++
 tools/testing/selftests/damon/Makefile        |  1 +
 .../debugfs_duplicate_context_creation.sh     | 27 +++++++++++++++++++
 8 files changed, 89 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/damon/debugfs_duplicate_context_creation.sh

-- 
2.25.1

