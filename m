Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE0EC04FE1
	for <linux-kselftest@archiver.kernel.org>; Wed,  2 Aug 2023 21:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbjHBVnV (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 2 Aug 2023 17:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjHBVnU (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 2 Aug 2023 17:43:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F01198A;
        Wed,  2 Aug 2023 14:43:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47E3B61B38;
        Wed,  2 Aug 2023 21:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A000C433CC;
        Wed,  2 Aug 2023 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691012598;
        bh=cjc8ooSUQ83tCK1u+lTmvslo5pngriB995qOBl2lfEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ikb6ovw/+AobHS2orGwswuXn2tlkNHwauXcRV6Typ+Y049vivhXS52JNo31EJITXY
         emfTMVPVnHa84OqOMbZVTo5kbKeKGHOpjFsOIeWxAksOBD1KxT8ZuTuTDN9rHg/Wtg
         F6AsCQyf2TOaPUNj4vCWIaI9DFBrBCpREyoQkRdtVM0UMwWQZ0IvN7lTXtGoZETgG1
         Zy9ankfs8/EVYFpEOb4r0JbOi6tvKYPa9H418hI6X4RnEuTQTALWYSvV2UiFkf7cm9
         hWtnjYErjiGV3ODf3wRp8IeVQt7UDKHS7oVF7VZO8K+omnCY5RDlEJw9kWy79bTpag
         AZGMQFafNxOcQ==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Shuah Khan <shuah@kernel.org>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] selftests/damon/sysfs: test address range damos filter
Date:   Wed,  2 Aug 2023 21:43:03 +0000
Message-Id: <20230802214312.110532-5-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802214312.110532-1-sj@kernel.org>
References: <20230802214312.110532-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Add a selftest for checking existence of addr_{start,end} files under
DAMOS filter directory, and 'addr' damos filter type input of DAMON
sysfs interface.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 tools/testing/selftests/damon/sysfs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/damon/sysfs.sh b/tools/testing/selftests/damon/sysfs.sh
index 967e27267549..5677cfd342fc 100644
--- a/tools/testing/selftests/damon/sysfs.sh
+++ b/tools/testing/selftests/damon/sysfs.sh
@@ -103,9 +103,12 @@ test_filter()
 	ensure_file "$filter_dir/type" "exist" "600"
 	ensure_write_succ "$filter_dir/type" "anon" "valid input"
 	ensure_write_succ "$filter_dir/type" "memcg" "valid input"
+	ensure_write_succ "$filter_dir/type" "addr" "valid input"
 	ensure_write_fail "$filter_dir/type" "foo" "invalid input"
 	ensure_file "$filter_dir/matching" "exist" "600"
 	ensure_file "$filter_dir/memcg_path" "exist" "600"
+	ensure_file "$filter_dir/addr_start" "exist" "600"
+	ensure_file "$filter_dir/addr_end" "exist" "600"
 }
 
 test_filters()
-- 
2.25.1

