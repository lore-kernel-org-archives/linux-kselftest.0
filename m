Return-Path: <SRS0=rOeY=EB=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B05DC55178
	for <linux-kselftest@archiver.kernel.org>; Mon, 26 Oct 2020 23:52:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F52021D7B
	for <linux-kselftest@archiver.kernel.org>; Mon, 26 Oct 2020 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603756377;
	bh=s7HO3kJ3IJ3+Hgbu3ZKKnFqr4ZVc22GMfUCDuqNgJzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=i3q+9/w9hqtEPNWkjDsDgxIhNl0tJVuJpXI0GPLMy5yvF9c5aIJYgPuCBePaQMTCH
	 AfvMEAMg/ijs2wRh70sDTo7575WIar4nJMJSKzd7D7nIxFtYt/DBtlfh//Ka//zd3C
	 VZpWH5qNaY2LZe9NikGYyDIGEIHI6YmKjjvlWEK8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409885AbgJZXwu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:52:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409744AbgJZXwt (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Oct 2020 19:52:49 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BFCB21BE5;
        Mon, 26 Oct 2020 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756369;
        bh=s7HO3kJ3IJ3+Hgbu3ZKKnFqr4ZVc22GMfUCDuqNgJzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A4w1L3Wzpx4dvkwqgvBnnJgMtOnRgBh/N0dszLwmMwB/zIK8eKUhZkOZ5aA0yJVtb
         jToXFbweERqG7YBd1lbKo0jK5Oookl5AUH/L8aXKJMJRuEn9ZDhIEiteiiKf0oFwKD
         9HSsmIcYzSzDvgBl6FniIE8uzqkpTQifltaiwwY4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 036/132] selftests/x86/fsgsbase: Reap a forgotten child
Date:   Mon, 26 Oct 2020 19:50:28 -0400
Message-Id: <20201026235205.1023962-36-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Andy Lutomirski <luto@kernel.org>

[ Upstream commit ab2dd173330a3f07142e68cd65682205036cd00f ]

The ptrace() test forgot to reap its child.  Reap it.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/e7700a503f30e79ab35a63103938a19893dbeff2.1598461151.git.luto@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/x86/fsgsbase.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
index 15a329da59fa3..5f3aea210e018 100644
--- a/tools/testing/selftests/x86/fsgsbase.c
+++ b/tools/testing/selftests/x86/fsgsbase.c
@@ -499,6 +499,9 @@ static void test_ptrace_write_gsbase(void)
 
 END:
 	ptrace(PTRACE_CONT, child, NULL, NULL);
+	wait(&status);
+	if (!WIFEXITED(status))
+		printf("[WARN]\tChild didn't exit cleanly.\n");
 }
 
 int main()
-- 
2.25.1

