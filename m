Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F92E8897
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317130; cv=none; b=QzmYcTQQPoXXVu+2dpKxHUf+V1EMJH3uAW7hBIY4HnB0aQZYO/P7MbQD/9RPT7RyeZOGlfCWCPo6VpacGGQlROjR58v89ZiFret3MVl1O01SEz1lcF0Btqj4XzXBezrmo+qtSify8jhXjZMoOxWMEoF9722jwYzwXwoFmBj2c4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317130; c=relaxed/simple;
	bh=P7p7FAcln0ct9nNUJa2Ctd2eiERl+AOGFhIrcJgzXAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPD9ZRBSUSCsJ26cLC+lSaz7VXpN0pdAv/4f1pERRSNUwT66uhEDr4R0EUme5cmueHYLX0cUjE6d8JX9Jylawi6/yH3K8DCoLTd7bOe/jOqNO2lY3Pxp1P0soJg0LQ75CIdUVWTRtxzRsg1MO3a/bEQt3PpJlegJwchdDY0tA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQdNrDLK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ncwze8Vk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQdNrDLK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ncwze8Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782317127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xip2bYaGq+4ASYS6Hehw4QNPCcstYUL5jPvaPb6o9/E=;
	b=HQdNrDLKvX7sS8JCg8HYXa2YonmEJH37T2d7VN7eIKOd1ca3aAUGAedxVyACRLR8Bslaa0
	8QN1wMNWBD4l1n7DW/NMXzZT8m8KUJk0izNJW9MRat9ck0sPHXv6U+w7h54c+DbezKjl9V
	+/zMQzW/UrPeLZB5XfsZVTCPyxtcMas=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-zOt5PmkjNnyetfsETpvJFQ-1; Wed, 24 Jun 2026 12:04:18 -0400
X-MC-Unique: zOt5PmkjNnyetfsETpvJFQ-1
X-Mimecast-MFC-AGG-ID: zOt5PmkjNnyetfsETpvJFQ_1782317058
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159c4b210aso650085a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782317058; x=1782921858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xip2bYaGq+4ASYS6Hehw4QNPCcstYUL5jPvaPb6o9/E=;
        b=Ncwze8Vk+6liBNGoKAUu3D0k60b+knTlodf1Wu2O4f+cCwgZD6d0yCwPI8Q2P/DsIt
         Q8eMmBV/5uBY+kw3Yg5gsTlK/laKsvRqfSy9Fr5VazJRKs6o8zJcXn7V0Jx6dk5C+q5f
         VyJjCdHOQJNCreCQz1lTIijP0tmFHfO3LEodrFNM+m6imtvexSjUEvIirEigNUeiGG33
         ePNUMEyzgQb2PEmtZ7Huvs7LrCT4QiwxKctO/uiapHP7IYA8acb1JxDBRqQWVJ/CWh5Z
         KaqWOsIyaz9itgxZUzE+aZondCZ0t4rEMJbvHOlHwlDFQ3s75mTWaboQG+y5azrSyzr1
         qLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317058; x=1782921858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xip2bYaGq+4ASYS6Hehw4QNPCcstYUL5jPvaPb6o9/E=;
        b=WJk2JxOWSWfencvR/FTvO8H7kvk+jjxNRaEGQhUEkBTyyB1SZqc51jjaRVVcbjqAo7
         KjxamXr2F9xkmCR6DYJaCTSyrMzqkT2l6rlEUlpjUbxelUKH06DZhviUJPBrUaJxyZ3N
         pe39ktbhrM3zDBfijOJ8QOliGv2ApjyIUZBX/B2sRnU2iC6LIYzIXZc7dc3REyF9BYvx
         +vs9JPznWykM5BQMwhxN+PMQYzTS02HGT8yBEeqOEGPWw7Cp0ETOpns8Dyj1BkW9n35f
         eJfzqAxuWIXAA8Os6+6hnMpgGANzaZgRBJ7120Wd7w5r4qEDUabxmnStgyJfv5LwQO9p
         B2lg==
X-Forwarded-Encrypted: i=1; AFNElJ/Y6FZKc+dpBKAyQkcoihZrM7CFWOtCpW9oJ+Zk8HIQJjd3AUvSYhALiac2/z8BOokXORZmfUeY+iUtZoSyO0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmO81tkj/0Zk+gVJm+g60Xdw7/cQ2/TiPkqKbJGfxV7RN4uxoH
	POSEomTitAo0dF0u4tyRZcQ610DQRpr2MI7iO3ir0OAkC8HIkJiBkl2mvRM4wTKr4cbfoFzdSFk
	d6Y6adlku90ndaqhIi2MQZ/3DntfFsz9oXH9gERyljoUdz7lKRLLSmQ5y9u74VTG4PNiRGQ==
X-Gm-Gg: AfdE7cmacM8TWOBxiQ2Pfbj0jguBu3/XvH+Yw95rDUGN0PtqgLIqpZPPlzT7rgP0KZq
	eLNTHzNlIxxoWBSnZfpNL17PZyfurk10dAIEp/ndJTxNt3Y+LLKZ3ZuM7nhUGpz/t2o4obZJfvH
	MW6YH6gCsd12mazJncS9f5InRQdkOs3CK7uYJlhUBMeZ0un5bN5gxReuUgdogZZ+R1ZyEv+bvS5
	l62OWUa7QM+CljUVvGnu4q+ZcGEwPegaLc/Ua9MiB6E8/NoAL2uW1ukxSxrP6K+zz+iosGuhf3E
	RZM1hEdefrwNlTC1TSDZRvUiiE8i17aHW7TlMOsJ04EIY87Zo+mx2WT8zsqxlDqsvrJeuuy+MsL
	gDQe7Tx3ILpK8qF6GEamIQJXKBcEdkoKMgA==
X-Received: by 2002:a05:620a:4052:b0:912:671b:d0b1 with SMTP id af79cd13be357-92882e6d436mr156029985a.2.1782317057926;
        Wed, 24 Jun 2026 09:04:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4052:b0:912:671b:d0b1 with SMTP id af79cd13be357-92882e6d436mr156021185a.2.1782317057358;
        Wed, 24 Jun 2026 09:04:17 -0700 (PDT)
Received: from oak (c-73-148-124-98.hsd1.va.comcast.net. [73.148.124.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926000c343bsm594979085a.28.2026.06.24.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 09:04:16 -0700 (PDT)
From: Joe Simmons-Talbott <joest@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Joe Simmons-Talbott <joest@redhat.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/cgroup: Adjust cpu test duration based on HZ
Date: Wed, 24 Jun 2026 12:03:57 -0400
Message-ID: <20260624160358.430354-1-joest@redhat.com>
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

Link: https://lore.kernel.org/lkml/20260623194239.GA899029@oak/
Signed-off-by: Joe Simmons-Talbott <joest@redhat.com>
---
v2 -> v3:
- Instead of changing cpu.max quota extend the test duration based on
  the HZ value.
- don't call pclose() if popen() fails.
- check return value of fscanf().

v1 -> v2:
- Try checking /proc/config.gz to get the actual kernel HZ value and
  fallback to 1000 if the value cannot be determined.
 tools/testing/selftests/cgroup/test_cpu.c | 44 ++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 7a40d76b9548..feb7eb6a875c 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -639,6 +639,30 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 	return run_cpucg_nested_weight_test(root, false);
 }
 
+/*
+ * Best effort attempt to get the kernel's HZ value from the config.
+ * Return the HZ value if found otherwise return -1 to indicate failure.
+ */
+static long
+_get_config_hz(void)
+{
+	long hz = -1;
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
@@ -646,15 +670,21 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 static int test_cpucg_max(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = _get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
-	long duration_seconds = 1;
+	long duration_seconds;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *cpucg;
 	char quota_buf[32];
 
+	if (hz == -1)
+		hz = 1000;
+	duration_seconds = 1000 / hz;
+	duration_usec = duration_seconds * USEC_PER_SEC;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	cpucg = cg_name(root, "cpucg_test");
@@ -710,15 +740,21 @@ static int test_cpucg_max(const char *root)
 static int test_cpucg_max_nested(const char *root)
 {
 	int ret = KSFT_FAIL;
+	long hz = _get_config_hz();
 	long quota_usec = 1000;
 	long default_period_usec = 100000; /* cpu.max's default period */
-	long duration_seconds = 1;
+	long duration_seconds;
 
-	long duration_usec = duration_seconds * USEC_PER_SEC;
+	long duration_usec;
 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
 	char *parent, *child;
 	char quota_buf[32];
 
+	if (hz == -1)
+		hz = 1000;
+	duration_seconds = 1000 / hz;
+	duration_usec = duration_seconds * USEC_PER_SEC;
+
 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
 
 	parent = cg_name(root, "cpucg_parent");
-- 
2.54.0

