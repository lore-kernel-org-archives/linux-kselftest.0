Return-Path: <SRS0=7AXU=EC=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72014C55178
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Oct 2020 00:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4017D20747
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Oct 2020 00:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603759567;
	bh=Wy/KydK0ZqcnH/mktZ3ZcmM4o49aYFBg/WnZ0CpR5oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1Uf1+eifGq3ToKS3IAxd+XJC58aUx6vUMUW/lEa49TqGIgCsVq90ye3KzRDotYAMe
	 kOjsQayYCJ3knwwrxDb3HRthlgDVGWeUPi2UOJ+fXRuDFk2YRR7ECW7U3GvDbHVON4
	 ClAJd15u22ji/OVtgk72XwVIYZWCbPd57k2296H0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409121AbgJ0Anw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Oct 2020 20:43:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:49586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409083AbgJZXuS (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Oct 2020 19:50:18 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71FC7221F8;
        Mon, 26 Oct 2020 23:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756218;
        bh=Wy/KydK0ZqcnH/mktZ3ZcmM4o49aYFBg/WnZ0CpR5oo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zMDaxVQ51s3wNp80SAy5GJb+BUtBffhQ+8M9MNubtNnSF9JEDCq3MlsvwUBzH8RPS
         7rMdeAWH6mVFD758ASPO5zNcYru0B2EmVIKKqWC6uXXB27nOcttxU2EcPb/KT19LXy
         XS+32Y0W/w2skcfMC6uUMbj64DE7XddgufnEOjq4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 058/147] selftests/powerpc: Make using_hash_mmu() work on Cell & PowerMac
Date:   Mon, 26 Oct 2020 19:47:36 -0400
Message-Id: <20201026234905.1022767-58-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 34c103342be3f9397e656da7c5cc86e97b91f514 ]

These platforms don't show the MMU in /proc/cpuinfo, but they always
use hash, so teach using_hash_mmu() that.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200819015727.1977134-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 18b6a773d5c73..638ffacc90aa1 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -318,7 +318,9 @@ int using_hash_mmu(bool *using_hash)
 
 	rc = 0;
 	while (fgets(line, sizeof(line), f) != NULL) {
-		if (strcmp(line, "MMU		: Hash\n") == 0) {
+		if (!strcmp(line, "MMU		: Hash\n") ||
+		    !strcmp(line, "platform	: Cell\n") ||
+		    !strcmp(line, "platform	: PowerMac\n")) {
 			*using_hash = true;
 			goto out;
 		}
-- 
2.25.1

