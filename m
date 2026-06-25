Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E332E0B71
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419601; cv=none; b=kIl0azjQEp6lsQrmJxx8fU23fmn1NgaIgTOzxFPwlyje4s4lqbC66xQ8JXu6UzjOL0+ycds4ecFX0Xt+A68XcCYcO+P3LLJL8z6LiYuza4b24GUQyG/u1W9krjdeTUdv9ixd45Nh6lsibG2p42WegHh8QoDXFKoTUxXNun45lyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419601; c=relaxed/simple;
	bh=Ib7zT38GwZXZa3psJDnOOJi5CQ6/V0vu2dtXG6oowj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPx7CsUCNi8EDIBKLtp2RjhA6MwxxKUG0vH0rHdTcsH3UnTUfQoFrjvfSGNckZLAK0bm/EYgUdxKXnbt2Kwf6JbzyC1UjBMDEkUec9LLJHrpR+L8O43D3pch33saI368/nvKj0KpoxDNlMEu0VHwGMAbYdSQnyMfg6JrCMfW13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvjeuUzg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dxnTHald; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvjeuUzg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dxnTHald"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782419599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ifHti/d727ookmtUS07phWJpYrrkEhsutg001BDn0q8=;
	b=DvjeuUzg6pSdUSnOYp8eBP+T2+oMhH8ryPFmnxv/TBhzEYJ32tl1/ia3bMXVVwNEgGGXt+
	QcUq+Fp/qcYvE/Z7N/jHr1gMxzWbshT4pF3yohGSJzQ84L4asdkmIby45eX9yx8WphzLbZ
	7vfFZTHRRbqpKg8WY4ce+kytS0xl8fY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-RMYnOlglOSONwgnPFVacsw-1; Thu, 25 Jun 2026 16:33:17 -0400
X-MC-Unique: RMYnOlglOSONwgnPFVacsw-1
X-Mimecast-MFC-AGG-ID: RMYnOlglOSONwgnPFVacsw_1782419597
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e05aa49693so6416126d6.3
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782419597; x=1783024397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifHti/d727ookmtUS07phWJpYrrkEhsutg001BDn0q8=;
        b=dxnTHaldAwRH3zE3IZVm4iRMDvGWeZjwmOYRSjMO3m+2xjKz7/kNCqUBnma0wj7QrH
         ISqSVJiinDeG7pxIUpYPxzTJvZqFaN4iDyXG9C+mHNuMW1pv05u7jbH34RFLg/aTOTKy
         fsS7rXgCdkiWYlDZqB1NFqQWPWAT0oZNR8gH2N6rMFGVpZcD7srVERVRizq0uu79eSCL
         DUC/1648w9qp+SJQsGV10dxgD/f9OxYnE60S9thloz4D+f9ocKQrWomvsHv+FfyhXLQe
         /qPFyrYiwiO3TYSMrNk9FjmPagEhDz89KlKTWmZnokIFoJom/PSFc9xDHHmQ4itWmP+X
         Epmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419597; x=1783024397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifHti/d727ookmtUS07phWJpYrrkEhsutg001BDn0q8=;
        b=FnT7GLeQNZzsOIbKbPxX+8tQyt1RsZSE9HN4Klt/4DDN7U0iSs8JIlRHWUz3O5mOO6
         ajeUWvP+pzEfqjzPjUKoOoZPDpUVA/B/GqkRj+pJ1XfOOqrrTfgkljhOaOKXMBLtLR4e
         0iTtmaeEc5rPfTiSgZdXo9URH8XSkfbsAhVN/akwgrKu0ltQDRI1DFCA0+5QUAiuRhGB
         D86wAI9TU4SM4qgfXHdJl9czKs4K5/9QaVxL2ATQnwIV0KidCN9kVM0SouxU0ORgA2zQ
         nhmzt/ktWX2zjNt4nhyEY7RW8RqqG5V4nztckqt0QG5sgJ5R5O+WtkjY6lpNzjWEDB5R
         /Q9A==
X-Forwarded-Encrypted: i=1; AHgh+RoQ0LPDsJNO5RPaRddcHI7GBA5yxDTLR1wZFpSf96Fyy9J5eaE63lhAv8wWIKwEhhbCrW8q9go53RjP3f8CfyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53z9KV8S55vG5o2qaUFynZKij7HxjktsynjxA4iSSiG+ywMTh
	DvwIxxtz0wIHWHQtA4UnUf6CuNZZugLZyWtW9HUvHEXunXsIU7C2E5NpPvsyBAE1hJplQ1cFFGA
	0SQK8CFC2/W66WSOuUo4CQNavhq9zyl642L3oHhT+Zj3K00s5srsMzrUPqg4cBz3SBFlLlA==
X-Gm-Gg: AfdE7clcMoEWzRh3RK7WiOZTzYefssX9GLHe9lUwuasmvZfJxNOqwgAJqWWrm0F+Xmd
	aUtSJ4oB6pzeP9IzFR2rJazdccLvniREcEpkMMagogOiHK3MLBlXN8ZZe6DMlHMZziuei5QX8S/
	sKVwo+exheW19BqfeEXtaiDXufeEZH8foiWUeCq9Yl32hBFOv9sTsUAllsy37MXl7vIYZDqOFSO
	ah2WFw4mDUZvkhghup/NDnNBbkBzun4YURfQ5rNQAEYh9r13EwsQ2OSsENrz7+wk9gkUsaX199I
	/Q6uu9foxv5Y1ythI/wK50ya3CUiqwgfdlCcMxelxXWQy3z7+WWcSZgzD7lUsJjfZeozKGpcQTB
	Ex8sySfEWckNlpIFczcxJ+4kOqTz1YxOG3WIy7aDZlrq4JzGd
X-Received: by 2002:a05:6214:230f:b0:8ce:ba04:7bc2 with SMTP id 6a1803df08f44-8e6d6e61085mr68947946d6.38.1782419596811;
        Thu, 25 Jun 2026 13:33:16 -0700 (PDT)
X-Received: by 2002:a05:6214:230f:b0:8ce:ba04:7bc2 with SMTP id 6a1803df08f44-8e6d6e61085mr68946986d6.38.1782419596122;
        Thu, 25 Jun 2026 13:33:16 -0700 (PDT)
Received: from oak.redhat.com (c-73-148-124-98.hsd1.va.comcast.net. [73.148.124.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f5ff5e6sm188635156d6.12.2026.06.25.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:33:15 -0700 (PDT)
From: Joe Simmons-Talbott <joest@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Joe Simmons-Talbott <joest@redhat.com>,
	cui.tao@linux.dev,
	Li Wang <li.wang@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND v4] selftests/cgroup: Adjust cpu test duration based on HZ
Date: Thu, 25 Jun 2026 16:33:04 -0400
Message-ID: <20260625203307.1114538-1-joest@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For lower HZ values a quota of 1000us is much lower than the amount
of microseconds per tick which makes the tests test_cpucg_max and
test_cpugc_max_nested fail. Increase the test duration to accommodate
for lower HZ values.

Link: https://lore.kernel.org/lkml/20260624160358.430354-1-joest@redhat.com/
Signed-off-by: Joe Simmons-Talbott <joest@redhat.com>
---
CC: cui.tao@linux.dev
v3 -> v4:
- Use usec for adjusting test duration for better accuracy.
- Remove underscore from static function
- Use 1000 as the fallback value for hz since it's the default.

v2 -> v3:
- Instead of changing cpu.max quota extend the test duration based on
  the HZ value.
- don't call pclose() if popen() fails.
- check return value of fscanf().

v1 -> v2:
- Try checking /proc/config.gz to get the actual kernel HZ value and
  fallback to 1000 if the value cannot be determined.

 .../cgroup/lib/include/cgroup_util.h          |  1 +
 tools/testing/selftests/cgroup/test_cpu.c     | 47 ++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index febc1723d090..8ebb2b4d4ec0 100644
--- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -8,6 +8,7 @@
 
 #define MB(x) (x << 20)
 
+#define NSEC_PER_USEC	1000L
 #define USEC_PER_SEC	1000000L
 #define NSEC_PER_SEC	1000000000L
 
diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 7a40d76b9548..1f280c1db68a 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -639,6 +639,31 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 	return run_cpucg_nested_weight_test(root, false);
 }
 
+/*
+ * Best effort attempt to get the kernel's HZ value from the config.
+ * Return the HZ value if found otherwise return 1000 (the default) to
+ * indicate failure.
+ */
+static long
+get_config_hz(void)
+{
+	long hz = 1000;
+	FILE *f;
+	char cmd[256] = "zcat /proc/config.gz 2>/dev/null | grep '^CONFIG_HZ='";
+
+	f = popen(cmd, "r");
+
+	if (!f)
+		return hz;
+
+	if (fscanf(f, "CONFIG_HZ=%ld", &hz) == EOF)
+		goto out;
+
+out:
+	pclose(f);
+	return hz;
+}
+
 /*
  * This test creates a cgroup with some maximum value within a period, and
  * verifies that a process in the cgroup is not overscheduled.
@@ -646,15 +671,20 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 static int test_cpucg_max(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec, duration_sec, duration_nsec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *cpucg;
 	char quota_buf[32];
 
+	duration_usec = duration_seconds * USEC_PER_SEC * 1000 / hz;
+	duration_sec = duration_usec / USEC_PER_SEC;
+	duration_nsec = duration_usec % USEC_PER_SEC * NSEC_PER_USEC;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	cpucg = cg_name(root, "cpucg_test");
@@ -670,8 +700,8 @@ static int test_cpucg_max(const char *root)
 	struct cpu_hog_func_param param = {
 		.nprocs = 1,
 		.ts = {
-			.tv_sec = duration_seconds,
-			.tv_nsec = 0,
+			.tv_sec = duration_sec,
+			.tv_nsec = duration_nsec,
 		},
 		.clock_type = CPU_HOG_CLOCK_WALL,
 	};
@@ -710,15 +740,20 @@ static int test_cpucg_max(const char *root)
 static int test_cpucg_max_nested(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec, duration_sec, duration_nsec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *parent, *child;
 	char quota_buf[32];
 
+	duration_usec = duration_seconds * USEC_PER_SEC * 1000 / hz;
+	duration_sec = duration_usec / USEC_PER_SEC;
+	duration_nsec = duration_usec % USEC_PER_SEC * NSEC_PER_USEC;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	parent = cg_name(root, "cpucg_parent");
@@ -741,8 +776,8 @@ static int test_cpucg_max_nested(const char *root)
 	struct cpu_hog_func_param param = {
 		.nprocs = 1,
 		.ts = {
-			.tv_sec = duration_seconds,
-			.tv_nsec = 0,
+			.tv_sec = duration_sec,
+			.tv_nsec = duration_nsec,
 		},
 		.clock_type = CPU_HOG_CLOCK_WALL,
 	};
-- 
2.54.0

