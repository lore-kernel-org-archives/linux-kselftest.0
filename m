Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB138379980
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903954; cv=none; b=syNTgKGc9yqPucbkV4iHh+4cLluaf6S+7iLBwW2Rm3EGaDZyjtnznLFafWH+h7j6evxisCuc+rLkeieqmVbQjZwhcOm9M2qMqpyWSl9Fo9T35ACMPZLXf4+BXsgR5juQYJmQetC8yxbe08j4cmhiJCvr0TUMn7yu4yOTwyzGqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903954; c=relaxed/simple;
	bh=G/63HWtsPzNl8OwYXYz4ESq/2Bi7TZk4YzPIOakb9rM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XU+/o8SDRWUqwPCZ7aPuV5k1761/rBizMij8hPsND6+41vhbKwefdCVje1JMKLsDIPcbw8+eP0yi3eTf6IBZ0EMW3eyBgoaZ0xYmcNiVkOxb2+07jBQ1nvepSWmSrOxXvnMMtsSxluMDdP3F2Y5bIrL+0UvYNYze+Hu8Q5B4U8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Anjl99zC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SIVO+tmI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Anjl99zC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIVO+tmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781903952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0RLcHgtJHLdnreydzpBHm8njONwy5wHQ3yBTFU1OVEQ=;
	b=Anjl99zCE4dSUBnBBb5mdBHlUj1fX23HbgEM5oE/x0WmghRpZAf7UpZmsZrMOFl01zsPkE
	xB6aQqt0gctZ1oYcs+EX9/1Zarb/UbAZhDYhbVkDrp263+AQXZjWZujyE6oWTzOPCIUclI
	JyKnQCTzhLvFzjnedE9Jc0osoQaebAU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-oVjmriWJMKiUdgZKc1THWw-1; Fri, 19 Jun 2026 17:19:11 -0400
X-MC-Unique: oVjmriWJMKiUdgZKc1THWw-1
X-Mimecast-MFC-AGG-ID: oVjmriWJMKiUdgZKc1THWw_1781903951
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91e59716176so430861685a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781903951; x=1782508751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RLcHgtJHLdnreydzpBHm8njONwy5wHQ3yBTFU1OVEQ=;
        b=SIVO+tmIfOQQ4tOq3LFm/kvWNXpH3p14uZz4SJ9B4o+KDdqJc2D5u5bI7UdgOABGU8
         8VLXjVJvN8tyZKGzJPf/L/9f1HPXKyT211/71Lw+8MK9dthIsxSq/gfQDTw6kswpWn0X
         Vu+I2fPQ8/Uqf66g+64usXDzro94IXRvq4abbAvrljiIZlGmKR+LN0Elb45dua3n5gSw
         MkU3KFTiW8MHQMiME0pq9BTHePM7N2SRGj1cmIipywuvqJNye/i7vveltMxKE2rr6161
         dnzoTe3yWiAQ/XIPp+Di30FAjKJPm7mFlPso6SWI2kTGbpXoafvlRLz8Z4neSfRvbJHk
         g+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781903951; x=1782508751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RLcHgtJHLdnreydzpBHm8njONwy5wHQ3yBTFU1OVEQ=;
        b=OyNTEolRi96CaVN9Te6V9unXIUvW0d3xWnjjEuYrg31EKysgYuMbZUVO1SbKFSzfNX
         OUU4pAqGQhdEQ6aVUqfhZAbqMImZxNFeV5CzzU1DoXTC+7fvYV4y4a4OoWAOUabXSN9V
         7bVgrhBJuM+5YYnv9wuKJ3/LhI9P/Tm2F4H6Rqd2Z3CdogYPas7ei9K9eUr9vsUol0rE
         G5NVJk/PbL3aNusgvtjUxKqh9r4esPYtHG8P9H2zEKJxTS8ScGuBjLJp8Xy0nW3IEOvi
         DpiFRxmbuHKJw5o+OBB4Nw8j9fBT1JZOA7THAtZEwHihgqzKu56Ypuatn/wsKGgWcPrj
         2ejQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SD2QnPFhKaGO0uVSd4xRhhxt/ubrOOt7kltmCeBBfE5/9xKSjBdXs/1q/GhhTO0T8BNcrGlk6rdj5augbfpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+7rVsfjhAqMVQuPr0dv/7nPqzboTe9IWWGOfFzgxxiMMxKZMZ
	HqUEvCDSZ14PmD7CNQI0XEO1NrLh1ejOcDTJu+h28wbsvLc1G+cqXmm1axxNBeUqgkd8P6lw9cN
	6kptrkJO4Zs5FjG1ov1Dt0lijXwbXKDX+/5xTQQTQBqr+C35VJl6OCV+XCd/H5Yu6LWeMjQ==
X-Gm-Gg: AfdE7cnKMSl9DL97qUfy5ZtVFn7faEjks1bqWk2mg+SvcxOuw1OrVGeUIE49/zlEhGq
	tKDlCp5Pwm1UgULPkJqnVGSpq3TWb2giED7O8XdSyYkBr/0j46fWNMVE8ZW2nTzMHPJlnUxKqfF
	YS24XnbN1utHkfdBU+sMT9AB1Kj/4jRSn3i1R/cLupV/EYNuBvkrMcDfVT/vXdh0V0NNfgvKbqU
	GX7LItkY1E1Okm9sIP7S1WFVGoPiKjLKbNITpkiOi+YpbWcZo1Mfd+EK1DETWOM62Et+7hAZru1
	Jskji+3kgpXKAiP+A7tlQys9QSynl7Kq75N3phPF9Wf05ddLeez9O14Uk32Ce5lwswMv8nMSIuD
	thH5qY3Wbsq8KzyiDt3keOlPrydyKGoZuDoIEasmoHXPA0A6I
X-Received: by 2002:a05:620a:2547:b0:915:6a2b:6265 with SMTP id af79cd13be357-921d32dbcc9mr228209685a.44.1781903950878;
        Fri, 19 Jun 2026 14:19:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:915:6a2b:6265 with SMTP id af79cd13be357-921d32dbcc9mr228203385a.44.1781903950362;
        Fri, 19 Jun 2026 14:19:10 -0700 (PDT)
Received: from oak.redhat.com (c-73-148-124-98.hsd1.va.comcast.net. [73.148.124.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921d7966812sm102562285a.8.2026.06.19.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 14:19:09 -0700 (PDT)
From: Joe Simmons-Talbott <joest@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Joe Simmons-Talbott <joest@redhat.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/cgroup: Adjust cpu.max quota based on HZ
Date: Fri, 19 Jun 2026 17:18:48 -0400
Message-ID: <20260619211849.3430645-1-joest@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For lower HZ values a quota of 1000us is much lower than the amount
of microseconds per tick which makes the test_cpucg_max and
test_cpugc_max_nested fail. Use the amount of microseconds per tick
as the quota value.

Signed-off-by: Joe Simmons-Talbott <joest@redhat.com>
---
 tools/testing/selftests/cgroup/test_cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
index 7a40d76b9548..4ac5d3ecae00 100644
--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -646,7 +646,7 @@ test_cpucg_nested_weight_underprovisioned(const char *root)
 static int test_cpucg_max(const char *root)
 {
 	int ret = KSFT_FAIL;
-	long quota_usec = 1000;
+	long quota_usec = USEC_PER_SEC / sysconf(_SC_CLK_TCK);
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
@@ -710,7 +710,7 @@ static int test_cpucg_max(const char *root)
 static int test_cpucg_max_nested(const char *root)
 {
 	int ret = KSFT_FAIL;
-	long quota_usec = 1000;
+	long quota_usec = USEC_PER_SEC / sysconf(_SC_CLK_TCK);
 	long default_period_usec = 100000; /* cpu.max's default period */
 	long duration_seconds = 1;
 
-- 
2.54.0

