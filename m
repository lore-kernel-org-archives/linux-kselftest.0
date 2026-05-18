Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8638CFED
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131523; cv=none; b=JKmQ4hpjsK0rxrlilnscLX+zbRvEtkRe+6RxDDX4hA2ckMz4Aji0lcf1J9NxMRz9TK7JmP3N9vBMbCHRlIzoz43UdtyAG14CZiRGQe8k4S49hPZyKsK7AItFTaTQpwWNS1U8M0OE4EAfKinRK6S+Zo6S25g34fnbBYF3N8PrqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131523; c=relaxed/simple;
	bh=SYNaiWE+6z74HiqRR6DYEYa5dSi13wZDsECVnOFu4jw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GjFQDmLihCmBQXztyB41cB2PRkAmVvjZVCQrdsQHsDHMTHfY3HvnA/YDuYkzI8sFuAVhOFG0i7/GzcgbnMHAk3a0rK6yx3lc7bCxr2THTVrTAp+4FSuFb8MDJDD9MxZ5Q+u1t7oToc+VSD2eJecIFJibu4BPuX7DE1m64J57VJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0Mx+LmH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0Mx+LmH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso29310675e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131520; x=1779736320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgjcDSkJV3GKfKlbUQSZ57rr2po/MRqPRPN+0UqD+s=;
        b=V0Mx+LmHNfQODBEo/BP36APyRW1/z2zpaduj89gU9zBuiwUORafiNCmhsCt/LoNdjc
         xVjJb6ELIGOaT6FfQs6yzxcgsfcaZl/RF0Dj54k55AnGWN9QMwwwwbm76CQlYY/WT841
         z3GDTM1/XBtNyOHscJKAwtT74ZjBhJbSaYP/m+4Zgx145k1X0hACB/seCDnbnWIGllbj
         8vF3Mrmd+4haEH/lpPBZLBZ+e52NAdqS0q3vGRzIQmDKTKxRXIUfP9EekfDBID8xxODJ
         77nbXCfglkpsHg1c3fzHkK8QjDGAR311JBNODrVKohif41nIKnq2d7Dq0LrOM4YERHWL
         Mc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131520; x=1779736320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdgjcDSkJV3GKfKlbUQSZ57rr2po/MRqPRPN+0UqD+s=;
        b=CMbs0hQU4Ak3xklMPx6zmSr96YsQ9xdULZDf7UWvoyMwMWXHV4SW3bl2dpgy2GNC5z
         i6VH5/imfqsmM/CJXV5UtKR4fw4ES//Ebki5VZtGEerWGu7c3AhDPhEPwzutD5NS96qH
         HsDyjbPBvfTOPrj92jX9P41Bu/Uet9KbMdZzWSe5lGfqkoEjZlTNFC7YNuv6xT/TLTMg
         rrTeZdMR/bk1XMphB8n1gdExe8USiV3WbW4yPf/zpvMizI9l0TQZZ/TjJUMKJAk5oki9
         bvwG1VDxLIwqaQjvuEZ9/YBSK4MoaR1u3MmKQtCo0oUmRdNdzP8YS7ABk7VQLSvixTKV
         NEwA==
X-Forwarded-Encrypted: i=1; AFNElJ/iXQ95yzU+QQVLFB6M3a/PtgSiHMdzXy0wkLEqGos0DAD0SAEWSx8c9kmacXEx4YsQLwCZ64qpjki8o6jH9v0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dMy1XRtjekwOoOWL76p1waUxVUfS/cVfqO1jLRQPYW0EWpY+
	mgLaw6YN/DsIJNjvM8uqiABSf2g1VrJV7uhIVwGIlka6pD0v66xhASkZ
X-Gm-Gg: Acq92OEABwMYb6j/DXfjj+vexiyWx+9NYsqa8vTmqkpEbWN0p/exu3C2yVhCKoJPk7U
	yfBQdeaUfBjr0JUJdfvvZRf1tB9sS5fzYvlJX2AcgSDcWcdJlZ8UtyccKZ+5oi8OhUF1gW0YQOw
	GBuWwCf0z6YeiesS6j4D6rK2HLx0UUXm+KbFf4vVxVMXtz41JSvYjS9+b6rhrdD6XnPZv4Rb5Mw
	axfiUzJzsF3ldd3TvhoKnx6Z3cCfr0FwFCMow445bKX5t5hazpkcTSdaciUfJpG/YnwD+5YzW+0
	0hSCZNRwXtcNs1Br8dsaLcZBWirDMXGGjjozOTDQl/QRxU2XBCbOjTmZhqBOF2ZGGTp0tSCWj2v
	NjfOTftTu+ZiT7v3o338i51S/JpDD6zxeh0N8WDkWYN7tWVob0r1ps5s6lxGltQqZd8aLuWmaP8
	WiWZ5J7QE2acmRVwhl1J62hHbiV4N5mDDbqb81S6ekKkFEE47qL+o=
X-Received: by 2002:a05:600d:644f:10b0:48e:9134:6ae7 with SMTP id 5b1f17b1804b1-48fd62d9be0mr228420795e9.0.1779131520505;
        Mon, 18 May 2026 12:12:00 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:00 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 1/6] mm/damon: fix missing parens in macro arguments
Date: Mon, 18 May 2026 22:09:27 +0300
Message-Id: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAMON iterator macros do not wrap their pointer arguments with
parentheses. This can cause build failures when the argument is a
complex expression due to operator precedence issues.

Add missing parentheses around the arguments in the following macros
to prevent potential build failures:
- damon_for_each_region()
- damon_for_each_region_from()
- damon_for_each_region_safe()
- damos_for_each_quota_goal()

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 include/linux/damon.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 4d4f031bcb45..32f2318ac77f 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -902,13 +902,13 @@ static inline unsigned long damon_sz_region(struct damon_region *r)
 
 
 #define damon_for_each_region(r, t) \
-	list_for_each_entry(r, &t->regions_list, list)
+	list_for_each_entry(r, &(t)->regions_list, list)
 
 #define damon_for_each_region_from(r, t) \
-	list_for_each_entry_from(r, &t->regions_list, list)
+	list_for_each_entry_from(r, &(t)->regions_list, list)
 
 #define damon_for_each_region_safe(r, next, t) \
-	list_for_each_entry_safe(r, next, &t->regions_list, list)
+	list_for_each_entry_safe(r, next, &(t)->regions_list, list)
 
 #define damon_for_each_target(t, ctx) \
 	list_for_each_entry(t, &(ctx)->adaptive_targets, list)
@@ -923,7 +923,7 @@ static inline unsigned long damon_sz_region(struct damon_region *r)
 	list_for_each_entry_safe(s, next, &(ctx)->schemes, list)
 
 #define damos_for_each_quota_goal(goal, quota) \
-	list_for_each_entry(goal, &quota->goals, list)
+	list_for_each_entry(goal, &(quota)->goals, list)
 
 #define damos_for_each_quota_goal_safe(goal, next, quota) \
 	list_for_each_entry_safe(goal, next, &(quota)->goals, list)
-- 
2.43.0

