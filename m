Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B243E4A1
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831278; cv=none; b=l5NSkdJgebU5H4YHUyjJyI8ktTnFXQDERufwrtcXJ2tNyZB/R6fN7LSNkuNVfPWyW90JcSj3e3HwnMpIJUXjXQML5zJOeKfTtrPmQB9jR/aEKnrhHwP4x9FDn9AS8iL0RcEwRQX2oDEU1LzNKprtmtt7S7gABVyeDbCNpw66hEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831278; c=relaxed/simple;
	bh=6fpn34AYa5a4NP99AEz19Q2ZqyMidgD7TtSO++tV3ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWOtrcgQum+bDDlSdcxag6VLJxg3U0Il8bPhYTzAgwTZBYGTCBNud/urrJYG6n1OgTK4spX/AV4LlP+MV//KojHJdrLbtoaXjlE5YsA0DxrXb1sONcIqmZzg57NaX7jxAOEcWVkIRxmXT4SLiuvZ7fPBHKA9nr8nYSrnbmvBVh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDp6Krr/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDp6Krr/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37fad5eca09so583038a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831276; x=1783436076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZ8Fq141v51trmI2n1AyrBm7+0CWWqtlV8J+t5ivkWw=;
        b=oDp6Krr/zu0QGqyCQyDqG6h2gEBw0tbDrt7RTbJ+367iKPPfUCZVbqgSX4iwCjJzuU
         yT1h3nygJ0/mrmK4bR9WnggBIty8xC21xEx3fQFjGq2KLW8R3OrIksCQ+5Qex5rnQh5I
         QzMYyFX3pkJSees9bMy9i2AXzi9uT0M00GvmIcaw3YICyp6wPV/hsrbHLtSNzDYZVHmc
         VTAZsGPFj1GIbGjm+rh3vohMIRIs9u1dG+SehPOTUOpGyhphf3I9j9q2qQMSMBBxfYTS
         onxKnkiStt7CEGWQwxZZF2ikwO8zsUiFmmAPQ3M2T++PfqEdKjrlJHR48StFTrx6D+dx
         vv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831276; x=1783436076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZ8Fq141v51trmI2n1AyrBm7+0CWWqtlV8J+t5ivkWw=;
        b=LS/L9N/6bm//s+NNht7yc/lLYp/FhtXqMfWPjvwIp6BJQHY1mvcgz8RI52peObAn4m
         sAECLVpreFlGF50GbNorWAVlN/irXokIUCIN8srP1c2hg22l483i4HGbPKFAyr85jtBh
         wyWas5p3ATBSusT0zlz3eNVnr5XDjw0WxJhvjgHXEhx651ZX7C7WLfSM6ZRddyJRluIb
         J3yJ0EIcUHD3PSYaSLxKMhzgAF6Oz6BYFiYlUxdRtd5aG1huvUjZDw+2Q7T6P6OsZ80R
         XbO9/SqT3eJa5NYupjRelviiz21LJSxx4j7+2DNOCNRBpJG9otKwfK9slIukZMTZNSmP
         R0EA==
X-Forwarded-Encrypted: i=1; AHgh+RpCaecqvR/NM4zNI8b01sn7FCOfBn/RP5qlSFW8jswP4Z9kLjrICHpxkr7QcXX7TNLgZprBXxXeRlLlm5MmphI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/A1ZBYYxY63C9Bv2qnh0j5kxMev4a/iWQ3ouJXVG3vZMtuKr
	oKM3cAbJn3kMjWU3t2cYRxn99xmCN0lAfnTUFHGplfkfaOCrUMXih8F+
X-Gm-Gg: AfdE7ckns4I2mEO9Vci9LsaVbfvr7h/xMcmg3XqCVF/+EIshqAsoJYZn2PF4Vw9kNWe
	5yWlQzvF4Kh/L27RrIIAr7kw+tk0f5YLVTxR7TNa93vpT592lzJIBqweUqXpuXI32QRK7PCqubF
	dCMyjBWr6x1M92OcVUyb3pMQekjqRBesThx0plVmlY7n3ESMmTn3VjoSuEPMFAVGY4XyyJnpoLn
	CuE59wugPKIeX8/94RZcLieT/9JIWiyO1VWFZkJhJam+xLYQp7oYwRj2A2Q5dwQhsEorRq/+x3v
	DU/uQ/sReLpowrE0c6XUC6/IlbJapuiZUsV04QdtENBUYlDLAj4EY8jkptDSNoHHyjVrjMpYsWO
	UwWv+t54Dn9g1SkpB6msOVNFzPaGawqxcsAOavtYPEf5IhbUSvz9kuPWrcRc84zKc8Bv4TMKJhk
	hqCdy9oPqZDrCHj6ctWC0ezybJMsSE4/p+hM9HT8PkP3MS1r1/PXg=
X-Received: by 2002:a17:90b:520d:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-38067336c32mr1690613a91.2.1782831276383;
        Tue, 30 Jun 2026 07:54:36 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095b684basm20122a91.1.2026.06.30.07.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:54:35 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Varun R Mallya <varunrmallya@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 2/2] selftests/bpf: drop tc/xdp/flow_dissector/socket_filter sockmap mutation tests
Date: Tue, 30 Jun 2026 14:54:06 +0000
Message-ID: <20260630145410.3648099-3-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
References: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tc, xdp, socket_filter and flow_dissector programs can no longer update
or delete a sockmap. Adjust the tests:

 - verifier_sockmap_mutate: the tc, xdp, socket_filter and
   flow_dissector cases now expect __failure with "cannot update sockmap
   in this context".
 - sockmap_basic: drop "sockmap update" / "sockhash update", which load
   a SEC("tc") program that copies a sock between maps.
 - fexit_bpf2bpf: drop "func_sockmap_update", whose freplace program
   updates a sockmap in the tc cls_redirect context.

Remove the now-unused test_sockmap_update.c and freplace_cls_redirect.c.

Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 .../selftests/bpf/prog_tests/fexit_bpf2bpf.c  | 13 -----
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 52 -------------------
 .../bpf/progs/freplace_cls_redirect.c         | 34 ------------
 .../selftests/bpf/progs/test_sockmap_update.c | 48 -----------------
 .../bpf/progs/verifier_sockmap_mutate.c       | 12 ++---
 5 files changed, 6 insertions(+), 153 deletions(-)
 delete mode 100644 tools/testing/selftests/bpf/progs/freplace_cls_redirect.c
 delete mode 100644 tools/testing/selftests/bpf/progs/test_sockmap_update.c

diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
index 92c20803ea76..d3a954158c33 100644
--- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
+++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
@@ -336,17 +336,6 @@ static void test_fmod_ret_freplace(void)
 }
 
 
-static void test_func_sockmap_update(void)
-{
-	const char *prog_name[] = {
-		"freplace/cls_redirect",
-	};
-	test_fexit_bpf2bpf_common("./freplace_cls_redirect.bpf.o",
-				  "./test_cls_redirect.bpf.o",
-				  ARRAY_SIZE(prog_name),
-				  prog_name, false, NULL);
-}
-
 static void test_func_replace_void(void)
 {
 	const char *prog_name[] = {
@@ -599,8 +588,6 @@ void serial_test_fexit_bpf2bpf(void)
 		test_func_replace();
 	if (test__start_subtest("func_replace_verify"))
 		test_func_replace_verify();
-	if (test__start_subtest("func_sockmap_update"))
-		test_func_sockmap_update();
 	if (test__start_subtest("func_replace_return_code"))
 		test_func_replace_return_code();
 	if (test__start_subtest("func_map_prog_compatibility"))
diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index cb3229711f93..33f788e2786d 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -7,7 +7,6 @@
 
 #include "test_progs.h"
 #include "test_skmsg_load_helpers.skel.h"
-#include "test_sockmap_update.skel.h"
 #include "test_sockmap_invalid_update.skel.h"
 #include "test_sockmap_skb_verdict_attach.skel.h"
 #include "test_sockmap_progs_query.skel.h"
@@ -235,53 +234,6 @@ static void test_skmsg_helpers_with_link(enum bpf_map_type map_type)
 	test_skmsg_load_helpers__destroy(skel);
 }
 
-static void test_sockmap_update(enum bpf_map_type map_type)
-{
-	int err, prog, src;
-	struct test_sockmap_update *skel;
-	struct bpf_map *dst_map;
-	const __u32 zero = 0;
-	char dummy[14] = {0};
-	LIBBPF_OPTS(bpf_test_run_opts, topts,
-		.data_in = dummy,
-		.data_size_in = sizeof(dummy),
-		.repeat = 1,
-	);
-	__s64 sk;
-
-	sk = connected_socket_v4();
-	if (!ASSERT_NEQ(sk, -1, "connected_socket_v4"))
-		return;
-
-	skel = test_sockmap_update__open_and_load();
-	if (!ASSERT_OK_PTR(skel, "open_and_load"))
-		goto close_sk;
-
-	prog = bpf_program__fd(skel->progs.copy_sock_map);
-	src = bpf_map__fd(skel->maps.src);
-	if (map_type == BPF_MAP_TYPE_SOCKMAP)
-		dst_map = skel->maps.dst_sock_map;
-	else
-		dst_map = skel->maps.dst_sock_hash;
-
-	err = bpf_map_update_elem(src, &zero, &sk, BPF_NOEXIST);
-	if (!ASSERT_OK(err, "update_elem(src)"))
-		goto out;
-
-	err = bpf_prog_test_run_opts(prog, &topts);
-	if (!ASSERT_OK(err, "test_run"))
-		goto out;
-	if (!ASSERT_NEQ(topts.retval, 0, "test_run retval"))
-		goto out;
-
-	compare_cookies(skel->maps.src, dst_map);
-
-out:
-	test_sockmap_update__destroy(skel);
-close_sk:
-	close(sk);
-}
-
 static void test_sockmap_invalid_update(void)
 {
 	struct test_sockmap_invalid_update *skel;
@@ -1385,10 +1337,6 @@ void test_sockmap_basic(void)
 		test_skmsg_helpers(BPF_MAP_TYPE_SOCKMAP);
 	if (test__start_subtest("sockhash sk_msg load helpers"))
 		test_skmsg_helpers(BPF_MAP_TYPE_SOCKHASH);
-	if (test__start_subtest("sockmap update"))
-		test_sockmap_update(BPF_MAP_TYPE_SOCKMAP);
-	if (test__start_subtest("sockhash update"))
-		test_sockmap_update(BPF_MAP_TYPE_SOCKHASH);
 	if (test__start_subtest("sockmap update in unsafe context"))
 		test_sockmap_invalid_update();
 	if (test__start_subtest("sockmap copy"))
diff --git a/tools/testing/selftests/bpf/progs/freplace_cls_redirect.c b/tools/testing/selftests/bpf/progs/freplace_cls_redirect.c
deleted file mode 100644
index 7e94412d47a5..000000000000
--- a/tools/testing/selftests/bpf/progs/freplace_cls_redirect.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2020 Facebook
-
-#include <linux/stddef.h>
-#include <linux/bpf.h>
-#include <linux/pkt_cls.h>
-#include <bpf/bpf_endian.h>
-#include <bpf/bpf_helpers.h>
-
-struct {
-	__uint(type, BPF_MAP_TYPE_SOCKMAP);
-	__type(key, int);
-	__type(value, int);
-	__uint(max_entries, 2);
-} sock_map SEC(".maps");
-
-SEC("freplace/cls_redirect")
-int freplace_cls_redirect_test(struct __sk_buff *skb)
-{
-	int ret = 0;
-	const int zero = 0;
-	struct bpf_sock *sk;
-
-	sk = bpf_map_lookup_elem(&sock_map, &zero);
-	if (!sk)
-		return TC_ACT_SHOT;
-
-	ret = bpf_map_update_elem(&sock_map, &zero, sk, 0);
-	bpf_sk_release(sk);
-
-	return ret == 0 ? TC_ACT_OK : TC_ACT_SHOT;
-}
-
-char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_update.c b/tools/testing/selftests/bpf/progs/test_sockmap_update.c
deleted file mode 100644
index 6d64ea536e3d..000000000000
--- a/tools/testing/selftests/bpf/progs/test_sockmap_update.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2020 Cloudflare
-#include "vmlinux.h"
-#include <bpf/bpf_helpers.h>
-
-struct {
-	__uint(type, BPF_MAP_TYPE_SOCKMAP);
-	__uint(max_entries, 1);
-	__type(key, __u32);
-	__type(value, __u64);
-} src SEC(".maps");
-
-struct {
-	__uint(type, BPF_MAP_TYPE_SOCKMAP);
-	__uint(max_entries, 1);
-	__type(key, __u32);
-	__type(value, __u64);
-} dst_sock_map SEC(".maps");
-
-struct {
-	__uint(type, BPF_MAP_TYPE_SOCKHASH);
-	__uint(max_entries, 1);
-	__type(key, __u32);
-	__type(value, __u64);
-} dst_sock_hash SEC(".maps");
-
-SEC("tc")
-int copy_sock_map(void *ctx)
-{
-	struct bpf_sock *sk;
-	bool failed = false;
-	__u32 key = 0;
-
-	sk = bpf_map_lookup_elem(&src, &key);
-	if (!sk)
-		return SK_DROP;
-
-	if (bpf_map_update_elem(&dst_sock_map, &key, sk, 0))
-		failed = true;
-
-	if (bpf_map_update_elem(&dst_sock_hash, &key, sk, 0))
-		failed = true;
-
-	bpf_sk_release(sk);
-	return failed ? SK_DROP : SK_PASS;
-}
-
-char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
index fe4b123187b8..20332a731d4e 100644
--- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
+++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
@@ -74,7 +74,7 @@ static __always_inline void test_sockmap_lookup_and_mutate(void)
 }
 
 SEC("action")
-__success
+__failure __msg("cannot update sockmap in this context")
 int test_sched_act(struct __sk_buff *skb)
 {
 	test_sockmap_mutate(skb->sk);
@@ -82,7 +82,7 @@ int test_sched_act(struct __sk_buff *skb)
 }
 
 SEC("classifier")
-__success
+__failure __msg("cannot update sockmap in this context")
 int test_sched_cls(struct __sk_buff *skb)
 {
 	test_sockmap_mutate(skb->sk);
@@ -90,7 +90,7 @@ int test_sched_cls(struct __sk_buff *skb)
 }
 
 SEC("flow_dissector")
-__success
+__failure __msg("cannot update sockmap in this context")
 int test_flow_dissector_delete(struct __sk_buff *skb __always_unused)
 {
 	test_sockmap_delete();
@@ -98,7 +98,7 @@ int test_flow_dissector_delete(struct __sk_buff *skb __always_unused)
 }
 
 SEC("flow_dissector")
-__failure __msg("program of this type cannot use helper bpf_sk_release")
+__failure __msg("cannot update sockmap in this context")
 int test_flow_dissector_update(struct __sk_buff *skb __always_unused)
 {
 	test_sockmap_lookup_and_update(); /* no access to skb->sk */
@@ -146,7 +146,7 @@ int test_sk_reuseport(struct sk_reuseport_md *ctx)
 }
 
 SEC("socket")
-__success
+__failure __msg("cannot update sockmap in this context")
 int test_socket_filter(struct __sk_buff *skb)
 {
 	test_sockmap_mutate(skb->sk);
@@ -179,7 +179,7 @@ int test_sockops_update_dedicated(struct bpf_sock_ops *ctx)
 }
 
 SEC("xdp")
-__success
+__failure __msg("cannot update sockmap in this context")
 int test_xdp(struct xdp_md *ctx __always_unused)
 {
 	test_sockmap_lookup_and_mutate();
-- 
2.43.0

