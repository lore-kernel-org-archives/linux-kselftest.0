Return-Path: <SRS0=6Lwb=7V=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079E8C433E0
	for <linux-kselftest@archiver.kernel.org>; Mon,  8 Jun 2020 23:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C472C20659
	for <linux-kselftest@archiver.kernel.org>; Mon,  8 Jun 2020 23:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591660619;
	bh=uZ84vTGYlo4IboKjY879TBGBz6Hhr7Vq0yu0/6vxmZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tJHQshWuwBtw06ex4HcHAyqpvZwnu0hWmFFfWtGenwdDoQt9OjyrU47LPm6s9xY10
	 Ca/thEaDB9AZ/3YDEIvKj/a5T8cBNt2a0upNhpkGK7DnwRjdOEHGVY8zgUpIUOiUHG
	 du8M/IZLO3ej1tPxpIoGk6STTWt93M25iiplxUNY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731918AbgFHX4s (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 8 Jun 2020 19:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731162AbgFHXXj (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 8 Jun 2020 19:23:39 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 671F720872;
        Mon,  8 Jun 2020 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658619;
        bh=uZ84vTGYlo4IboKjY879TBGBz6Hhr7Vq0yu0/6vxmZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a7YPaHmpKvtJX4DuhJ/p1eoxlA2l9V3G7Kdl2I6sJGwDNLg1ShRMcPty662Gin8A8
         AVnCOEBgQ8XCOfMgxxJH4vessh0wlOhLQY6TYziY9Q3n6P70J78l9PjpQmaW2inq2Q
         gl/Pd9ygyHoT/Ke6njhNFcNI+P8jK3EI5ApSqxwQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andrii Nakryiko <andriin@fb.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 044/106] selftests/bpf: Fix memory leak in extract_build_id()
Date:   Mon,  8 Jun 2020 19:21:36 -0400
Message-Id: <20200608232238.3368589-44-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608232238.3368589-1-sashal@kernel.org>
References: <20200608232238.3368589-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Andrii Nakryiko <andriin@fb.com>

[ Upstream commit 9f56bb531a809ecaa7f0ddca61d2cf3adc1cb81a ]

getline() allocates string, which has to be freed.

Fixes: 81f77fd0deeb ("bpf: add selftest for stackmap with BPF_F_STACK_BUILD_ID")
Signed-off-by: Andrii Nakryiko <andriin@fb.com>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Cc: Song Liu <songliubraving@fb.com>
Link: https://lore.kernel.org/bpf/20200429012111.277390-7-andriin@fb.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/bpf/test_progs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 89f8b0dae7ef..bad3505d66e0 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -1118,6 +1118,7 @@ static int extract_build_id(char *build_id, size_t size)
 		len = size;
 	memcpy(build_id, line, len);
 	build_id[len] = '\0';
+	free(line);
 	return 0;
 err:
 	fclose(fp);
-- 
2.25.1

