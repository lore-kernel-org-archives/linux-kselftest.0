Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E838735A
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505779; cv=none; b=h0N9XT7O980m3b2YyQGoNWd/fHYOBV/GXNZ1Ne34/BBG4r9vXY1jK9PLPjI5hZcliG5lJ0NcK6cqH6rMNdorxRYrg+IyaakATUdVr0vj9ruWwZRxh+gkRXomIREXsNRnrEhKTaUG4lmp93jOaSkv38NBfUTuegOsAJGspRXKHlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505779; c=relaxed/simple;
	bh=NQjGG4zXSYU53w2K7bTqHGdIct742qU3+RBPftHQRyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPnRRmz+mLxTOElJ5c2L6D7XDXN8JCyz13vPCMeb6F9z2zOVM9N7oB7qUiL9Avid6ywELzKbD/uBZcUsqAayTBRtnNbKck60govESu8QKyKWbHWOXfCpQXKsrTjFGuL+Bn4t2hFIXUx8qaGHUSVRgXyg/uQkLaLCLyBMfpx2Xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhqEy0Mt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgHL1zwo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhqEy0Mt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgHL1zwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782505777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5fmmows0Hr70L00v6YhaNR6PFpVRD5asct1gUksFqE8=;
	b=DhqEy0MtmuPsHkJLwTa3eHCnqHJvybCKMX7mQDhv7Z+58WrGOOcwIlORBjAPow1rRdkjBf
	nCDwelFWZNGa3lYMrmp1ntN8aYb+ME8rt/GDwcH+J4zzEs0Ht/M42Xlb8cE0BZS6leTBsh
	Pb/PDPnK46obzecwA5PeFuz/aFbdEeU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-bOdM8f_rMy66ZzwTXEYwpA-1; Fri, 26 Jun 2026 16:29:36 -0400
X-MC-Unique: bOdM8f_rMy66ZzwTXEYwpA-1
X-Mimecast-MFC-AGG-ID: bOdM8f_rMy66ZzwTXEYwpA_1782505776
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92045e86763so488374885a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782505776; x=1783110576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fmmows0Hr70L00v6YhaNR6PFpVRD5asct1gUksFqE8=;
        b=YgHL1zwox7METT2exMJ+8lInwffMIWf3Ve58IVquTcACuGUkRUDFRdMVmLSonQFeaN
         t+EB0I7h6avEx27gnVqKLwSghCQ3xchlbJLcdKAKhABEagEzwDJL/qfntmQKpQgQV6ZY
         DLWJMX1YFBGmhbFwsVhT2DGXXtvLhXWR2tCuDZA44Z+biCJUqoEYty77A9v4frCXMQpl
         HJRVHIPVVSScNB28T204NsfE092K5yFDgUs11iOZJIJ2o0zj/lFlDsiM3RwwD+Qge1sC
         1QIi95blGB2SPF8e0YbXPKZR08t6KcOF1przzxerjVA15gTWx4QP37oAOaIVnB2h+kxy
         RdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505776; x=1783110576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fmmows0Hr70L00v6YhaNR6PFpVRD5asct1gUksFqE8=;
        b=AVtZ1XGoDVfs6uUfB8yyJg6rBOcroYuo50roseppBnaXUO36rDxuH4X5VpL0a79N1D
         PgpdRLbMdyv0cGswg5wTvpJ7ABpmG2h9xk3FCbBgkGTByuNpXIJvZ0eVqNGjhqzoT/PB
         JxFKJrJweiWJQAkiuR1w9I7vwP5QeGnmo2WPBB8bsevnw4pq6+5Lb98lOBtt8pGUiS0J
         VcDJuXis3CB39H/Ee3oGjxd0CGmcgxH0OO5NaSyQFlAcQH72Pz7EoxXAFlTY1mivUngh
         L8N7/XE5BBDv3l9hxUWwYXOxaMDscjFNjVkA677fNgJEdjEdoHWqxW/IJJMvclI8ELAC
         B17Q==
X-Forwarded-Encrypted: i=1; AFNElJ84tKAR7DaI62A3yoLJHqA0Z8nczn9WXtF4qpu3jb+0XkkeqKekOZzMKhPMbZ8AEBEGVk35wQ1HR/pRo0d2pJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySOnonr6515Hhbvof3QvAjZlGsd31bn1ogpV03JHrxw3AfT7/U
	21WtZUZvTwJ3JxV7ZyeNohDSa+eOzGj6OpBediqmqJB0Xtu8V67pRClL4HiJdaXsbYFnuFmH1nW
	d4v+jhma9+WSdIJ2zxgKzAh08sWlJNrUJmDtlEOeHb+NYfzCGG1DHAAK70gzIQpnknZkAeQ==
X-Gm-Gg: AfdE7cn4yyOC1sePKtMVxAmXzGWVZg2qZq7KcE4JgzPX0XnfDcJf/6LiP/zorDOvj3g
	y82T8PaLNDhHclU/ewh9unZnLNJbAeCVj6CF7Nj1360DmGd1sK+cXtME4eJDWHKkN4LTwXtQ3zh
	5r2JzWm4DK+or+i8iqEjSvv9TFZccWiHD/rtFnx82Cza9X1+mqdhVfZqYfnGN/3BwYQhVd4W4g8
	wqP8QpqKfPtfBDsqRHTaYJOIqcJ2ffQPVJ28HvYrryhbrWpcxNWWDb8SIW18YgbsSKyQ4vrTh1/
	IdBXWmRq+0JaDk4sk7ZUcsViJGx1XMb3X3nP6ps16lifgBZ1DlymPe5trXhkRJLdoJcw8+jOUMq
	Xko6Rsas953Y55iBlkzyiDyB0fyBo52hlkCTPHhbRq/+L4msi
X-Received: by 2002:a05:620a:1a20:b0:8cf:bad7:20c5 with SMTP id af79cd13be357-92927db2b88mr1121092885a.25.1782505775457;
        Fri, 26 Jun 2026 13:29:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:8cf:bad7:20c5 with SMTP id af79cd13be357-92927db2b88mr1121087185a.25.1782505774892;
        Fri, 26 Jun 2026 13:29:34 -0700 (PDT)
Received: from oak.redhat.com (c-73-148-124-98.hsd1.va.comcast.net. [73.148.124.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm1239563785a.34.2026.06.26.13.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:29:34 -0700 (PDT)
From: Joe Simmons-Talbott <joest@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Joe Simmons-Talbott <joest@redhat.com>,
	cui.tao@linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Li Wang <li.wang@linux.dev>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5] selftests/cgroup: Adjust cpu test duration based on HZ
Date: Fri, 26 Jun 2026 16:29:22 -0400
Message-ID: <20260626202925.1527524-1-joest@redhat.com>
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

Link: https://lore.kernel.org/lkml/20260625203307.1114538-1-joest@redhat.com/
Signed-off-by: Joe Simmons-Talbott <joest@redhat.com>
---
CC: cui.tao@linux.dev
v4 -> v5:
- Get rid of added duration_XXX variables

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
 tools/testing/selftests/cgroup/test_cpu.c     | 43 ++++++++++++++++---
 2 files changed, 38 insertions(+), 6 deletions(-)

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
index 7a40d76b9548..a5eccfcabef5 100644
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
@@ -646,15 +671,18 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 static int test_cpucg_max(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *cpucg;
 	char quota_buf[32];
 
+	duration_usec = duration_seconds * USEC_PER_SEC * 1000 / hz;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	cpucg = cg_name(root, "cpucg_test");
@@ -670,8 +698,8 @@ static int test_cpucg_max(const char *root)
 	struct cpu_hog_func_param param = {
 		.nprocs = 1,
 		.ts = {
-			.tv_sec = duration_seconds,
-			.tv_nsec = 0,
+			.tv_sec = duration_usec / USEC_PER_SEC,
+			.tv_nsec = duration_usec % USEC_PER_SEC * NSEC_PER_USEC,
 		},
 		.clock_type = CPU_HOG_CLOCK_WALL,
 	};
@@ -710,15 +738,18 @@ static int test_cpucg_max(const char *root)
 static int test_cpucg_max_nested(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *parent, *child;
 	char quota_buf[32];
 
+	duration_usec = duration_seconds * USEC_PER_SEC * 1000 / hz;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	parent = cg_name(root, "cpucg_parent");
@@ -741,8 +772,8 @@ static int test_cpucg_max_nested(const char *root)
 	struct cpu_hog_func_param param = {
 		.nprocs = 1,
 		.ts = {
-			.tv_sec = duration_seconds,
-			.tv_nsec = 0,
+			.tv_sec = duration_usec / USEC_PER_SEC,
+			.tv_nsec = duration_usec % USEC_PER_SEC * NSEC_PER_USEC,
 		},
 		.clock_type = CPU_HOG_CLOCK_WALL,
 	};
-- 
2.54.0

