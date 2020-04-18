Return-Path: <SRS0=a/fv=6C=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B84CC4CC77
	for <linux-kselftest@archiver.kernel.org>; Sat, 18 Apr 2020 14:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7127A21D82
	for <linux-kselftest@archiver.kernel.org>; Sat, 18 Apr 2020 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587221380;
	bh=6EANkOU5+JVh6iSfkdwyirWkAQqzQTK44M4nd2mmmsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=L3bf7bp/t7mTPo7L6dKBEbLrjQtM1nBc7xU0sPTqC8YDvabJLWnfAV5ueLWEjrjo3
	 5XuPNsUz1LnKuzOM3jIX3t+V2HPGIw0PqdxEd+skfNch/MoRrKaT3urFGgvdtGJfF/
	 V6D2KFo6rnOoDM85B95DZCiaz3zxuF+t+1Gfs0g8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgDROnX (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 18 Apr 2020 10:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbgDROnX (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 18 Apr 2020 10:43:23 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A4DB21974;
        Sat, 18 Apr 2020 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587221002;
        bh=6EANkOU5+JVh6iSfkdwyirWkAQqzQTK44M4nd2mmmsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vYqA/GwhVsZPpI0UhOFGfVRNbVpP2erf6brmTjlLizzqm4iZI4HiMf8WR9/qNPjmk
         179uzLwORFY/FQu2V7DWD2hm6TAhMM+D089sVOamUYinWgQQtShJbE+vBiCFT1RNiL
         we49MqpbKQlSyfdbGG0PL0WBoc6OuHMkNpyC8Wu4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 44/47] tracing/selftests: Turn off timeout setting
Date:   Sat, 18 Apr 2020 10:42:24 -0400
Message-Id: <20200418144227.9802-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144227.9802-1-sashal@kernel.org>
References: <20200418144227.9802-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

[ Upstream commit b43e78f65b1d35fd3e13c7b23f9b64ea83c9ad3a ]

As the ftrace selftests can run for a long period of time, disable the
timeout that the general selftests have. If a selftest hangs, then it
probably means the machine will hang too.

Link: https://lore.kernel.org/r/alpine.LSU.2.21.1911131604170.18679@pobox.suse.cz

Suggested-by: Miroslav Benes <mbenes@suse.cz>
Tested-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/ftrace/settings | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/ftrace/settings

diff --git a/tools/testing/selftests/ftrace/settings b/tools/testing/selftests/ftrace/settings
new file mode 100644
index 0000000000000..e7b9417537fbc
--- /dev/null
+++ b/tools/testing/selftests/ftrace/settings
@@ -0,0 +1 @@
+timeout=0
-- 
2.20.1

