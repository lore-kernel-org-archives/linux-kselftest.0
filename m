Return-Path: <SRS0=MoeO=ZI=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D4BC33C9C
	for <linux-kselftest@archiver.kernel.org>; Sat, 16 Nov 2019 16:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83FFE21844
	for <linux-kselftest@archiver.kernel.org>; Sat, 16 Nov 2019 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573920580;
	bh=S0mzF6aUuCpWNC8VmiehPqJiME194Ey3syXdysl0clM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ngHQHJXS3mOxbBx3PIwbRyLXR7nd1nokc8Xyf51J1Gu5NQ+3Dnc58L7/iJdSsjY6a
	 dnp+NrIOAWSnwRh5BSga3yBQBJuMFnzAUmYFGh8GD3rPETxDhz8ko+s7yTPLPZByP3
	 NaAX/9oT3QtmxVSR4tj4KNu/w04jOrNEP5DGiQws=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbfKPPtc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 16 Nov 2019 10:49:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730279AbfKPPtc (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 16 Nov 2019 10:49:32 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8000620870;
        Sat, 16 Nov 2019 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573919371;
        bh=S0mzF6aUuCpWNC8VmiehPqJiME194Ey3syXdysl0clM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hoGZFIijQRPC0rpSWowznCHDynvU764TikZSv4StvDJgY8rDLUG61zFd4kHhEVYHH
         TJyVqiLHLGtSSO0sYyDCG/jFvLhhsRQAFFrApmbBNttthgOWFtmf5/mONou2LUg7Ae
         qDfQ1ykp3OaELrwsT+gaBqfnI9z70WFnmwCG+T7M=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 091/150] selftests/powerpc/switch_endian: Fix out-of-tree build
Date:   Sat, 16 Nov 2019 10:46:29 -0500
Message-Id: <20191116154729.9573-91-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154729.9573-1-sashal@kernel.org>
References: <20191116154729.9573-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 266bac361d5677e61a6815bd29abeb3bdced2b07 ]

For the out-of-tree build to work we need to tell switch_endian_test
to look for check-reversed.S in $(OUTPUT).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/switch_endian/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/switch_endian/Makefile b/tools/testing/selftests/powerpc/switch_endian/Makefile
index 30b8ff8fb82e7..e4cedfe9753d7 100644
--- a/tools/testing/selftests/powerpc/switch_endian/Makefile
+++ b/tools/testing/selftests/powerpc/switch_endian/Makefile
@@ -7,6 +7,7 @@ EXTRA_CLEAN = $(OUTPUT)/*.o $(OUTPUT)/check-reversed.S
 
 include ../../lib.mk
 
+$(OUTPUT)/switch_endian_test: ASFLAGS += -I $(OUTPUT)
 $(OUTPUT)/switch_endian_test: $(OUTPUT)/check-reversed.S
 
 $(OUTPUT)/check-reversed.o: $(OUTPUT)/check.o
-- 
2.20.1

