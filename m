Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC330BB8C
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772264780; cv=none; b=Oo4A3DilMIE4/VnqhIhCyG85QANj0HN3NSCEA23Nq6RuSELKN7otbe4TabvCHiO7QWz8/vXDvkmr85i55n03E2aC25e20jqitVi+ZU/iWR3xUMaxvDIIOtNSPsyGN044Yoj69s4OX5xo7Yo6UzcS+vPcxnZVusYwA9iNX3nDAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772264780; c=relaxed/simple;
	bh=/5BZEDEPjXJZEbemnrSGEP/CsHhL3NpXMyBNCx84GNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=so2IHvRDV/T9scptfL+eGomPgV9I6AInPTM0qd9FEeceYJLdcsdtsiGk1lUzGvxArzhB+4iTiImllCdhH0zxMV0aiD5EkqBpO0aTYO891SZzVZB1a+4SuYuAhmfvomUDlkkOhrZ8FOppTmwAF2ZkyCBU0GnqRJqbB76829Ow7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYC7pFaA; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYC7pFaA"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso12312eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 23:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772264778; x=1772869578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvm98zlzsM3HSjB/EuHx7YQoewB1rqACesQFCVmyaYs=;
        b=WYC7pFaAaUCbJSkbSBK4/PDZSwxJHlq0ZnZZuviEniVtJ6xrR3n82shzGkOPhgZUYc
         l8cKiDYSuMltpFSvUZigmmBmqFIttq7E1oiEs+FTwgRG9bMp/yE4AYIY3Nmz5QgBI0+k
         B17X+TqoJiRrkAo0PDDLt4tOzCsKrOpxFH/VnadC/0tvaiLLxE7mKtkRk4aaYFYIMcdJ
         zERH3r2F81/9vSCzGLOumzCr023hMmNj0beaTYjFQWzDlwQgd6HPptpuW1R6wBzqNOkB
         aBk5iQ/QWsUNYQLORI2zNo0Txzg47rlSDBkLTVTdxpNa8A5UM0GAv9TtkWALttZbnkRV
         55dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772264778; x=1772869578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvm98zlzsM3HSjB/EuHx7YQoewB1rqACesQFCVmyaYs=;
        b=IdYTlCiRyi3v09SST//SU4rvc5qcVKYyidC68bhz7MD3TqZu82LviQ6m0QGCiuxZVQ
         ncl5owSakh0Y2dyhZByZaU5VtFFQE17YQSXspTXbE7lnuRNj96S5mvcYfxHWPzSrl3Vy
         PIeJXr+iu+x78AFl6DyYIPGQJ2XV9eJsrRQuFOScOFNGZWx/8E7nFjBse1sMVJkeugIe
         VxI2NNxcAHkUF/8fqLKAfxcNdR2lNckwoSyrqKLb76jFk1IdNGGlymbySXWL5dckKb5A
         QvuGiz78ln0ijamnTJh7OFSQwFw3IHEOPIvnYScmgjBco1o6L61NIQ7iErGiWDYmSqO9
         rvWw==
X-Forwarded-Encrypted: i=1; AJvYcCXMHHbvsf6yFZzo4QIak1lXqXKZxLSNNEse0j4v7yZ5en1veA9U/S9A0Uoftbg2jYJUifAqi3vBSQw3Kdaenqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DjDTefx/jm5XJE8kcCM2A6zw9kIXLuXKA7ppCAeirRkPMpfy
	1ZsLmMI7DtrFUgdk3Uohj8xy3LymfOafdNoz+DfveSVBShdDqoBTaIlD
X-Gm-Gg: ATEYQzw1+fDqex9A7lPKK8sE/5gPBKhr7e9sGbUyRpRTJxXqyjIFr8PrH6+3v4wczWp
	nvnyT1hHzLWCljZJFbKBN17gdjNZjJkzPU68wGAUwEr34bjEVnvbjk/9+oNt4wSmzpd6XriW8/A
	cNzcoimlH4PqcyntdArcusxVOPIIv5tjWPR0j/BehcJiESvRVxmfvzEGroj3TdKfACshn61G28t
	gOqPkQy1uQ0bKLt+EArCsAVhpbI0zHlammCoRpuCVbnvUILlEsm9rKVN88eRfprHz7kSAYRuEbz
	ZLf7byMOAGBVuscnce30rEzjcPH5zLFq6bD7ANs8SboAKGNGETPiwzs1A0jLtPX6k7UtcRz9gr9
	mh4NKY36uWMNEsWUFXkpkyhdFNE2vYIUuAwQV2t88O4zS1nv1wj/6g80PYeDN1UZm+DU2tvhc9T
	qK2TOECK1gGg2ZNkdeUX9lD73cah++E21Y8FEE4KAnozSrAaxOt91ouPBBOOth7h+cJBUHOH2MX
	EY07zkXx836oyScMS0YnnKcGZI=
X-Received: by 2002:a05:7300:538e:b0:2ba:a2fb:403f with SMTP id 5a478bee46e88-2bde1d31d40mr2418500eec.21.1772264777939;
        Fri, 27 Feb 2026 23:46:17 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bded67bd05sm1874926eec.1.2026.02.27.23.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:46:17 -0800 (PST)
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
Subject: [PATCH v2 1/2] selftests/bpf: bpf_cookie: skip kprobe_multi tests without bpf_testmod
Date: Sat, 28 Feb 2026 15:45:54 +0800
Message-ID: <20260228074555.122950-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
References: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
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
Changes in v2:

No functional change.

Drop the unrelated perf_event_open() argument change from this patch
(moved to patch 2/2).

v1: <https://lore.kernel.org/lkml/20260227164037.84110-1-sun.jian.kdev@gmail.com/>
---
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 75f4dff7d042..b7643a5bf7ad 100644
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
-- 
2.43.0

