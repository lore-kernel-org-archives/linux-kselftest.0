Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBCEC678D5
	for <linux-kselftest@archiver.kernel.org>; Tue, 10 Jan 2023 19:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239157AbjAJTEk (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 10 Jan 2023 14:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbjAJTEK (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 10 Jan 2023 14:04:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486C913E90;
        Tue, 10 Jan 2023 11:04:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3A93618A8;
        Tue, 10 Jan 2023 19:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CDBC43396;
        Tue, 10 Jan 2023 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673377449;
        bh=y7EJfcMY/StD0BzUoTQruwXSI1p0oqW6ITb/hdOvcrQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CLZxihBAiJLZVfs0Gql2wf2QPPpAjOoIvVTvC1iFyj15MBftu/CkfH34Vda0M8H6A
         LVdNE4VpqvAcjUx/zCJtqza160cp3d50h7xIVoxs60At+V3fa0aN6iunDJ7NIIJT0Y
         uLELoRXyzQpaM/X4QQJzBSrER3vmzj0DSOzyhP+cmAqIO2ldcW1K5BrRXmvprqlOio
         kWJAaRkw33Y7Qb2FfE3pAkEjdB919Knkdv2dqXm3aJMFHqS3pmTEWyFN8SzIhwt0tx
         J9xaMoKq9Ad7/6vJKGdeOLKcMhTsN2yzZvnJLAmfSx3F+TGIGrmbMuIwiZejTfiXQw
         gS7Fy5LrDtfzw==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Shuah Khan <shuah@kernel.org>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] selftests/damon/sysfs: hide expected write failures
Date:   Tue, 10 Jan 2023 19:03:59 +0000
Message-Id: <20230110190400.119388-8-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110190400.119388-1-sj@kernel.org>
References: <20230110190400.119388-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

DAMON selftests for sysfs (sysfs.sh) tests if some writes to DAMON sysfs
interface files fails as expected.  It makes the test results noisy with
the failure error message because it tests a number of such failures.
Redirect the expected failure error messages to /dev/null to make the
results clean.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 tools/testing/selftests/damon/sysfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/damon/sysfs.sh b/tools/testing/selftests/damon/sysfs.sh
index a00336ffdcad..bcd4734ca094 100644
--- a/tools/testing/selftests/damon/sysfs.sh
+++ b/tools/testing/selftests/damon/sysfs.sh
@@ -24,7 +24,7 @@ ensure_write_fail()
 	content=$2
 	reason=$3
 
-	if echo "$content" > "$file"
+	if (echo "$content" > "$file") 2> /dev/null
 	then
 		echo "writing $content to $file succeed ($fail_reason)"
 		echo "expected failure because $reason"
-- 
2.25.1

