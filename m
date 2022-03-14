Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D0DC433EF
	for <linux-kselftest@archiver.kernel.org>; Mon, 14 Mar 2022 22:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbiCNWPW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 14 Mar 2022 18:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245517AbiCNWPV (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 14 Mar 2022 18:15:21 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFD73D4A5
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Mar 2022 15:14:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9F0D6210F9;
        Mon, 14 Mar 2022 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1647296048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=H84RPCMXpKhrZ+BTVcSEuIB4xsBCmAmL1uOsBNWsNbM=;
        b=1Ym+fkKrc3IUacgIif9lBJph3Hx4yhZvPSovCjLrb8Bpc2Dmg72JViy4nNd0uGth5et87/
        hNWTJqcQKwwUa9oq8ZPKbfh5lpEnK+iioaGIxX5lZFiSUN1QRY43WEx1CZoHnRghfpRCSy
        W8fvPs59ll/sKMJfkjZlHWPaPkuIqjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1647296048;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=H84RPCMXpKhrZ+BTVcSEuIB4xsBCmAmL1uOsBNWsNbM=;
        b=0pDQdnEoSXxPc6f11l2hL+/upOAAW/f1igKa4bRku69RF9UWt7mOmlQrbfXzkSazeGIvXs
        XSIvK5cs+rFIOoDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7802013ADA;
        Mon, 14 Mar 2022 22:14:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 09yrGzC+L2IeKAAAMHmgww
        (envelope-from <dmueller@suse.de>); Mon, 14 Mar 2022 22:14:08 +0000
From:   =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
To:     linux-kselftest@vger.kernel.org
Cc:     =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
Subject: [PATCH] selftests/vm: depend on bash in shebang
Date:   Mon, 14 Mar 2022 23:13:43 +0100
Message-Id: <20220314221343.30368-1-dmueller@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This script uses bash specific syntax. make it more specific by
declaring it to be used via bash rather than /bin/sh which could
be non-bash.

Signed-off-by: Dirk Müller <dmueller@suse.de>
---
 tools/testing/selftests/vm/charge_reserved_hugetlb.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/charge_reserved_hugetlb.sh b/tools/testing/selftests/vm/charge_reserved_hugetlb.sh
index a5cb4b09a46c..751d20a2eea8 100644
--- a/tools/testing/selftests/vm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/vm/charge_reserved_hugetlb.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 # Kselftest framework requirement - SKIP code is 4.
-- 
2.35.1

