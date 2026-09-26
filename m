Received: from mail-wr2-f21.google.com (mail-wr2-f21.google.com [74.125.225.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413F38A720
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394574; cv=none; b=SgKC6OvMnYMHVBu+M0ecygFRRNbvfP7OgKxX/A1Fod2qO2LXTh5CPhYeu0vVP0IlpmEknoEuFP1PEBJkehwYYeLSCOXwe7cZPBZt3aEcs/9BXf7pbMO37dtUb4QR+ADHcJzQzDBEolPkdIvhIHR90fmmlR/kWoCK3lQwvUPVx8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394574; c=relaxed/simple;
	bh=dRjSOX0gFUZyLW+TAn4WnqX6VewHhBxbXEOKe6zZPL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/7t/I6AjgJBRZN8SF3weOj9K7yjlyngYGIvlZapsZrKrEoLvlsrwsO+zDdMFMvKc9hMmc9wVzLAE7X4Dt0lSF1Ocnllivsp1vfWbBuosSq3BxMuPfDaBs1Aktf0vkC5S/LIQB0EWzHuPZDlJTXDyibOcl3Ag/AiKvhuE/MdPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNmu865J; arc=none smtp.client-ip=74.125.225.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNmu865J"
Received: by mail-wr2-f21.google.com with SMTP id ffacd0b85a97d-48881a62e09so659058f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790394570; x=1790999370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qI8gzoG27aGncFin1uBlOK6ZBd9hIaPKhApyur6iKoc=;
        b=VNmu865Jc9bicoYYCJ6n474ne1xuWoLVgAo6TB41HvyczCleZW0ISjeE49SMGI3DrE
         3rnyZ+gG2bsOukKHkBwJ4pAMFRFEN3WOmlANKUqPC08T5TaDYJOzHvwBCPH/f+8dVvvV
         e4GR38dOW8GkvOk8QtYKEx06Z2inSoYT1maDf82gBGlQmTj36zTzCHp0VUif0tNIEx6O
         PAmTJ9av4EXnkeJIPpL48yvzhOSYs9Y88iX0wTBp6wcHBxoezHTCN0vS2NSOsGT3qa/C
         YwveaB+1pLk7YOBjXErAli6YVLE8qcTYhWc6nCq0krWA9/gElf5605MF5dHp70GpA0NN
         ZCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790394570; x=1790999370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qI8gzoG27aGncFin1uBlOK6ZBd9hIaPKhApyur6iKoc=;
        b=slFDMn0K/007deFazrEWm7Vz9tpZNgDbfPbQLr9oFDDYeAQ1lXt3D92IAwgwYJN6t/
         cuwYvn/3TTKGiT2mz3XFxO+iKXTHCfw1FaOjYt2SLMRcY7oPIMeydjixsCGN+scBGI7P
         MhhgQc5aq3ElqQXUBamIF5tK4F/388HZq0NzP5da9i3Mw+WYrLwXDE/PO4xxlje7MnHJ
         0hyN0g5qQRFBWfRxEgDt5ffqVsT6NeZGX5mbL/AmOi37eKpIGBQIk0svAnZO8k39aqZh
         GGWV+L9TYfavlGF05TDMZwLCK4ilJ9JjjTSUCQNOtGd0l7arHE6RaQvCk6ngk/aRpu1A
         k3yA==
X-Forwarded-Encrypted: i=1; AKwUvByL1Wy1OEIoKh3KeZxN2KcISCT986OlaOF5ThLR1eUUvJJK3AxPJykttck5hPdi09hV0sFc1H95liWNe1crdHs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4AXOvBH50d0al+F71JQVfl0iN9Agacj47AX4WRbUDidjEY1J0
	TwnDXBohIW6HJU27Unpu6FtX0M9x+2C4ppPNTRBviXbGCU49im0lQDg5
X-Gm-Gg: AYBFou0wO4tGcLeHKiA++3BljCFK568iANmedNuF0eYua/uNmiG5lFC6CzlLFU96XpJ
	t62IFF3yedh3rbxnZv9nJuzaB/Ih/aqHxYWP3WtP5DiDyY5FeUPTN06FQ8N6zLYUDgCag3C+l8c
	BHmKXK7TtrR5Yx2odUAzZ/KUF+RCGj/jMLZ88Uc5p2xGfbttai1EKXlI+uRRXDYJsj7zn/O+jRr
	xWZz1dGW7FmU6m8BLBvab/PUzRfLeNpCgc7p44xGJsG44ih/cl9rIpSvyiAzT28JfLqyXlCmH/T
	d/ob6EUe+cQ4xsjIJdxVCKBHbfUSvyPlHW5Hm/pIuZc/UFO9Rfq0QfHB8BClXh8UtBtaW1V6EyZ
	2DhyMP9whRFdnUPD3LQxjmeyJj0eOF/m0yrACBNdlSONMTLLVl6wBBOxXG2VH/lGzw4NZ/49vKF
	Frfm2Zji4S5pt4s7atDW7MX/0BIOIjyPg4gKeCyt8R/Lo+w9HUfa6wX04K1WBi+1/y501Lb8VCZ
	ckdp8JHfnHEMKn8SqFkfXl8rbiXqhHaVmDghnwNKPGi
X-Received: by 2002:a05:600c:3b1b:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fe66c8a1emr145611675e9.2.1790394570582;
        Fri, 25 Sep 2026 20:49:30 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm116657205e9.13.2026.09.25.20.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:49:30 -0700 (PDT)
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
Subject: [PATCH 1/2] selftests: cgroup: Use values_close_report in test_memcontrol
Date: Sat, 26 Sep 2026 05:49:20 +0200
Message-ID: <20260926034923.31718-2-sebastian.chlad@suse.com>
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
index 0ed82347044e..14c0bb608175 100644
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
+	if (!values_close_report(size, current, 3))
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

