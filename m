Return-Path: <SRS0=OJci=DZ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75693C433E7
	for <linux-kselftest@archiver.kernel.org>; Sun, 18 Oct 2020 19:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E5122276
	for <linux-kselftest@archiver.kernel.org>; Sun, 18 Oct 2020 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603051095;
	bh=GrcLZmrxFXVHJ35eCaG1Z3riYNFmVNR5GkU39zw4gXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TorYsj3lPumZCziCqJiHXBxB1Ea7mjIoSz4l253IenjOzi3HZkF8zM4mKr/PMKcJu
	 zJJY/mOuoXQQManvCLbASG8fcNd2LP1YaBkwApV9eoaKtz5pRXhiyx581gtzujIRQf
	 G2Ytonu6Cr1iRLVZESKzoyouymSCyjEeM3QPFF+0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388293AbgJRT6E (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 18 Oct 2020 15:58:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728100AbgJRTTM (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 18 Oct 2020 15:19:12 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07A5A222C8;
        Sun, 18 Oct 2020 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048751;
        bh=GrcLZmrxFXVHJ35eCaG1Z3riYNFmVNR5GkU39zw4gXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hmHuLB3yCUFj2ztauKJZEBsBz6uSEdhmkHKdwrRWVIaEc+ARRdJPL9AicHhEcnLbq
         Ow+8pvKl/W/YhtqDGvA+Iv7hD1mDzPOqqLzDrB5EPKwhiF8P2UsVZsMJ6Sfmk/0XDX
         9NVu7VmUKjuunK2CZ1ghhrriI6LmrXwhgbqwg2tU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alan Maguire <alan.maguire@oracle.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 053/111] selftests/bpf: Fix overflow tests to reflect iter size increase
Date:   Sun, 18 Oct 2020 15:17:09 -0400
Message-Id: <20201018191807.4052726-53-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Alan Maguire <alan.maguire@oracle.com>

[ Upstream commit eb58bbf2e5c7917aa30bf8818761f26bbeeb2290 ]

bpf iter size increase to PAGE_SIZE << 3 means overflow tests assuming
page size need to be bumped also.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/1601292670-1616-7-git-send-email-alan.maguire@oracle.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/bpf/prog_tests/bpf_iter.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
index 7375d9a6d2427..a8924cbc7509d 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
@@ -331,7 +331,7 @@ static void test_overflow(bool test_e2big_overflow, bool ret1)
 	struct bpf_map_info map_info = {};
 	struct bpf_iter_test_kern4 *skel;
 	struct bpf_link *link;
-	__u32 page_size;
+	__u32 iter_size;
 	char *buf;
 
 	skel = bpf_iter_test_kern4__open();
@@ -353,19 +353,19 @@ static void test_overflow(bool test_e2big_overflow, bool ret1)
 		  "map_creation failed: %s\n", strerror(errno)))
 		goto free_map1;
 
-	/* bpf_seq_printf kernel buffer is one page, so one map
+	/* bpf_seq_printf kernel buffer is 8 pages, so one map
 	 * bpf_seq_write will mostly fill it, and the other map
 	 * will partially fill and then trigger overflow and need
 	 * bpf_seq_read restart.
 	 */
-	page_size = sysconf(_SC_PAGE_SIZE);
+	iter_size = sysconf(_SC_PAGE_SIZE) << 3;
 
 	if (test_e2big_overflow) {
-		skel->rodata->print_len = (page_size + 8) / 8;
-		expected_read_len = 2 * (page_size + 8);
+		skel->rodata->print_len = (iter_size + 8) / 8;
+		expected_read_len = 2 * (iter_size + 8);
 	} else if (!ret1) {
-		skel->rodata->print_len = (page_size - 8) / 8;
-		expected_read_len = 2 * (page_size - 8);
+		skel->rodata->print_len = (iter_size - 8) / 8;
+		expected_read_len = 2 * (iter_size - 8);
 	} else {
 		skel->rodata->print_len = 1;
 		expected_read_len = 2 * 8;
-- 
2.25.1

