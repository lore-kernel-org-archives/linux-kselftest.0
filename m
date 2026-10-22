Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709079;
	b=h4ODaM5M+Q+hZAPJdK93lToC421eHvk7kIuFJno2b8VbwAKCgKLKKlFJLJiEhotKEAXY
	 omIRVqsNsXSJlOiUpmha/xR8MZsxAXlIEa8/Hdr1e4HZXgCMJ/HXlaMXqAU3kwG8hvQQl
	 pVbWB9zlOW8DgNMdf6X01aKWu1CPPf5RldXjskO5sZEpbi9PTgKJJZdkKL1q76ahkvODP
	 DP7NxOvLqP78FfBnd5LFGjSGOweTOp4b7km+7GQmIwqEwoqgo9ZyZ/h9IxW2tWbRahlnd
	 TcLhCh9hz4+i7EiNSoDK2qE9u56G5gKGO6Z9OY932cWBBDUdjHBWaalmhBZRWGMSqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
	b=IdYD96HHcJ/2d9ouAr8o8HMLmaFb41BuZiHXQp9cPW00DT8INJq/df1q1eg3dW2YChgg
	 kcyS/k5b51m3XWsBERdprN05UO1UmnC+K5Icl2pqP29IBha+F/B2QUjSpUBncQjgmhbqO
	 TcjPPVIoGS2uJeKkisyJ608BO77RJdIzgaPjU5AIWuDSuT6abCx7nlc5NJYqLrtqpnktx
	 fK3sUKw1lBSGG/hnh0p2UJdro1zopEYDZziiE2nEgqefYyBC5aZ58XZVMJNb42baBZB2u
	 dGq7s/UFbdNuL2lX8dpY8PEZdp7brpOexn3wT3zLqxvlL6kQOV60Azdh9PXeBRIvYXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jx0uIuZx;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D9606A339
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2D9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jx0uIuZx
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso125485a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709077; x=1793313877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
        b=jx0uIuZxNOwV/bOWoVfKGvfO+WNn4cb+9WDKL/C7FsrGegDJx6oLvjfLAQvzp7nRz0
         0lW18Tp+EIIbnKZfqEcLelNPZKmbqwIcdGo2m2QnlAFQcg3ggUBOHOX9l5XQENDy8/TE
         ZWRgbvo+g5Tr/ONAtqDHX3eam4LBb2NAXp4hvnTi1m2imzUoZL6CwFdQpgi18vPQBzoJ
         CwDM90vXHrcaV2zcMoPjZdHtPnE1EvmqH7YwqNArvmqp75TEIg6OJdIuZdR9MJH/eWN+
         YoQrJmxvbNWO3Dqs2hdooUdQYWuQaDoZjd6b3pkWZvlMee7I4lJxtE+xvenMb82S24fX
         tjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709077; x=1793313877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
        b=TlOTy47zsTiC8sMQZUytfNGrCDRY19ERTEJT1OJ/uG8T4VRoC782sbhn0MKNoWoSkh
         r70h9apstSKP3LCk6ZNPu8nIusQ27CEB4xN1O04rgyNJ5K17CRI9rYJIN5VN2pmMZgDJ
         ox7v471qQ5dRLpqUteTsWtyqcMJpvn2yMHyCxrOhBljW259cDVXcQTt/wEmDev/giidC
         VJ6VWSLvMcT6+qOn03YtNAEYYlOhw2jp2Se9j80ShtUpvf2Llpq/Nm0JeP1N3++ba0FY
         M1Dy8Fytyyx7KJ4A91jNP/DO3I2Q8y+jeOwFZ4gEvJNJrN/z8Eyju7Rt56O3TmwCQkY9
         Fm9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw71iYStJgEq+7mHdsdM/BNdx9k2b8U7bo55p24eiajfA+OsmB0boA07thHNU5NzUO/kTBNJ7PO6pBKvHnHbGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiEnvUWrmVetdyhzRZpOdWrJ4o8N1Wovnth6Ac02jHEWLWhFMK
	2Wln853hzH4TSwGTs2znAGSH4B+Tp/LZafDvSPu2SbaE3mAN59qE//UEETA+iZOKWEw=
X-Gm-Gg: AYBFou0bsVZqgxpwcyKnJu7L1hNQAI/godqwLgRrwtEcseeu5O39YANzgeDek09mgEJ
	Qm+1pdV2j5NM8GH9NeZqNRHoZ1LQqkrHrooAnDdZ1SBdN3MVQzOiI/xZXu/HzNx2BpCqFc+TaLa
	LQ5t1JKF++5Ajx+/UBgRXRwQtjA2YfYfNKnJP+03lp7NCpTq3q+gS32+iYpm4cfFwh5MVW7mau4
	67JGQETK4fppj8apACqXZbhVZXakkLCoM3t+dYGm5W8RUK7qS0QfcHEW6MdXwndGep8CrKmI001
	I+59iA16j8JKx4z13qoVgPTI6wLE5yQ0L7K0lATn9qeUiJyCVMWUOkKNM0e0+fGqJXpA3TV3BdO
	eryppUudUXX+u/O+HvLyEE63CGrl1s2MTdR9uvWK6EthaWsElqNS6NJ3/y5lQGB6KOab3gXqLn5
	+o2ROhdlT2wxVtnVmuB5+wM/VKLGGNGIdzzm1/UabY+2o0kPMRk9P/rF5ZpcOr/HZ+QT4Dgbxvs
	wnGrHH92nl1j71ruhSk2cOhIHEZbTi4hYuhLH8MprjLAU8w6x1RAQ==
X-Received: by 2002:a05:6300:86:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-3e36934ff54mr282797637.21.1792709077597;
        Thu, 22 Oct 2026 15:44:37 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:37 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] checkpatch: is_userspace: exclude kernel code under tools/
Date: Thu, 22 Oct 2026 15:44:20 -0700
Message-ID: <20261022224426.2756960-2-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

is_userspace() treats everything under tools/ as userspace code, and is
used to skip checks that only make sense for the kernel. However, tools/
also contains some kernel code: test modules, Kbuild-built mocks, and
templates and golden outputs of the runtime verification monitor
generator. Such code should be subject to the same checks as the rest
of the kernel.

Explicitly exclude the known locations of kernel code under tools/.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..8f9a46d809ae 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2665,6 +2665,12 @@ sub exclude_global_initialisers {
 
 sub is_userspace {
     my ($realfile) = @_;
+
+    # Kernel code under tools/: test modules, mocks, code generator templates.
+    return 0 if ($realfile =~ m@^tools/testing/(?:cxl|nvdimm|crypto)/@ ||
+             $realfile =~ m@^tools/testing/selftests/(?:bpf/test_kmods|livepatch/test_modules|mm/page_frag|net/bench/page_pool)/@ ||
+             $realfile =~ m@^tools/(?:power/cpupower/debug/kernel|virtio/vhost_test|verification/rvgen)/@);
+
     return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
 }
 
-- 
2.56.0

