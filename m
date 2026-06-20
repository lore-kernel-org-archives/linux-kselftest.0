Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEEE1B6CE9
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 02:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781923497; cv=none; b=ae0WM4x0wTRkwMjx8IWfCU2uLXRiE7lu6bqraB02hX4sb/2g1Be6bGSdD4Ox2NCaLMw7NQQYTKcTNa6/4UclVpo5aI5cM/0eKg1zviIBQIPJYXiZfVboe8glzB36VEkn2XJmEM6bi4MmOmgXEpfkL5K6672vYxgUv+GJLlFW87Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781923497; c=relaxed/simple;
	bh=YXXYvTua7xSnHRRQX7UMZYFBwjxqSm8D+R0Oz3PNVes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClnmQzwg67yj/LU2QkgxMqQIAo2qemycDIrMsD8YqYEKe+oSvW9Lh5sOJgBY3TIUskpsFDL4AZIA+x2nEmnsHf2OiiRQhwyyob0Y4loPoON+2jaI/n4nksneKu98igABevpn/IMGQfiGHdnLSdhJK97tGE0JQnkQObngRmrrFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7kWZhmU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7kWZhmU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1598359a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 19:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781923495; x=1782528295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoheuMpaBBYEB0ARICeSI4vr55A0uKbRHvd5QkzvWCs=;
        b=X7kWZhmUZrK3J7H/3V5xmtseDKk5KU1sA4ueKvNdkrDLh0XT9ziaCP6RpzQgdI1eR3
         8F4NdXcrVkGaypjvUKNMpoBJIJ90iDQRSuk7I5itD5E1rUsEr1Ed15/cN0+4N0MMefku
         JSjZ2KAm6TMShnentWZJX1WBAyTvHgGz19baF+hoUtxpOgfX+x3KuL/ufZL1rO1mZCsv
         FRND7ecxlhc0dpVOpYqtO5geqfCK6e84JD5QHgf53VBWDi4TwJjkvwjvddnoLOp2PtiQ
         T/Jp4hVraSQD7bkuD675nOx0DVPosEvrNcLIpM/z1phLj0DndLtHogZ2xap7od4+9Dpd
         wnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781923495; x=1782528295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CoheuMpaBBYEB0ARICeSI4vr55A0uKbRHvd5QkzvWCs=;
        b=F6WBk9Nn2GF7aQCJN/6bBKDAa37z2C9LdNZbPNiAmr7+vLgU14JlA4J+agsd8TLiEP
         fFq4BWhKKH+Vh1y6RhCJ+k9YICFWs8t6PzlAJY95X2SQGtvYYZzhY+jW9f7lxiMcoBlS
         GZ21UOEsaTgcAQi4hWzzK1UhwndM13ynIdyY5UYMOcRvWDJNQ0kfJhvxG1caYeV4Uyp8
         Axekvos7n1LUaI0slFcb86MJsSrhjUWbkrn6UvqK5jp5ycvExz8QhbelBPW57SLFSbh/
         AHVw+Xl2ZvN1M55eOhLYSxWKqEjpLKYYz6LNq4gsnYmyF6d1yUu7vNfjGST/ENfYe56R
         +q4A==
X-Forwarded-Encrypted: i=1; AFNElJ+PKRBz9v18uDnYAB8k7nHLyA34pCdDeYQznVyXm3s3Ti/Vevf55mdb7lYMx+ltRenXH+1qFhqaU+IKemsFpzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxblS3EFYrN23Ix/ybGXJjAw230j6RJ4bsEOrHKeeX9EtUwwSVx
	i6KhuGssSBMBmqgQvRsQiI8d6yHzzfJpRsIy1gEUhXRFMnQ131oJ2Dgj
X-Gm-Gg: AfdE7cmIXdo3TAXYMoXwIMU/18JxIwHQuJ/QMnwF417zKOy7BwF4PalJ5FbB+/MJUIL
	QXDx4C5yS6s8cbJ6aWmnZk9FsCv2HMPGx+kaG5b/bF1ORKoURCYU2mRr6rbQ3ByVh0N2Tl1fTkk
	hhx1DaI3kLdujArGOYc7u0UVofS4QtcnmIdGvZzr6tnFmeuWef2+w13Lw6i+gWgd0DGE+KkQEwb
	S9SOYb3gtI0kCs5RkPAhr1PfJx6cpe6iuB/SnvPh7tjZKCfZzzJPbYwZ3YdwLqnBn295gwxVVPg
	4nT7XBrk3EG74y9YuBVK3nEc4cG4vbAovE42vOWhZu1MnduPt3FlNMSNJ+zs3lMJKtKmrb809P/
	9naXQpL+n9omxWNjkyjZLj6tcHmRZg34L0LsdsZuVShgsB1gsjOZkI/kHUn/PNDUVdBv/7nTjQ+
	vHBOZ7hC8WSVI6jBsmLQw1XMFnigKlnjcOqmyIVW5R9XrmD4mFSW0=
X-Received: by 2002:a17:90b:4b84:b0:36d:5dbe:2a0d with SMTP id 98e67ed59e1d1-37d1e82238fmr4681205a91.7.1781923495427;
        Fri, 19 Jun 2026 19:44:55 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1600975asm1087971a91.0.2026.06.19.19.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 19:44:55 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Bobby Eshleman <bobby.eshleman@bytedance.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v5 3/3] selftests/bpf: test rejection of a packet-modifying SK_SKB stream parser
Date: Sat, 20 Jun 2026 02:44:18 +0000
Message-ID: <20260620024423.4141004-4-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620024423.4141004-1-rhkrqnwk98@gmail.com>
References: <20260620024423.4141004-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that attaching an SK_SKB stream parser that can modify the packet
is rejected, while a read-only parser still attaches.

Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
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

