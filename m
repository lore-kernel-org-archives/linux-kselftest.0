Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF237DAA9
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401922; cv=none; b=q59TrbwQYSFnJU3gFPwZLRFTPE6/NSNn6ak7wTqJhfLG8DWpk2YyGHVwjwPk6uJlFA973fM5nBXw54s02aprHRzwDoPveMYhiKDZoZF4xV3MamdHvp5SGVus3EGnYz1Q7VG4z9ICC+4HPypY8XVj9B2YfyEe89Mw+PGMERB64ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401922; c=relaxed/simple;
	bh=tWXmnir3aF9HZ+kf5/3hY0M3VXhh0dKm46bCuC6qUT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPx0rME7pxEUY9CdDkBzV8CaKj2KP408YreYvpvYp/88n0S65AAf3/4MvcDwLP6jmkYsj63FtKcQ5/GCpOsb6urqJHck8jiGNsSfrdxU/BbOEEVPuKZgDZ6H7tmdx4yyS8f9tVXd1CNtt9aYl2YHe67kYSMHHNrnfIA+eRGlauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI2QF1mG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI2QF1mG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48870973bddso613363f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401919; x=1791006719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi4dRtWZ8QVTscHUglSUHWaqYAQ6yrmnxvkOKTaKUMQ=;
        b=XI2QF1mGG/t18OHANjvdz6ONEx5kDBGyV6zb+HVqRD/DHFcCJwPV0yjI/y0M0IN/fY
         5WbGFc42Mv36r4GC0NjbUsHA/dSh/cKca5v8Onz9snaQV4cf71PXiVcdAK4+4RNJQEoL
         NrfquA16e9i+4LSdFWTXfeaghdSqe+0nIW7+PfZKwBsoXHxnZDdM3uEmkvRyXysfYI4Z
         2/eayRu5U3KzzhCY4EQb/yZwn7os+3os9hdvKXVo0jpT9DNa2+YAopoO1xsFZ17pV5DO
         k5utq6CpReUlEk4EUyAT4JqpWe4W/WyGy7orekQfBKw6rLvHBr3SRanM8IYx8CLmjTwq
         CH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401919; x=1791006719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi4dRtWZ8QVTscHUglSUHWaqYAQ6yrmnxvkOKTaKUMQ=;
        b=cBHLhVM0MdPypx1bSxcIh6z1P1yGN9YTtIiuH6gOZ1VZiMI+NPRlUa3gktFNg+qbxF
         OELVW1LIqQ+kY70PVV2wjTpgFkIcgdAiK1Bl+02AoWp/nd6RBQGJ4Xix+5XWBvMNONFk
         ExqzOETyRsdPHGwAZRvwdsVk0hQOzsp0fuwh4bKjEShTxaaYXz+ZzCHoj8W9e/4S+w9Y
         +I3hguas44CHMsp16vodDFaDapqyPRU+LesSBMDHiI5u+WdPFn/1YzHXTuQSrSQPKvMO
         gpCnekWlqQz5ulFeNYDo5nx5zBhbtgNxCzS6YYG6Q1gb1eBJJ3LHg03cessUA6wTfOir
         AFyg==
X-Forwarded-Encrypted: i=1; AKwUvBzFicep8djJJstdDMfHs/DcKmA7yM4bYePCZQ0gE1LAunYyjF2CMRqOmQGxauG1ezHKPL4w5IasLZwVz7uCF0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mTTSfEDcRu4fQVKHi4w6BL/WOkM/A/Px7N3GKZDU47MVbL5god
	l5cYy068PRHFs/T7wXlul4wTalhwZacutxiI5ACjvfK+NbA6MHgRCeKS
X-Gm-Gg: AYBFou3ruimSDqjC3ATTE4r60RQyE1wTbbOYLIr4LtqzRIykKbI7m7vwjCDlglfPC9e
	1gAzAz+56JnO/6dEnKFWA09Hf2nX6kHzNJHGHHC93mbfAhSS9KhMqGXQO+ASGGLj/X8d19KkQU9
	PQxEJKmFid8DuNd9cFNEdrTjGgIWBRJ+2xGTFZa87uPfkLRjr8RW2pU5tI8nPxq5r0rqPN+ZYke
	jkCXUCE6o6WkxjFQ37p+RbkK8hs/DJQVoRZaLcdKiXoqnQfO/rg7QeYy69VgBEZmeupNglEYRxQ
	poNktP7eCp7W//ds2B+DFUYN7Vg9pQKO3PAVsg6rF2fU4H/Q0/i4hrg6gkjRe6WdrKAH6Vt2wRi
	FvU/Gp53a5f90EzgOP3d3uek+1l1h9qXROv2MF75HAxzH0gMvcz4xQMeVwutOitvFZ6l5TMHvSz
	qCeJ2Srf8E7T4zh+Dh3P0MXGUK/2ehQpzVpDxBC1KMOQq24XPQQWRbr09uNVuyfamsQqsFS1P4q
	VpbctyZvDPhO7RgD6o8iXiMkC/gow003PLrd9iTvt8Z
X-Received: by 2002:a05:6000:4b19:b0:488:8882:d504 with SMTP id ffacd0b85a97d-4888882d749mr1189407f8f.10.1790401919190;
        Fri, 25 Sep 2026 22:51:59 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm12317560f8f.1.2026.09.25.22.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:51:59 -0700 (PDT)
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
Subject: [PATCH v2 1/2] selftests: cgroup: Use values_close_report in test_memcontrol
Date: Sat, 26 Sep 2026 07:51:47 +0200
Message-ID: <20260926055152.1684-2-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260926055152.1684-1-sebastian.chlad@suse.com>
References: <20260926055152.1684-1-sebastian.chlad@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the terminal tolerance checks in test_memcontrol to
values_close_report() so that a failure prints the observed and
expected values instead of failing silently. Also report the
"memory.current < size" check in alloc_anon_50M_check().

values_close() is kept where it is used as a loop or retry condition
(waiting for usage to settle in test_memcg_protection(), reclaim_until(),
the reclaim retry loop and the socket test), since a mismatch there is
expected and reporting it would print spurious failures.

Assisted-by: claude-opus-5-5
Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 0ed82347044e..8882c7faeb32 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -200,17 +200,20 @@ static int alloc_anon_50M_check(const char *cgroup, void *arg)
 		return -1;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (current < size)
+	if (current < size) {
+		fprintf(stderr, "memory.current %ld < expected %zu\n",
+			current, size);
 		goto cleanup;
+	}
 
-	if (!values_close(size, current, 3))
+	if (!values_close_report(current, size, 3))
 		goto cleanup;
 
 	anon = cg_read_key_long(cgroup, "memory.stat", "anon ");
 	if (anon < 0)
 		goto cleanup;
 
-	if (!values_close(anon, current, 3))
+	if (!values_close_report(anon, current, 3))
 		goto cleanup;
 
 	ret = 0;
@@ -241,7 +244,7 @@ static int alloc_pagecache_50M_check(const char *cgroup, void *arg)
 	if (file < 0)
 		goto cleanup;
 
-	if (!values_close(file, current, 10))
+	if (!values_close_report(file, current, 10))
 		goto cleanup;
 
 	ret = 0;
@@ -578,16 +581,16 @@ static int test_memcg_protection(const char *root, bool min)
 	if (cg_run(parent[2], alloc_anon, (void *)MB(148)))
 		goto cleanup;
 
-	if (!values_close(cg_read_long(parent[1], "memory.current"), MB(50), 3))
+	if (!values_close_report(cg_read_long(parent[1], "memory.current"), MB(50), 3))
 		goto cleanup;
 
 	for (i = 0; i < ARRAY_SIZE(children); i++)
 		c[i] = cg_read_long(children[i], "memory.current");
 
-	if (!values_close(c[0], MB(29), 15))
+	if (!values_close_report(c[0], MB(29), 15))
 		goto cleanup;
 
-	if (!values_close(c[1], MB(21), 20))
+	if (!values_close_report(c[1], MB(21), 20))
 		goto cleanup;
 
 	if (c[3] != 0)
@@ -603,7 +606,7 @@ static int test_memcg_protection(const char *root, bool min)
 	}
 
 	current = min ? MB(50) : MB(30);
-	if (!values_close(cg_read_long(parent[1], "memory.current"), current, 3))
+	if (!values_close_report(cg_read_long(parent[1], "memory.current"), current, 3))
 		goto cleanup;
 
 	if (!reclaim_until(children[0], MB(10)))
@@ -691,7 +694,7 @@ static int alloc_pagecache_max_30M(const char *cgroup, void *arg)
 		goto cleanup;
 
 	current = cg_read_long(cgroup, "memory.current");
-	if (!values_close(current, MB(30), 5))
+	if (!values_close_report(current, MB(30), 5))
 		goto cleanup;
 
 	ret = 0;
@@ -1006,12 +1009,12 @@ static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
 		return -1;
 
 	mem_current = cg_read_long(cgroup, "memory.current");
-	if (!mem_current || !values_close(mem_current, mem_max, 3))
+	if (!mem_current || !values_close_report(mem_current, mem_max, 3))
 		goto cleanup;
 
 	swap_current = cg_read_long(cgroup, "memory.swap.current");
 	if (!swap_current ||
-	    !values_close(mem_current + swap_current, size, 3))
+	    !values_close_report(mem_current + swap_current, size, 3))
 		goto cleanup;
 
 	ret = 0;
-- 
2.51.0

