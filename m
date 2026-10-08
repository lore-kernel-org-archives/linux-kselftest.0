Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D4338F928
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469614; cv=none; b=U0vBPQDESsSsf8dNft1ZG+9xWWi8kGxOZOrvAvxaXJrTNFioI6MMba5KrEhqS8Qlh+mwsmxpZ5eVlJcUJE/P/Z7b2EwHFKLa32o4B2UvLjemzqAA0KLMvsV+/5lHrsRnbW/OoSFz+3bkuGatHT1V4Om8T03700JMoaaQc7d4hA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469614; c=relaxed/simple;
	bh=HS5yOBYiZ058h/wpb1UYDX2Ue4vkhWub7/TgfhV8N3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nk0NLZVKFWn9/y6QgXgF+FLZ6+LWm/7KrbNH8XyBSEH/fENpvGLdD5dKkfyCM0jc0wBxuwwALjU/tbx2OLL3yxAiz15hpJqS9TA7k+imA3MmD6ItPzf97nqKX0wEg39O/LuocTAnuLLOP0JuMYbd9ySi33IU3yjerh6338hMXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTrlFhS3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTrlFhS3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so28476895e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469612; x=1792074412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVw1QUZuaH3ZcSzm0mPG+DaMPROlxEncr+19WY0rOvQ=;
        b=FTrlFhS3wMbJE9cajAbnJjAzZ1Mzz3wqJIkywkLpFcknf77PnbVbwoGFgD99x/gYgO
         EvKCp0qOKhFY3tm8te8GYgnh/vwsY3HGqwsT6cYQHSUGKI5rjSg33PWXs/UTSxNzcjXW
         6uNSpqNMlQ0SV5gOg4QTa1tg8U+MCi0sKvkhBULDugW++3ISRxFrJ6fdOukiQ5SNVD/C
         we/IOdGiRGmeVEfA91plRr6QSl4XE+M58PcYhIaYiEF4M68D2HgqOhUXEBY3u7XOGA4/
         k81C4iQcP/H58Kzi3Q25VULnMakQvpj7NT0EFcSUVXH1LdgNqD6Oskt7LGZm09MZenXs
         vpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469612; x=1792074412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVw1QUZuaH3ZcSzm0mPG+DaMPROlxEncr+19WY0rOvQ=;
        b=0l8xzw8zBUAmVC46mRl1vhxeJaUG+ozFY4sMipynEnjFdceQ1T2PmD98w0UIR2wqgj
         PxToNfb67TPrlgYJ1MVRBs3QpSKY1f4wUWW/WRkk3ox78wsK+8UpbEHd8lOHFq47E4yv
         yuU/yRIf7gXyfQooOj6aAeyO2WlOSp/fp9ZXnwebl/B3ilgAmDV+sJ9zP8nirtLT+S3+
         RLHnseGndqQg0ErN0sPxNwUIVvfW0sG9OCdKu3l6MIOgidrq04kq3MmtL46FoNE9bSWD
         byp+Cqg7OLPobCF1OA/yLr7esmHvZJvw+2D2jEYx9ncnx4UWw5rqZkkAh9RW4vGc06+M
         DsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2TasZ+jxj9EHUNqlStXmO91ekxWvt3vxHLkQi3EKzzquAClDDVmu8Ep5E0nZfgBOm/RGM5dc1uqOG9GxdDV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nTmfbsuCt+MkR4RFe5SsmVwg8rQdu7O2YtRlq6tdHzSvo5S4EC
	Fj1+C1P1OF8W+Z0paQ7O4iphTnoxtL+2RmyvjxF/NyIlCe7eQwq4F8GOD6m1roac
X-Gm-Gg: AYBFou33pIZyOmF0OR9Qmewl9fY+k+sjzva5K1nciWry7WzNvJ3okFOtRWjE6mONHzn
	Xd8NbWPAOaU61dbebgjc4rGo8go265zqq2EFTR67VXS3+AbnfqWKXayJbgEClJNg6mBAqxOtyfh
	Fdpd2BYrUxesqWXOMZ2Xll3q67kiV+v3M49nwjgiV5O5F3y5+rpsGXm0uiWF7yiJ8z53bjdOX8k
	lDmM3MowEaG25/obW+YnOu8oQUqfe9dcBr7B8mTv+rQEQ3vVuqvEtc1PRT91X05r0YtLyFFjN06
	v1VReSx6hVfuT5QjTZWOw22lOR2W4JYPGLV5ZdWHEglk2PxPrH22f2sV4RodII2gdkMxB0y3hAI
	jU9XKN6GalV0VV3vFQZ1ZeS3mkx97fPrWQTI669bN8D9D3Jv9K49HLIretizZ8Bl8pEDkywmMsF
	pJRhBPti64DlWW/fdc2uO6+he+f3Dx2gNIwRGddO+QLZqTtQXZjd1eqgC1KnLDEQQYs4qQ3Guj8
	bVXkszw3M1BkoK3H6bA4vk=
X-Received: by 2002:a05:600c:8b62:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a1800d68d7mr106252515e9.2.1791469611527;
        Thu, 08 Oct 2026 07:26:51 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a16b2sm82107875e9.3.2026.10.08.07.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:51 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/27] selftests/landlock: Check the thread result in audit.thread
Date: Thu,  8 Oct 2026 16:25:32 +0200
Message-ID: <20261008142604.39107-5-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

thread_audit_test() reports failures through its return value, but
audit.thread joins the thread with a NULL result pointer, so these
failures go unnoticed.

Check the returned value, as the other thread-based audit tests do.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 502a0825d877..81cb31aa32ad 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -227,6 +227,7 @@ TEST_F(audit, thread)
 	__u64 allocated_dom = 2;
 	__u64 deallocated_dom = 3;
 	pthread_t thread;
+	void *thread_ret;
 	int pipe_child[2], pipe_parent[2];
 	char buffer;
 	struct thread_data child_data;
@@ -270,7 +271,8 @@ TEST_F(audit, thread)
 	/* Signals the thread to exit, which will generate a domain deallocation. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
 	EXPECT_EQ(0, close(pipe_parent[1]));
-	ASSERT_EQ(0, pthread_join(thread, NULL));
+	ASSERT_EQ(0, pthread_join(thread, &thread_ret));
+	EXPECT_EQ(NULL, thread_ret);
 
 	EXPECT_EQ(0, matches_log_domain_deallocated(
 			     self->audit_fd, 1, denial_dom, &deallocated_dom));
-- 
2.56.0

