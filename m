Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC634845C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210452; cv=none; b=TEM3ysbZfQnkKBYmJLWQXHKng0VyFByOmRQ4GqShw4CDH9P1KfFeb+b26QFCh0vl6ZqK/Fc5/xmDNZlhDp6NtJIw4ih+y5Dl1evkuazll/FIvQlX7zmOJ0r25gf0VRrSYEj2S7f1VFODFdBhKZQjT3YVfw7TFzwIRL2LrjscVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210452; c=relaxed/simple;
	bh=rfMwY3TDTf+t3DovcV5Xyjtcph3FzGnl2khq6x25gII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNH3m46e3q8NVs22ky4fO+Dih0UcZKC+0JE+MP6BKah//Ta2fii9wQ4XC9j9CewoHkjcwMSnwlkih4XrrcRosULh24LKQs5LC8wQJn6K7snTnKhxj7UvI9Iic/JnBMz47TfTRDwQzs8gH02lxiU0b1GQVIdwTEdrCubPOKXXUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geaBQBrg; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geaBQBrg"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdbe434b47so4897845eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 08:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772210450; x=1772815250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwPzfjKbhdcdRrML4vfhkv1hWkxorXbLpxAl/yOdJGs=;
        b=geaBQBrgqq2gOK5gNUJLGKLdfX7xxMDA1Umr7iZ/DcPiUuk8QqDlsBqzyNJ1b6o6vU
         4QLEufNewEY42no/Gscd7lVXSvoYl8dXyDPvdfHEQf9S/K96vNO2RQdMEbCyPetTfBXn
         efuDN09L5Y9RcVzNj1UwGYmkOdCyuEpYeGK883odZZHGIIcm9dKg/L3K2SwVKv2+tYhT
         aW/5q0j4OQe0LR7j6wohrU3aPlvipViR9FFxuls8LQj9av1iHGZen3PEZCu+EQCSHt+i
         CfkgNyE1fAFNnu5SZTNUbtanjHT6CxsYCeDO/BPwmcK1sT1W1l/OlBQ0ugfVi2kYX+OJ
         L4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210450; x=1772815250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwPzfjKbhdcdRrML4vfhkv1hWkxorXbLpxAl/yOdJGs=;
        b=B0hJS5qhBzXYVs0iNht71FkMWCJEZbNsEP5rzjx0ylZW8J7V5SuZ/INLo2hBfBForc
         DdwUTs/h/UHseoGmgj7bGL/f+pKRCj3nQdkp4hKBL9pxvzMh+PAa/mbxTW9ykKkiPz6h
         LMPM4GZgZEMCiQT6X3fW3706iw7rYkj1fkgKD4M/SwnPUXUiLrb3Jdv5pJyZ+8jpLFer
         onhzwon4GJ6E4nCyok45eE50+MbRzwfcvZwvPpV1fFftH0c2INa4J4AMlFUI1oMWugUX
         zqkP1U1MqPC101qnMVYVplGImZ9aycAaM7WzfRcpma/RCad95PO9ZRIoLMXcvgvbgSnn
         MOmg==
X-Forwarded-Encrypted: i=1; AJvYcCUsyhwEOgEEnKc45UZlQxENEEFpPHWiTM/og5+83AXUmrVhhK4EyxY9wt3MyPrWmh2bjd3lEd3HIP28B5Fhb1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SFRfR2Luo0UdDHeGGRyzHzre7ZPLQTy5OWfsb7kJeFrEaEPL
	UYh/oDdGPthS1BoFBGhffFBsCK8VAIQfbGrCO+6DInhJM3XeNVbCLQ7w
X-Gm-Gg: ATEYQzxaIBIL4+/T8sRVkX5oCvC5JjYVJ3ocFu4ZdcONnHOh9mNT4u/RFwKXXjR96rX
	VhtJC/mghvN14FKFV5ePUSWzTgRxFzVPIF60dCWcEw9ByfqQWLxCYUFsQCSEV+pwfGy8XEGfIRx
	7tXfk9pKhP0INkQRWenrv+IukMYrAKi8AUGqM/T5O2sghlyNMdYz33FKk8Syaj+K2S7FImhdIiJ
	DZcfjbrsZ9FbehAnHvIclJGDdgX4UvzjXrC9Xlak39xNX/XbJ92KWJNdMRDPP0mF/mdm8hSiq6K
	kw+5OBPHYqRv4+t9ckXGtrFAmpupoOeuLYGMXvvlG1OabBsDO7O+iTl3lzChh1X80kNz61jn3VW
	FjIGGNQ1x5uVHTWskxsLgjrM5tMEutYg8m/F7YXY7LLclH6cZGqrPcWg02wA1ux64kLAgPW1mOt
	HVc5TsIkMPTMCCEVJ0HbsjP/JRh5lkvxiDiDfcBbn1FGycb8DQpk4gto60UAOWVULsJWt4VN7/B
	kmVlefPl+m9V8kr8T9IzDRSZQQ=
X-Received: by 2002:a05:7300:c90:b0:2b8:6abf:5ebf with SMTP id 5a478bee46e88-2bde1babbf3mr1508292eec.12.1772210450168;
        Fri, 27 Feb 2026 08:40:50 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdef9700ffsm220707eec.28.2026.02.27.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:40:49 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 1/2] selftests/bpf: bpf_cookie: skip kprobe_multi tests without bpf_testmod
Date: Sat, 28 Feb 2026 00:40:36 +0800
Message-ID: <20260227164037.84110-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
References: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kprobe_multi subtests rely on bpf_testmod fentry ksyms.

When bpf_testmod isn't available, libbpf fails to resolve
bpf_testmod_fentry_test* and skeleton load fails with -ESRCH, causing
false failures.

Skip these subtests when env.has_testmod is false.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 75f4dff7d042..50f5e11e6e65 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -105,6 +105,11 @@ static void kprobe_multi_link_api_subtest(void)
 	unsigned long long addrs[8];
 	__u64 cookies[8];
 
+	if (!env.has_testmod) {
+		test__skip();
+		return;
+	}
+
 	if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
 		goto cleanup;
 
@@ -192,6 +197,11 @@ static void kprobe_multi_attach_api_subtest(void)
 	};
 	__u64 cookies[8];
 
+	if (!env.has_testmod) {
+		test__skip();
+		return;
+	}
+
 	skel = kprobe_multi__open_and_load();
 	if (!ASSERT_OK_PTR(skel, "fentry_raw_skel_load"))
 		goto cleanup;
@@ -451,7 +461,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
 	attr.type = PERF_TYPE_SOFTWARE;
 	attr.config = PERF_COUNT_SW_CPU_CLOCK;
 	attr.sample_period = 100000;
-	pfd = syscall(__NR_perf_event_open, &attr, -1, 0, -1, PERF_FLAG_FD_CLOEXEC);
+	pfd = syscall(__NR_perf_event_open, &attr, 0, -1, -1, PERF_FLAG_FD_CLOEXEC);
 	if (!ASSERT_GE(pfd, 0, "perf_fd"))
 		goto cleanup;
 
-- 
2.43.0

