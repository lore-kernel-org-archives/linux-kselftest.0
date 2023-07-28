Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EE7C41513
	for <linux-kselftest@archiver.kernel.org>; Fri, 28 Jul 2023 20:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjG1UfE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 28 Jul 2023 16:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbjG1Ue6 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 28 Jul 2023 16:34:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2818544B9;
        Fri, 28 Jul 2023 13:34:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4BD1621FD;
        Fri, 28 Jul 2023 20:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68D0C433C8;
        Fri, 28 Jul 2023 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690576491;
        bh=cjc8ooSUQ83tCK1u+lTmvslo5pngriB995qOBl2lfEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kZVzJF7D3covRVxGV8qlNVSYryTJADsCE2nkG3JlMM6KW9d11TNHzemNIWTQimTJK
         ffO0M4jAfUNnDSYV4c9DRRIB0VliGAVfq2/WXiijhELaaucip42BKwqrIHBcjqIaJD
         bVnh67z2b8iM5uSNPfJCZ1KxJ5yeEkYjeM8YTtQ4idTBJQzHSnwyViTad4T/Ago0h4
         h1HmW4PEjGdHDzBE+c0WSscxqojOd5yWq1PEFp9djhuFqImKaV0iUCkHaYqWM+1D5U
         LEC5LNT0heATO0ErxPQA1r1Qhcp8va2vn+6A5rWmwm3Muli5fwkwIJopgiP201Ruvx
         5GI/wU1T9CLGg==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Shuah Khan <shuah@kernel.org>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/13] selftests/damon/sysfs: test address range damos filter
Date:   Fri, 28 Jul 2023 20:34:35 +0000
Message-Id: <20230728203444.70703-5-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728203444.70703-1-sj@kernel.org>
References: <20230728203444.70703-1-sj@kernel.org>
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

