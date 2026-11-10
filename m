Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283091;
	b=mg64LUu61FvgLN1EXyEkulnV4CuhurlSXglf9bZxkUg05uhou1cnBHBTarTxjCo0OesO
	 dtG5JOE1bxqzOjOAy3BfySjNn8gQ/znbljp3NkfW51eDfYev0UrQMzKpPZgRtfzZnSZ4x
	 1t1pDke7fYMWJglx0G4KJeDK9PEkHbdC7EekXlIdzzG60K1OE8X2Sz0rud2mq5mN+8m5m
	 8ngRroZvbVNWIv+aawhL41a6scSrST0yFyyx/Ou7A986QavZMH+HVomnVlujlWsVi43zG
	 5+gQxg0uXct1qgDUiKuFlUxJYQsbZLi2d7x0BwOkmijneFm2l/7LWl4976iUH/ZV99g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
	b=SZPRYNqqSJILXHrnVjeb1ckzm8CJ9UGLrQvK3NXNIE3SYpp33wvY4plR2k6KoR8drJCY
	 b/Q+xUL0XGfPS9sm0J+9d8PVJEiLXZZKINOsyUNTE/yYZlZhWNCwaAl70guB1QCwa6mrl
	 p4VrCs0FSK9EuDcbsYAauAbVxFxfK/xQJYQW6NZxwZIKgxT8ogY3KgKruMGbGqL0xhZIk
	 FNKXsx7ZoVsJ/eB+YxTB+GSyL4RN8g3XrFHPclqvudoXAX1wz73vLABGFN8FSna+/rei+
	 zKA4LDUYAzTsDJpeEA6cYCZi1Gt5BNQ8OBUN2DWkXAVCurqG7cZ2fE7oezAEmuMzBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UQp73qAG;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A90160A5BDE
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A90160A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UQp73qAG
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1813645a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283090; x=1794887890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
        b=UQp73qAGGfIXkMkoZdae4O4MEuyXs9A8yF9DoGxrfX96OQSLEPSt04bP7TR1S3SLAz
         PV0jhQwOGM0N7/GPg1saqkQ1IubsOC5rH1nfnrzQQB9sTcd+a89qSxOTPNj5o9v+3pI8
         QbG4bnaC2W9wZFtsAIZJKG17XlEJQfDOIHPRgbdgWKVoDjUX/1es0DbX7bEKMK0ETE5G
         HaJIe6N4oXBFDQQbJnkUmBGhdrNsoLcALj0Q7a+oDNScA2v4lufrqEV4xUcyBwwTtdDw
         TYfz7GaxzLZ/sW9tyI4ovZAFvscq3eS96Y6l0o+mYu4Rd/cSwGm48ogEpv+yCZLTxH4d
         65qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283090; x=1794887890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSk1Tsr4MwxHYw7iRh7y9cNVx4+IdLtKhJgZHhSE8Jo=;
        b=o+Z9agV1SPzBEBnVpCQR8enIqE0hPlF/9UC4UAMBRv6BQTwPrnWCwI8BEvlfiBEyfi
         8zjRdg77910u0bdegT2nnYGC1Y9V9vwMCqQDc5lydwJ9Ot03GEp9wOgs4ykO1tz52uk7
         dh/eHscBQ0O2eL0yO5bk2hD83iehWPRvmGcock2J682G2B/woBw4rSq2tUGAqXw/SgdX
         7NkQH8vIghMuMxgpa8fWXsFTAg8o8n/iuzKFDXKO3kG0Z4pT3SMVQBB+ytXwNRXUn1Xj
         G0epjabjDfiGmhaFbNqDBEebRzXpNTE6EXyJnF9iXDIutnL3qLihaTMLZ2yUNtjeGjcd
         zjaQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ5I/4A4n3ocIYwD4NkBewu/7GdCCHupQdeDe0ImNR9l3122zjtnyk0abMU86Dft2OmL2YPSfZVgS/79o1ezI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9XXZpZ4BLP5IQwW0P2c7ItIbgADqViO63422gxHOZ4dDZIHH
	0mpXEXLjFxUmWKTgKcrBFjiuXTKEOfEQOj4AHzUOrxsCWxmGZJmOn0tGzyPdzNvWDzg=
X-Gm-Gg: AYBFou0pJbTsel2w1xpLYnmAv/vUOK+NRyed9lKGK7fFD6bSE6v1fSVvggnq3dH1Rnj
	C9KebMz/V+pl509m/AZ1M2QObuhfnI1yPshv0i1kKjuzrxEE/qDEE2aAQcJxokG5pDinzCs70vT
	VJ15G03+ut9DJugVdh9hqx+SxMVv+jzADA3Vmj68gcoRJYl3vHojMsNUivAVEwpYTzT1wGz0Ibn
	s39oh+zjjVon48aGHckNN7l4sOUdm/SQMBpYCOpwZRpja/3MlUFl17hiL22JfrweHpDq5dVmKdk
	MH8i1TcKY4aVfeLpIveUisyOyslbfIoIuyOWCQzb7l4F6tyad1OVMn0FVHE68hUkUhuzaru4IQa
	Gpker8zyU8HG8iFjI4/m+wYkUQ3l2jnM9kAPSnoYbqBmPCq4raZ3w53oZcr+8uPQUTR07o9vJJK
	L3FdGhcz81MqRnNYiFLBUabFOcaEdtqikRo1GNJz72LFXrVB1L+sHCxVDIoM8YXhhP04IZEUfM7
	OgRiuMwr3esNP0P6EBWieqkSHLRL7BfqEgQqE6CwAiMgTLykzC+rrTieq0onKu6C8d9DhWMrmeF
	0vjJwJeavSFoa3viQLGl1agxfcJeWl0z14Tpl+1TPpKOrm2L5B3S3my+dgDQgE8H
X-Received: by 2002:a05:6402:5626:b0:6b6:efc4:9eb2 with SMTP id 4fb4d7f45d1cf-6b7556282afmr914079a12.0.1794283089889;
        Mon, 09 Nov 2026 19:58:09 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.58.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:58:08 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 14/15] selftests/bpf: Test the load kfuncs on cpumap and veth
Date: Tue, 10 Nov 2026 03:57:12 +0000
Message-ID: <87e20fe4ae289764205f33920e90f3283a478e8a.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

Add a test for the load kfuncs on each path of the xdp_skb_ext_to_skb
test. On XDP_PASS, the program that stores the values reads them back.
On cpumap and veth, the program after the redirect reads them. Each
test case compares them with the stored values. A load that finds no
entry, also after bpf_xdp_skb_ext_del(), must return -ENODATA.

With BPF_F_TEST_XDP_LIVE_FRAMES, a recycled page still holds the entries
of the previous packet. The live_frames test checks that a load returns
-ENODATA there.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 .../selftests/bpf/prog_tests/xdp_skb_ext.c    | 47 +++++++++++------
 .../selftests/bpf/progs/test_xdp_skb_ext.c    | 50 ++++++++++++++++++-
 tools/testing/selftests/bpf/xdp_skb_ext.h     |  2 +-
 3 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c b/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
index 64c6f0268d60..0811c09b7747 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_skb_ext.c
@@ -7,7 +7,6 @@
 #include "test_xdp_skb_ext.skel.h"
 #include "xdp_skb_ext_success.skel.h"
 #include "xdp_skb_ext_failure.skel.h"
-#include "xdp_dummy.skel.h"
 
 #define XDP_RSS_TYPE_L3_IPV4 BIT(0)
 #define XDP_RSS_TYPE_L4 BIT(3)
@@ -167,7 +166,9 @@ static void set_case(struct test_xdp_skb_ext *skel,
 	skel->bss->want = c->want;
 	skel->bss->del_hash = c->del_hash;
 	memset(&skel->bss->have, 0, sizeof(skel->bss->have));
+	memset(&skel->bss->loaded, 0, sizeof(skel->bss->loaded));
 	skel->bss->store_err = 0;
+	skel->bss->load_err = 0;
 	skel->bss->pkts_seen_tc = 0;
 }
 
@@ -191,8 +192,6 @@ static void check_have(struct test_xdp_skb_ext *skel)
 	bool unnecessary = (want->fields & SKB_EXT_FIELD_CSUM) &&
 			   want->ip_summed == XDP_CHECKSUM_UNNECESSARY;
 
-	if (!wait_pkt(skel))
-		return;
 	ASSERT_EQ(skel->bss->store_err, 0, "store_err");
 	ASSERT_EQ(have->hash, want->rx_hash, "hash");
 	ASSERT_EQ(have->l4_hash, !!(want->rx_hash_type & XDP_RSS_TYPE_L4),
@@ -208,6 +207,24 @@ static void check_have(struct test_xdp_skb_ext *skel)
 		  "csum_level");
 }
 
+static void check_loaded(struct test_xdp_skb_ext *skel)
+{
+	const struct xdp_skb_ext_vals *want = &skel->bss->want;
+	const struct xdp_skb_ext_vals *loaded = &skel->bss->loaded;
+
+	ASSERT_EQ(skel->bss->load_err, 0, "load_err");
+	ASSERT_EQ(loaded->fields, want->fields, "loaded_fields");
+	ASSERT_EQ(loaded->rx_hash, want->rx_hash, "loaded_rx_hash");
+	ASSERT_EQ(loaded->rx_hash_type, want->rx_hash_type,
+		  "loaded_rx_hash_type");
+	ASSERT_EQ(loaded->rx_vlan_proto, want->rx_vlan_proto,
+		  "loaded_rx_vlan_proto");
+	ASSERT_EQ(loaded->rx_vlan_tci, want->rx_vlan_tci,
+		  "loaded_rx_vlan_tci");
+	ASSERT_EQ(loaded->ip_summed, want->ip_summed, "loaded_ip_summed");
+	ASSERT_EQ(loaded->csum_level, want->csum_level, "loaded_csum_level");
+}
+
 static void test_frames(struct test_xdp_skb_ext *skel, const char *path,
 			enum xdp_skb_ext_deliver deliver, int ifindex)
 {
@@ -232,9 +249,12 @@ static void test_frames(struct test_xdp_skb_ext *skel, const char *path,
 		if (!test__start_subtest(name))
 			continue;
 		set_case(skel, &skb_ext_cases[i]);
-		if (ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &opts),
-			      "test_run"))
-			check_have(skel);
+		if (!ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &opts),
+			       "test_run") ||
+		    !wait_pkt(skel))
+			continue;
+		check_have(skel);
+		check_loaded(skel);
 	}
 }
 
@@ -266,6 +286,7 @@ static void test_veth_skb(struct test_xdp_skb_ext *skel, struct bpf_link *link,
 		goto out;
 	if (deliver == DELIVER_CPUMAP) {
 		check_have(skel);
+		check_loaded(skel);
 		goto out;
 	}
 	ASSERT_EQ(skel->bss->store_err, 0, "store_err");
@@ -275,6 +296,7 @@ static void test_veth_skb(struct test_xdp_skb_ext *skel, struct bpf_link *link,
 	ASSERT_EQ(have->vlan_tci, 0, "vlan_tci");
 	ASSERT_EQ(have->ip_summed, CHECKSUM_NONE, "ip_summed");
 	ASSERT_EQ(have->csum_level, 0, "csum_level");
+	check_loaded(skel);
 out:
 	close(sock);
 }
@@ -292,7 +314,6 @@ void test_xdp_skb_ext_to_skb(void)
 {
 	struct bpf_cpumap_val val = { .qsize = 192 };
 	int ifindex_src, ifindex_dst, tc_prog_fd;
-	struct xdp_dummy *skel_dummy = NULL;
 	struct test_xdp_skb_ext *skel = NULL;
 	struct bpf_link *link = NULL;
 	struct netns_obj *ns = NULL;
@@ -330,18 +351,13 @@ void test_xdp_skb_ext_to_skb(void)
 	    tc_prog_attach("veth_dst", tc_prog_fd, -1))
 		goto out;
 
+	val.bpf_prog.fd = bpf_program__fd(skel->progs.cpumap_load);
 	if (!ASSERT_OK(bpf_map_update_elem(bpf_map__fd(skel->maps.cpu_map),
 					   &key, &val, 0), "add cpumap entry"))
 		goto out;
 
-	skel_dummy = xdp_dummy__open_and_load();
-	if (!ASSERT_OK_PTR(skel_dummy, "xdp_dummy__open_and_load"))
-		goto out;
-
-	/* veth_dst takes xdp_frames only with an XDP program */
-	link = bpf_program__attach_xdp(skel_dummy->progs.xdp_dummy_prog,
-				       ifindex_dst);
-	if (!ASSERT_OK_PTR(link, "attach xdp_dummy"))
+	link = bpf_program__attach_xdp(skel->progs.veth_load, ifindex_dst);
+	if (!ASSERT_OK_PTR(link, "attach veth_load"))
 		goto out;
 
 	test_frames(skel, "pass", DELIVER_PASS, ifindex_src);
@@ -354,7 +370,6 @@ void test_xdp_skb_ext_to_skb(void)
 
 out:
 	bpf_link__destroy(link);
-	xdp_dummy__destroy(skel_dummy);
 	test_xdp_skb_ext__destroy(skel);
 	netns_free(ns);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c b/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
index a63206ff993d..34db1a986f3b 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_skb_ext.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <vmlinux.h>
+#include <errno.h>
 #include "xdp_skb_ext.h"
 #include <bpf/bpf_endian.h>
 #include <bpf/bpf_helpers.h>
@@ -14,6 +15,8 @@ SEC("xdp")
 int live_frames(struct xdp_md *ctx)
 {
 	__u8 *mark = (void *)(long)ctx->data;
+	enum xdp_rss_hash_type rss_type;
+	__u32 hash;
 
 	if (mark + 1 > (__u8 *)(long)ctx->data_end)
 		return XDP_DROP;
@@ -25,6 +28,9 @@ int live_frames(struct xdp_md *ctx)
 			reused_ok++;
 			bpf_xdp_adjust_meta(ctx, MAX_META_LEN);
 		}
+		if (bpf_xdp_skb_ext_load_rx_hash(ctx, &hash, &rss_type) !=
+		    -ENODATA)
+			reused_bad++;
 	}
 	if (bpf_xdp_skb_ext_store_rx_hash(ctx, 1, XDP_RSS_TYPE_L4_IPV4_TCP) ||
 	    bpf_xdp_skb_ext_store_rx_vlan(ctx, bpf_htons(ETH_P_8021Q), 1) ||
@@ -51,7 +57,34 @@ enum xdp_skb_ext_deliver deliver;
 struct xdp_skb_ext_vals want;
 bool del_hash;
 struct xdp_skb_ext_have have;
-int pkts_seen_tc;
+struct xdp_skb_ext_vals loaded;
+int pkts_seen_tc, load_err;
+
+static void load_all(struct xdp_md *ctx)
+{
+	int err;
+
+	err = bpf_xdp_skb_ext_load_rx_hash(ctx, &loaded.rx_hash,
+					   &loaded.rx_hash_type);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_HASH;
+	else if (err != -ENODATA)
+		load_err++;
+
+	err = bpf_xdp_skb_ext_load_rx_vlan(ctx, &loaded.rx_vlan_proto,
+					   &loaded.rx_vlan_tci);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_VLAN;
+	else if (err != -ENODATA)
+		load_err++;
+
+	err = bpf_xdp_skb_ext_load_rx_csum(ctx, &loaded.ip_summed,
+					   &loaded.csum_level);
+	if (!err)
+		loaded.fields |= SKB_EXT_FIELD_CSUM;
+	else if (err != -ENODATA)
+		load_err++;
+}
 
 SEC("xdp")
 int xdp_store(struct xdp_md *ctx)
@@ -99,6 +132,21 @@ int xdp_store(struct xdp_md *ctx)
 		return bpf_redirect_map(&cpu_map, 0, 0);
 	if (deliver == DELIVER_VETH)
 		return bpf_redirect(ifindex_out, 0);
+	load_all(ctx);
+	return XDP_PASS;
+}
+
+SEC("xdp/cpumap")
+int cpumap_load(struct xdp_md *ctx)
+{
+	load_all(ctx);
+	return XDP_PASS;
+}
+
+SEC("xdp")
+int veth_load(struct xdp_md *ctx)
+{
+	load_all(ctx);
 	return XDP_PASS;
 }
 
diff --git a/tools/testing/selftests/bpf/xdp_skb_ext.h b/tools/testing/selftests/bpf/xdp_skb_ext.h
index 11feee2fa31c..64d4a0511d0a 100644
--- a/tools/testing/selftests/bpf/xdp_skb_ext.h
+++ b/tools/testing/selftests/bpf/xdp_skb_ext.h
@@ -30,7 +30,7 @@ enum xdp_skb_ext_deliver {
 	DELIVER_VETH,
 };
 
-/* The entries that the XDP program stores */
+/* The entries that the XDP programs store or load */
 struct xdp_skb_ext_vals {
 	__u32 rx_hash;
 	__u32 rx_hash_type;
-- 
2.56.0

