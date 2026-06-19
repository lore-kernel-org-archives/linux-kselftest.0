Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E063546C6
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850663; cv=none; b=nRUQp5aGzLXl6l9tqm5aY1zCs8pdb3ZAXfnNYx1N420uTbcMyajh/5CyRVWC5GelYx4GiGHq7iA1qIus2cQbUdzsOhbN6R+ruXa71ax65jsyF4FPcDgpJyI5Sd5/svYChdlZin6p9YndQVMut/Z2rwirkJhCoh+U+EPX5hnHPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850663; c=relaxed/simple;
	bh=YS0u1EKD53vo2t6W+IEib8k/HgYIgbkb0atxBhbXQmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvzSusI7o8A5nv7WhErpnP4ZH2UDUKucyZ/hdQ5Ni68YGFFYhBKH+JhVraGU5TeTDSRccK4GdkNA91WHwT7SxvVIKG+eELHv7+8OaLNrOYpyzlamvrWa75W/e25EVOWx1J+5ZPKraQEnzf5dTgwKJmGhpABe3qCs4ncg6lNLXUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F01I2N3G; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F01I2N3G"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c88cc025f54so1259434a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781850662; x=1782455462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cYyaGPf1aE+4RqqUs8yjO/wC6Ni+rND+DrZOmahUAI=;
        b=F01I2N3Gsz2fPxhJFaz/zd7SIEU2U28sa00lnrMprURx3igiDP9Hl0nXV9WmO/nOEl
         +E8qZhbJHd/jjTlSIJ1VDZe/6I2zbdoaBLuvRAUTWNfY0iQnm4cFF0meFPrzBm1UgKw6
         rlY+0zzgQFP661GZoH0+ZNvW/2bT8yPRnV7lx8+8T0Og0OFC3ZbMC2E09rtM+8+kdsU/
         I4Jjpg2viX7o9Fw5DpdVznDUFvWhjzL7sEuTWX5YLuixJa2FFu0h4dNn0p7f1nxBzCRd
         VLFFR6MEjjOYUXrXU3kmV+4O6KWVm1H7s+JkH8geuNNA9snZMu/cev4PD9sjfI9FrEXd
         Sg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850662; x=1782455462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2cYyaGPf1aE+4RqqUs8yjO/wC6Ni+rND+DrZOmahUAI=;
        b=FueHZpiOnRDwHBkAW9GmKIj1YRdxNrB6eayIPmtX6GbBsO6oZZw7T404Gz0VnkMk4L
         yh8UbCmyTsF0BohE4Tk+HrKdO77AQCR6G78OrxYSjwogJzSw0TNimlUEDyMnWtP4jIKn
         srI4Ci+pKkrdwlgniUg20/zgps7EXqieF4Y2rdYW4qu5pxDMf+nsnZrb0MruEyo6vxU+
         V2bFC7NA2+/NTjUDCfF4h2pNhDoVYjDdG2xSQwgKpBf/xCBo7891VdYY4HMVPmAmWxR+
         muHlBGvIz+UlrOoqeWWSDLCSBUtH1EeMeiViI5k+/ckSIThrMkqwJkdBRKuJVzg9PriB
         WwXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pDMw+u+RGYFuA4+4O1UrVUz2BPepZD78/e5tFpiuAEZUxGNkPO/ypVukdfvJgteX4N4Kxj5dgm+cRSngyxGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1GoIERuvrLz/517p1ao7fkNM+LKSEVm5D8WNmC8cCQ0ehwMG4
	qbvHqiIrZxQDZXX5JepQMKBDvksJvjqo+dikJFlXOnW+1NjNLKAOz22+
X-Gm-Gg: AfdE7cnTvOl+VJpM4KzqfnvNMzmPQXKrhz9g9N2QWMZmmTgeycj6v8Hj0bClTQryBNh
	YU8MV98rMxMBm0ij391zRm0i0cz2NWyw+sXuzYLbB7VbkLtnTZi2pEQdbJWhN3G6S896yZw+5oO
	/aIVgeC3x3+gmTUK5HiHXVoOqCneHNmuUwDTh1RRTGI0cnx0sYIPDQF2YclaJnlj5/KV5DfubGm
	U6Upj0IKQnP6OqsLefKgfuqxP0gx1qYnlvFYJ/XMgLF3nn3LV/yi2VPhRqqpncyWulEqERnSn27
	kCS/MrPqytBkFeozw41WBWLhue3V7HXziJtYCBRcmCV2AM1rDFIMcrUfOf4Pp5OxUTrYRSjDapR
	Y1m9dwYCvw0/Vu/XkfAqbndY1UmD6Qt731gU38/q+o1wyEFyClTtFwrgpLZ+zItzQ8dapyawAfJ
	ae/gMu4M2UX/qJLA9Jzq2JcIdcXtndMkMbjnOmWl6lkMhvCPzlaQnpaj483508Fg==
X-Received: by 2002:a05:6a00:3916:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-8455604dfa2mr1641891b3a.9.1781850661847;
        Thu, 18 Jun 2026 23:31:01 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382b886sm1380096b3a.51.2026.06.18.23.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:31:01 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v4 3/3] selftests/bpf: test rejection of a packet-modifying SK_SKB stream parser
Date: Fri, 19 Jun 2026 06:29:52 +0000
Message-ID: <20260619062959.3277612-4-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
References: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that attaching an SK_SKB stream parser that can modify the packet
is rejected, while a read-only parser still attaches.

Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 .../selftests/bpf/prog_tests/sockmap_strp.c   | 31 +++++++++++++++++++
 .../selftests/bpf/progs/test_sockmap_strp.c   |  7 +++++
 2 files changed, 38 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c b/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
index 621b3b71888e..1d7231728eaf 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
@@ -431,6 +431,35 @@ static void test_sockmap_strp_verdict(int family, int sotype)
 	test_sockmap_strp__destroy(strp);
 }
 
+static void test_sockmap_strp_parser_reject(void)
+{
+	struct test_sockmap_strp *strp = NULL;
+	int parser_mod, parser_ro, link;
+	int err, map;
+
+	strp = test_sockmap_strp__open_and_load();
+	if (!ASSERT_OK_PTR(strp, "test_sockmap_strp__open_and_load"))
+		return;
+
+	map = bpf_map__fd(strp->maps.sock_map);
+	parser_mod = bpf_program__fd(strp->progs.prog_skb_parser_resize);
+	parser_ro = bpf_program__fd(strp->progs.prog_skb_parser);
+
+	err = bpf_prog_attach(parser_mod, map, BPF_SK_SKB_STREAM_PARSER, 0);
+	ASSERT_ERR(err, "bpf_prog_attach parser_mod");
+
+	link = bpf_link_create(parser_ro, map, BPF_SK_SKB_STREAM_PARSER, NULL);
+	if (!ASSERT_GE(link, 0, "bpf_link_create parser_ro"))
+		goto out;
+
+	err = bpf_link_update(link, parser_mod, NULL);
+	ASSERT_ERR(err, "bpf_link_update parser_mod");
+out:
+	if (link >= 0)
+		close(link);
+	test_sockmap_strp__destroy(strp);
+}
+
 void test_sockmap_strp(void)
 {
 	if (test__start_subtest("sockmap strp tcp pass"))
@@ -451,4 +480,6 @@ void test_sockmap_strp(void)
 		test_sockmap_strp_multiple_pkt(AF_INET, SOCK_STREAM);
 	if (test__start_subtest("sockmap strp tcp dispatch"))
 		test_sockmap_strp_dispatch_pkt(AF_INET, SOCK_STREAM);
+	if (test__start_subtest("sockmap strp parser reject pkt mod"))
+		test_sockmap_strp_parser_reject();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_strp.c b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
index dde3d5bec515..fe88fa6d40bc 100644
--- a/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
+++ b/tools/testing/selftests/bpf/progs/test_sockmap_strp.c
@@ -50,4 +50,11 @@ int prog_skb_parser_partial(struct __sk_buff *skb)
 	return 10;
 }
 
+SEC("sk_skb/stream_parser")
+int prog_skb_parser_resize(struct __sk_buff *skb)
+{
+	bpf_skb_change_tail(skb, skb->len, 0);
+	return skb->len;
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.43.0

