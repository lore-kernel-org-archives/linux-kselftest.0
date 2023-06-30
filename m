Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1186FEB64DA
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Jun 2023 18:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjF3SjS (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Jun 2023 14:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjF3SjO (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Jun 2023 14:39:14 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3946619AF;
        Fri, 30 Jun 2023 11:39:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EE3271F8BF;
        Fri, 30 Jun 2023 18:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1688150350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6BmQ7Ou90mXrw1i1JySDLRPRos1xC6XTC4e8yECyu7A=;
        b=oqniinXgT77kTbeEaOEktWtFChIjGDREnpNG4pBy9q4Nchv1U5gZO/7A9LUWxXlqwZtOq3
        DDhdTxIxAIxg/+9HUouoJwmHmVK8Nt6kpYbBiLrXzWhKLES+69pnTcUvoLPRNluDJoZ4jP
        TWkIEUyFplzTdPayKyBil4MFWgOkh7I=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2887138F8;
        Fri, 30 Jun 2023 18:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gBUoLk4hn2QgbQAAMHmgww
        (envelope-from <mkoutny@suse.com>); Fri, 30 Jun 2023 18:39:10 +0000
From:   =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To:     linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Waiman Long <longman@redhat.com>,
        Zefan Li <lizefan.x@bytedance.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 0/3] cpuset: Allow setscheduler regardless of manipulated task
Date:   Fri, 30 Jun 2023 20:39:05 +0200
Message-ID: <20230630183908.32148-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Changes in v2:
- rebased on mainline
- drop is_in_v2_mode()

Changes in v1 (https://lore.kernel.org/r/20230629091146.28801-1-mkoutny@suse.com):
- added selftests
- comments rewording

RFC in https://lore.kernel.org/r/20220623124944.2753-1-mkoutny@suse.com

Michal Koutný (3):
  cpuset: Allow setscheduler regardless of manipulated task
  selftests: cgroup: Minor code reorganizations
  selftests: cgroup: Add cpuset migrations testcase

 MAINTAINERS                                   |   2 +
 kernel/cgroup/cpuset.c                        |  13 +-
 tools/testing/selftests/cgroup/.gitignore     |   1 +
 tools/testing/selftests/cgroup/Makefile       |   2 +
 tools/testing/selftests/cgroup/cgroup_util.c  |   2 +
 tools/testing/selftests/cgroup/cgroup_util.h  |   2 +
 tools/testing/selftests/cgroup/test_core.c    |   2 +-
 tools/testing/selftests/cgroup/test_cpuset.c  | 272 ++++++++++++++++++
 .../selftests/cgroup/test_cpuset_prs.sh       |   2 +-
 9 files changed, 293 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/cgroup/test_cpuset.c


base-commit: e55e5df193d247a38a5e1ac65a5316a0adcc22fa
-- 
2.41.0

