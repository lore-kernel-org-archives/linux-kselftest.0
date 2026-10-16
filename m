Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653A2F7EE1
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121229; cv=none; b=lHhvaZIDtEBYWjqYwWaRaHFD2lcODkC5tVN4yX9NJVI9nMa1874hLLOWp5J4RMhjr/UTYQMk6XGUMcBresSUC+sHu5bJWm90wEdrSSIcEdQih1fI6W3G2ipP7NZGtoOjLeLBnqeKkHh1AFuAEIt82E1+0fIxBzuuMt2DpHD2o3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121229; c=relaxed/simple;
	bh=/VlbzGT1I3JhT4kb0vmmrNMzk6JfXiX50KYaXup3DEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piBKkEawqT/dAWDmRvT6TWehJyH88GGwHX4ULPo4LVNRl64AGXoP8Gtl/OEzCfAuPkzLFuNpDLpXVOUPucHR8aUh8z6bBdMz1UBZQY2ZB3M8MYxIKKfrrRc/BG/IgOl4MFKmWw2OX29zPPrZGZsSWTCnces2UJvIjsv7jG7Wdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOEZI/6u; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOEZI/6u"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8875d220446so3184240b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121228; x=1792726028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y837x6zsLDY7Lr6OWbl3JVY9ardcrHQBqEd20U8eVmY=;
        b=aOEZI/6uYuEBzCmL/qo3vZLbAd2DvnZRQ6K1uPz77J4R6gxeHkqNC45Z2nhAamMAul
         CTKwc0IdckT4floa+zCesYjin2tKEFeiQZIIkyMuRGCCY/pZQYfhMyUxKBGRU2jal3/K
         A1V1S6NjwHP/kfkADahCdnzCYdnQHyB39frqhbLeE7j0exzONjoy/wiyiA+jf1Y8fJvo
         0f4eSbEttlV3wzTjYNrfhZTM58nzFmFIm9Q5KIHpxyTtKn8uQkCh7VBuaZ3jeIreTGWI
         rNc9T8IpOZAX8Uj84qRr0TEuDmEdY8dqAuhOPsFOkHNAZZYOFFL5BaiH2mV4JLqBh+Up
         mXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121228; x=1792726028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y837x6zsLDY7Lr6OWbl3JVY9ardcrHQBqEd20U8eVmY=;
        b=yYqSua6z9zRJQjV+DFQecVH2foqZzzYKDQPSPTm+ZsLNMLGOeFONUkz1bzWPI2wFiT
         MzGqVqQJmHApq2NY0WnRCgAAXXMbs+0r9xwzE2m3HgOgKMwau2aXasnC5+X+F8N1QjfG
         +MwkUWJ26iebuUEx1rIPQ4XJXnRfQkuArenE6s6MG+UES63ts2+Ek+TIFam0TIGd6hEw
         EPNVUUmixLjp2gfXhjPIlfSngECmqjh4Lo0hl+nPhfXSckyKnso+8CxeHFYE+HcCl8Ez
         5RAo4iIFYbvwVfisUqTDbZWduy0jkoPDBBGIKz2kwhhD9gcOwIpJz0DScJO+EW/a0UBo
         qIqg==
X-Forwarded-Encrypted: i=1; AKwUvBwOHxOSu9WIH6/bjXC8VYIZWirmme1mr/3zJvMBHYHYoppWe6qJjJV0CgBbJpI6RKzjt1mtBGeXZkjec99j9+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTbAjnB9qwFYhBSmrsc51rA5rCoWAKZOzsCRq6k0NkxkVYaSTA
	gN6LXmheU08Yd2tv844Zf9vMdAoiB35Ofs7ATBJBdaJx4/jGu7aBswClcV2J4CRpgIA=
X-Gm-Gg: AYBFou2YLXlbkVQtD046IP8+ZWd5MBIS8rFbk50q+8fbPbtb7LYfRd+lBzNUto9O67+
	Fxtndt461vo3YglGNIn/HqfEufLZCUiy6hmiYIXOqfsKvaWiWJ5mKZPrGPC9EnSqcZnebxqj5Q3
	2VgK1n1pEv6dWEHKduHuLCjgaZFDh5XyCfCDAW4OHw4GnERydRoGz9MPLWTBk9Q+/jJA1XDzQTf
	8gx4UtmdLPCExsx08v5szldPanmkiLdqx36QDz73mFPCr+AUz5mCqN2jEJLJLk1wsxFQIwqbLd5
	sJ10hdKj5fDvAEaoNZTcZNOm6Hff38l15Xap29ElzPMl4rJatMbU1uz5iiu72e0J2X8V9Ef9Ot5
	3Dd9wWFoMTFjGcNL1xdFJjcY/bYUFpY8Bjqlc0Mq+ABy7Jw0Hj/UOmQgCkyO1MlLxNnHKT9wDph
	lYoilBxfdc13X1JKQiK9xlzDo+aoYOCPvse9167c7pG6EiPRgCLQJrey3ld9rlFyga4SEy6q8Jb
	VNWzVeX
X-Received: by 2002:a17:90a:d2ce:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ac99259edbmr4024010a91.31.1792121227907;
        Thu, 15 Oct 2026 20:27:07 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3f3ce5asm305110a91.3.2026.10.15.20.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:27:07 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Check for dynamic_events before clearing
Date: Fri, 16 Oct 2026 12:26:32 +0900
Message-ID: <20261016032655.82009-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trace instances do not have a dynamic_events file, but
clear_dynamic_events() is called during initialization. Check for the
file to avoid a "No such file or directory" error.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 tools/testing/selftests/ftrace/test.d/functions | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index 826141e299e5..4f2abb05e365 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -84,6 +84,8 @@ clear_synthetic_events() { # reset all current synthetic events
 }
 
 clear_dynamic_events() { # reset all current dynamic events
+    [ -f dynamic_events ] || return 0
+
     again=1
     stop=1
     # loop mulitple times as some events require other to be removed first
-- 
2.43.0

