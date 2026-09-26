Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6FB388E62
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 03:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394576; cv=none; b=YDrTaOSnRgJXL1QuuX3c31yMXZVkMYTYKKpbuW6DdPcBsVIqubR0go1xubqg4u9jukvrK5HBlbae36rloE+IglxCRIN99rdMAfwQmo87G4QCsxDKRUC2sL/5R2ER79uZ8sOYDb4OjSU6U4wfd1kiAzHo2pSO5eFyIOoseP+dViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394576; c=relaxed/simple;
	bh=4YVUr/SAhTBwjT0Go/F6m/FF9CaDGjuXGtYk+bGqmZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJI9sVzWmpKT/D3DDDYRLKyw+CC/YrUQO/rHMBYrbHBBgFBZ2tY2kZ+3qpI3oY4s7zbLWAblGXhz2eHGLVB2ig4IPQnOwDAlB4cHG1o66p9Aq4opcZ9GDxANwgQ/QMq8Ga7C3LS6rPDr9lukIfw/5O8Ww4a/TxC2FSnzU1IEusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFhDRQYM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFhDRQYM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so11727195e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394573; x=1790999373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5exqyQhzafqyOFiRdxT6ffSBUlENs1lok/PR/m34+0M=;
        b=iFhDRQYMxHPXVYysuKqZmASu4GbBRpGnivIUJsSu2a5yDZ5qclApZQlpqo1KjMei7C
         lUE4r/w27MieIcfwJuNg3LS6/kl8XV85C3lphXODQPp2/xykOZrOCxoHdQl+t1aStbDs
         vqI2TjwU2aXBeNAPytTDfPqh3AnAAlfAj9b2QJ90ZFuyLYleo+TVik9G5M65EvH+CLq5
         IVmd/ZufR34laQKhp8wXDY+naCj/7YzPVKnzh4bnF10ZZaWxDcSBbhM9MWiS4EMH+7/k
         IuUG6S82nmaQoJHKqIH+QwKsHgOLGFSO9Y6V8qVj2PixEosa4X7uuiwZUAQtHClSXFZ0
         dL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394573; x=1790999373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5exqyQhzafqyOFiRdxT6ffSBUlENs1lok/PR/m34+0M=;
        b=az5pspMEMR6CUDiee/JW+EJ8txFrKvtv+mujlWQjTSUS6wFUxugItSVpx6IpWDykAU
         Xu27vtO6PRr0ta1MU+5SVFlGrj6s5JcShgH5dXdEW/K9f0/+Jz6VKYYiSqaOjyzVmnKX
         +T6ptisa5mKOliPGEO6E35do94gS66qjkv06Fp/OI3TP8dteCUwnI+9w1ZODupLTOJje
         9+bQFx01F9APrFFCOJeJZYJ67wblHn38igCjlct8Y3N/RDkFxzf9gcf6ecwKPnDEDcmz
         3jIY1YTXmN8wRhH/k07aEsWR18Aekr4Rl00FtMCL3YcXTmaH+VWoWwTud9sFGy/yj7g/
         1sAA==
X-Forwarded-Encrypted: i=1; AKwUvBy4H/DGKG6AGm2U1bv7vJVFk51voS7COsYACqbzjCkjEE9OKx/UlUFlInuhZU4KbwG4OabZfMrFsZeMPDgI7s8=@vger.kernel.org
X-Gm-Message-State: AFuF++kfsCV/7Yz26LezZzhMh2mJsgPUwQZSWUzFKXz4JQLcVo615g7K
	32o4ia6l2C/wMQJ2rwNB+3fBHPMj7kl8tXQs9tXekIs53mJpg5pRirhZ
X-Gm-Gg: AYBFou0Kvv0NVLYDRY28w5XccFdQy6/+SJdChCw1PgTLG0URgPtk9Yvlk9GgZ11aiuB
	I7l7tbzK4VPvYL9G5wW5VWAfPM0ABFafGwXQjcgUzOUJeS8jeYsTGq9/f6fbDfVBHCIzzsVTCp5
	5eJAYJ5oIoQ9YvbJ7STp+4Sc03WW/hgLy2bGgxImnXSR0XkrRD97qr6LXSz8BhU5qod1kceAyHk
	gC9kWvdfHvcATBpkR9VauAwT1vXN+582N3WVzNsyMFEBCXLhdHP6umJTvOFHNveJAyNvzhvM23e
	vbzGAAPGDfe42YLJZP5OApPrO+Zgec2hjKhV7X/5ZMrSX+JSHpn6rLf618QjqUmCfxqPj55bC+s
	C/0b5enLuXXHubkwwyzqeWjEy3DYNjgJD3OGvl17IeIsuAVqowOWvNS8pD969kI096DjHebdUwH
	PeAzSC3oW0ly5icmDMIjGN658kA494vPVrYlANOY/xyp0H8VvDpQpJ7++QInsPlyCIdsr6CC1mP
	0jL+3PKynOrfVkzPg/kf+bvs2fIvf8afM1JLJb/N6pP
X-Received: by 2002:a05:600c:8b4c:b0:49e:8184:f63b with SMTP id 5b1f17b1804b1-49fe66f3a68mr132693255e9.16.1790394572642;
        Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm116657205e9.13.2026.09.25.20.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] selftests: cgroup: Report memory.current shortfall in alloc_pagecache_50M_check
Date: Sat, 26 Sep 2026 05:49:21 +0200
Message-ID: <20260926034923.31718-3-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260926034923.31718-1-sebastian.chlad@suse.com>
References: <20260926034923.31718-1-sebastian.chlad@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_pagecache_50M_check() fails silently when memory.current is below
the 50M that was just written to the page cache. This is the check that
can trip when the page cache of the test cgroup is reclaimed under
global memory pressure, so print the observed value.

test_memcg_high() runs the same helper with memory.high set to 30M and
expects it to fail, so reporting there would print a misleading failure
message on every passing run. Split the body into
__alloc_pagecache_50M_check() with a report flag, and give
test_memcg_high() a quiet variant.

Assisted-by: claude-opus-5-5
Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 14c0bb608175..d3b9295aad75 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -222,7 +222,7 @@ static int alloc_anon_50M_check(const char *cgroup, void *arg)
 	return ret;
 }
 
-static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
+static int __alloc_pagecache_50M_check(const char *cgroup, bool report)
 {
 	size_t size = MB(50);
 	int ret = -1;
@@ -237,14 +237,19 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 		goto cleanup;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (current < size)
+	if (current < size) {
+		if (report)
+			fprintf(stderr, "memory.current %ld < expected %zu\n",
+				current, size);
 		goto cleanup;
+	}
 
 	file = cg_read_key_long(cgroup, "memory.stat", "file ");
 	if (file < 0)
 		goto cleanup;
 
-	if (!values_close_report(file, current, 10))
+	if (report ? !values_close_report(file, current, 10) :
+		     !values_close(file, current, 10))
 		goto cleanup;
 
 	ret = 0;
@@ -254,6 +259,20 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 	return ret;
 }
 
+static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
+{
+	return __alloc_pagecache_50M_check(cgroup, true);
+}
+
+/*
+ * Same as alloc_pagecache_50M_check(), but silent on failure, for callers
+ * that expect the allocation to be held below 50M.
+ */
+static int alloc_pagecache_50M_check_quiet(const char *cgroup, void *arg)
+{
+	return __alloc_pagecache_50M_check(cgroup, false);
+}
+
 /*
  * This test create a memory cgroup, allocates
  * some anonymous memory and some pagecache
@@ -735,7 +754,7 @@ static int test_memcg_high(const char *root)
 	if (cg_run(memcg, alloc_anon, (void *)MB(31)))
 		goto cleanup;
 
-	if (!cg_run(memcg, alloc_pagecache_50M_check, NULL))
+	if (!cg_run(memcg, alloc_pagecache_50M_check_quiet, NULL))
 		goto cleanup;
 
 	if (cg_run(memcg, alloc_pagecache_max_30M, NULL))
-- 
2.51.0

