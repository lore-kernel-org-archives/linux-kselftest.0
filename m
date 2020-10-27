Return-Path: <SRS0=7AXU=EC=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F38C55179
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Oct 2020 14:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A16320715
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Oct 2020 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603810693;
	bh=vT6TQiAhfCEnptE16SMHV42f9bp7lBiVGUO/RjqiwFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lsvPzkjewcr+zxHgnYJX1Xq7bDyNkzxaNGgfC9IN0GmFnLf6RGN0Ey6IAmBIdTEzE
	 uW3bwJCdLEi21stib3NCes86MepxVdslzFZlyWukiB9Q4Q3MWZViJ/4tFLV4x12HMl
	 bfeVpDdLXXtQWfszXnQPWJAlMAfwDH/FBspuXqWc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783357AbgJ0O6K (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 27 Oct 2020 10:58:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1783346AbgJ0O6J (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 27 Oct 2020 10:58:09 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF64320714;
        Tue, 27 Oct 2020 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603810688;
        bh=vT6TQiAhfCEnptE16SMHV42f9bp7lBiVGUO/RjqiwFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OByCnbB5mJqKl8mykiHfttSJQvFV5Qj23j6/qv5UGxjIGww6xSD7J5xA7mIROt+e7
         UH52qCdMRL38aKJdfCCEkESWD7UKN/bt6lskAuft8Q98JjQyUbF/ZoV6JyPiMVtqAY
         HIgT3obHesQm2h4s3yA9Yzm20HFK3IvNoxxLqjpk=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.8 211/633] selftests/lkdtm: Use "comm" instead of "diff" for dmesg
Date:   Tue, 27 Oct 2020 14:49:14 +0100
Message-Id: <20201027135532.579821523@linuxfoundation.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027135522.655719020@linuxfoundation.org>
References: <20201027135522.655719020@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

[ Upstream commit d00451c8118f8f7ab8e057bc6ee2f8b7d70b6a1c ]

Instead of full GNU diff (which smaller boot environments may not have),
use "comm" which is more available.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-kselftest@vger.kernel.org
Fixes: f131d9edc29d ("selftests/lkdtm: Don't clear dmesg when running tests")
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Link: https://lore.kernel.org/r/20200909211700.2399399-1-keescook@chromium.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/lkdtm/run.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lkdtm/run.sh b/tools/testing/selftests/lkdtm/run.sh
index 8383eb89d88a9..bb7a1775307b8 100755
--- a/tools/testing/selftests/lkdtm/run.sh
+++ b/tools/testing/selftests/lkdtm/run.sh
@@ -82,7 +82,7 @@ dmesg > "$DMESG"
 ($SHELL -c 'cat <(echo '"$test"') >'"$TRIGGER" 2>/dev/null) || true
 
 # Record and dump the results
-dmesg | diff --changed-group-format='%>' --unchanged-group-format='' "$DMESG" - > "$LOG" || true
+dmesg | comm --nocheck-order -13 "$DMESG" - > "$LOG" || true
 
 cat "$LOG"
 # Check for expected output
-- 
2.25.1



