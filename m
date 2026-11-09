Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237568;
	b=mQ4ITTYB0GsdTDJP2i9L23BLdSWsOdBTe1ucbJVc+vszasFJLw63ZEEZz1aN2FYV1/hY
	 wnpNQhQI1JmwPpbRys9L+RnYDqGHT5W4UK1Ydvr4vpAcpppNDu5muWzb5wbAseEJwPL0c
	 Jn5pqPM4poOPFyZJBKoB8mZnTz6aTuqj2/B4EFY3SrXjeXkpWtJ5TD+xdNTaVLPtuAS3F
	 3VVEuvDToMfWIqxEmZIVUexeY5eif/3tw2LPDCp0Hk1XQsohqc1ZmrxMPnXY1DwQQeHFB
	 1bgxfhVmpkezZ7JdEWzKKSehqkaT4tV9dW2Gl6QdOeZOacZtK07xystwC7NS5mwlWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
	b=j6T2k3enXGFIhTFFoc9pCPZDCLpRaMWBJlKAxIF4G3M9sGvmL+SUe0W8QvZ8QOq8odrK
	 d1cL1JVRYrGbTAfgCdDdtTyq/Nae8Wj/R1+RgHP8sW+rNoW8Swirm2F5TbUDJuV5CZdRp
	 VNFD1vrKGb9mPfD1KpnuXcHRpV7Kx+heR2OmZ5bYFMJffInF3qXf8b9ZJEYxjWkwAl0Kl
	 xCqREc0cyoariPq5zYvcO6wUnfjcWdAaiFCihV8/TgG2XnRauOiRJ4YP0jWwF+GORTrC0
	 9S6e5yHcQg7bxGBmEzeeCjMBNBx5//5oBVL7VyNlsqPwqf+UuizhZuuDKqft11wifYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmABFaJw;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC857606A330
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 15:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC857606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmABFaJw
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so539753b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 07:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794237567; x=1794842367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
        b=BmABFaJwRDbo/JuVeLe7Fwiac4Pa3GGM9x5qQ2hEo87GfV56Q7pg8LxpFggbyEKZyq
         OLcrgqV2wthO5NLR4BI9TNk1zz6oXqW6jeMFKjESaG7SZbN0gEXVPyaF8MGNvEsZfruU
         FtqjvsEJ4f4MUvKOosR2r4WhizqNDMrrRg9jXzMfxWeztgex5kSBvFnkr1l6ENfftHwd
         wRAyrFhFAkSGvLLv+ovwWGvaEu+GLUFIXdMB0RUltMbIB074Wia4ZFPc7XSH11c4GW8S
         UEXPeIpK9X5JKmJlNwBn0hbVquKOQ3sYG6G2PH4E0JtV4HL7eHZPlKFbDxUUXDcxzL62
         gSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237567; x=1794842367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
        b=JbrPmTeSqWxJWeyg39OQqTA87/krchRbSGwZajJ5IDzvqaXKUvfZERBf4WYRRmXz26
         THVwrQ3l6fkAxEWs4W0+HRk3Uj0Ph6jkcOJcQTbWGNVU0GxpxVtY/shSV4t9UolXmp9K
         NyRZw+f6giBruWR6Od2nLfaB/68JFU9BF4Vv1tjg6HqKDVK2VAaybZi9oi3uRl522dYx
         EIOmHz1yuWmfUPwPel+z9MCwKkQdPnxdgqhGWMpEICIZCxpSuuDuUnxd7zfba7ywIboy
         s7GoLtXnC3R1hnKad22hL3do3gtpbrhz/JIfvPUGs9fJdKgkAo57pExYRvRhj65bR8cC
         qieg==
X-Forwarded-Encrypted: i=1; AL+hErHoi/lWyEfFAwcqO9VXAdrwIA7xpeD7M1gUqpQzRaUF77I+EULtKrecByfjcxhp+Vd9W0GWGFjEjylaCvw2ajw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c7xzOHmacfbyG+WtJUC9SBly+aFxWNXqC37AZmkbm4vJ0P+da
	wJmli2Nny11DeuY0+f89p7l+62SV4mbAOXYriLSOur9qMW825kbDjYzGIXRCww==
X-Gm-Gg: AYBFou1CkUmO46JtyrH5PwpZ8Gf5tN6yubuaQsOO+Tbmn+JrdwYgjDm6JjGflOK98jE
	9g5cmegKoi19NUzOu5IZDVI6KGVBw1mXR9evXI//KyB4OLQ2sTphP64WWx2BU6iBHI2ENUSB/SS
	8JWc5WF/det1cl9Vwne4WhNgublNx36bH6cGadoxWfWycx/wssqJ+DYfUB7iO0qNospQvz25oBW
	AfY5DHqWyQI3FR0JkYx6lpRt4OqdoE9uDjx7nAIuyGmUO36ZZt1GA2U84n4glZ9nbzArE2y7YSK
	Mrwds+wEnFedV0QmuYYK6RY9X1UY1jn3n85mMVFxvG59P5gS3KfxNOGkbcWZwxLRrbfZ/LdS3i5
	ywMTG7M3sTx8KnbDMJQK/oeF6lw/QTxv4RXNawKR/KDcg4DnwlSW/+nFxAr59IWz+6orMd1tGIT
	yDWgem4gKCFLA7pYEyY2ykYmDCwIs+O6XTNsDHWm9Rh2q/7FMO1A2UUqJywdUsKVFJwKiyYG97i
	3L3JWdQPqPZkyyidh0fG+muHQBum2xDl6NEMKbstcrTvh8Plyrzzq2t3a6gJr5GfpaIXBOY6LVm
	ytddN4s7m05hrhwvZpe09BSnT1ftrsIC2XjEQalB9NWjPLafR/wcqzj59veqI6GMiBT7ptyr2a1
	2DKQvGEABjUjuOX5b
X-Received: by 2002:a05:6a00:ad89:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8b670a219damr4138847b3a.58.1794237567091;
        Mon, 09 Nov 2026 07:19:27 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821c57sm1508383b3a.37.2026.11.09.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:19:26 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>,
	Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH] selftests/proc: proc-empty-vm: handle CPUs without protection keys
Date: Mon,  9 Nov 2026 23:19:12 +0800
Message-ID: <20261109151912.156518-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On x86 CPUs without protection keys, pkey_alloc() fails with ENOSPC,
as documented in pkey_alloc(2). protection_key_support() only expects
ENOSYS or EINVAL, so the test fails on such machines, e.g. an Intel
Core i5-7200U:

  protection_key_support: error: rv -1, errno 28

Treat ENOSPC as "no protection key support" as well.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc1 on the machine
above; the test now passes.

Fixes: bf5add391eeb ("proc: test ProtectionKey in proc-empty-vm test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b3f898aab4ab..a9d3c973a663 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -77,6 +77,9 @@ static int protection_key_support(void)
 	} else if (rv == -1 && errno == EINVAL) {
 		// ospke=n
 		return 0;
+	} else if (rv == -1 && errno == ENOSPC) {
+		// CPU without protection keys
+		return 0;
 	} else {
 		fprintf(stderr, "%s: error: rv %ld, errno %d\n", __func__, rv, errno);
 		exit(EXIT_FAILURE);
-- 
2.56.0

