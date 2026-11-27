Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773723;
	b=fgZhF1c95hEdCGdOLdPIyoSZskcnxf2dbLfBmyoBqtUpmUOh86A9DiatTVZiKEW03U2i
	 CBZzOEENrZ1WU9nbZbCyXK/fs90Tp4fmi/IhQ6rzyUoWipOhSG01FSttPN5g44D8OmBk3
	 zssPZAevZvZ3Gu5RTeRIOFcqNOKMVYsDLMUMZcwKHdlKP05IzYerC1a7R8425hfVInArX
	 /VDwXVKkrkwEZZw1mRmkxPdYIg6goz6sk6xmLhwcW13Mm/DRTwkzOAD+kXina6aMlsEba
	 5blupupX1qQHLD7etR5jYg7Y0QlPys2YK/DnsSGZkTpKZOVRZYTSaLVybQKqeUwlo5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773723;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=/f+dIXrZDME1HzzTlAG04proZNX5+hxrBwLcvRGWskU=;
	b=OGyaWIu+bV1SQ/1Zw0uNPVorLjcGLZAv0LDwOkSmvuGnDMsvwJxa4eE3lRMQbEv5VLGm
	 Y/887Kda94d3rkcH/UOUY71YbeIScJqasF7ynVxEO46nz2QZjeotPjjKLxWEN5vC1UvJ9
	 w7ABktTXSAvlqW6jO294Sg3bChZSFvZxQGlri0VI9ElJ18PqUlTlkzBaJoC60xUoX5cpb
	 nJm1tRrKsRpJVR/6uuxTaAyQEPyK3vngWJiDt2jq5izru48kdR9Lrw7/bpO9uLfqG6XJ7
	 M+89CG0BgF+EMMZAKdWtsW9Hk+4DC5g5sq/0IEBYTTcKsAko6swkCnk/SNRr9Q0eHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=dvpxZnrM;
	arc=none smtp.remote-ip=217.74.67.75
Received: from smtpo75.interia.pl (smtpo75.interia.pl [217.74.67.75])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74671606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74671606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=dvpxZnrM
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Fri, 27 Nov 2026 11:01:57 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Dudu Lu <phx0fer@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Tianyi Gao <tianyi@cloudflare.com>,
	Octavian Purdila <tavip@google.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH net v9 6/6] selftests/bpf: Grow test_run and generic XDP frags after a test run
Date: Fri, 27 Nov 2026 11:01:32 +0100
Message-ID: <20261127100132.1977890-7-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127100132.1977890-1-sst@poczta.fm>
References: <20261127100132.1977890-1-sst@poczta.fm>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795773720; bh=/f+dIXrZDME1HzzTlAG04proZNX5+hxrBwLcvRGWskU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dvpxZnrMvl70aWoArprhjd2f5oBIu0n75QQMSFhBOZSFKAp/CBYsq2iy/zyLx1lkA
	 uEHXsNuYGd5fvggpTr4cKJi+svYKbWN7897eXzpt+Ih7AxjQ+b7JNmGKtzDjfQ+Rcx
	 wPV+7792xEC8j7PBV1sBAolRwstjzdaamM8x3cuA=

Add two xdp_adjust_tail subtests for frag_size of the rxq info a
program runs with:

- xdp_adjust_frags_tail_grow_ingress_ifindex grows the last frag of a
  9000 byte test_run packet with ingress_ifindex set to a veth device.
  test_run allocates PAGE_SIZE frags, so the grow must succeed.

- xdp_adjust_frags_tail_grow_lo_after_test_run does a test run, then
  sends a UDP packet a bit larger than a page over lo with a generic XDP
  frags program attached, or is skipped with 64K pages. Generic XDP
  copies the packet into a page_pool head page and a frag, which can be
  a part of a page, so growing the frag must fail with -EOPNOTSUPP. The
  program asks for more than any tailroom, so nothing is written even
  when the grow is allowed.

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 .../bpf/prog_tests/xdp_adjust_tail.c          | 137 ++++++++++++++++++
 .../test_xdp_adjust_frags_tail_grow_lo.c      |  25 ++++
 2 files changed, 162 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/test_xdp_adjust_frags_tail_grow_lo.c

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c b/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
index 43264347e7d7..c7c803fd9241 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <test_progs.h>
 #include <network_helpers.h>
+#include <linux/if_link.h>
+#include <net/if.h>
+#include "test_xdp_adjust_frags_tail_grow_lo.skel.h"
+#include "test_xdp_adjust_tail_grow.skel.h"
 
 static void test_xdp_adjust_tail_shrink(void)
 {
@@ -355,6 +359,135 @@ static void test_xdp_adjust_frags_tail_grow_64k(void)
 	bpf_object__close(obj);
 }
 
+/*
+ * test_run allocates PAGE_SIZE frags, so a program may grow the last one up
+ * to the end of its page, also when ingress_ifindex picks the rxq info of
+ * another device.
+ */
+static void test_xdp_adjust_frags_tail_grow_ingress_ifindex(void)
+{
+	struct xdp_md ctx = { .data_end = 9000 };
+	struct test_xdp_adjust_tail_grow *skel;
+	struct netns_obj *ns = NULL;
+	int err, ifindex, prog_fd;
+	__u8 *buf = NULL;
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		.ctx_in = &ctx,
+		.ctx_size_in = sizeof(ctx),
+	);
+
+	if (getpagesize() != 4096) {
+		test__skip();
+		return;
+	}
+
+	skel = test_xdp_adjust_tail_grow__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel open_and_load"))
+		return;
+
+	ns = netns_new("xdp_adjust_tail_ns", true);
+	if (!ASSERT_OK_PTR(ns, "netns_new"))
+		goto out;
+
+	SYS(out, "ip link add veth_xat0 type veth peer name veth_xat1");
+	ifindex = if_nametoindex("veth_xat0");
+	if (!ASSERT_GT(ifindex, 0, "veth ifindex"))
+		goto out;
+	ctx.ingress_ifindex = ifindex;
+
+	buf = malloc(16384);
+	if (!ASSERT_OK_PTR(buf, "alloc buf 16Kb"))
+		goto out;
+	memset(buf, 1, 16384);
+
+	/* Test case add 10 bytes to last frag */
+	topts.data_in = buf;
+	topts.data_out = buf;
+	topts.data_size_in = 9000;
+	topts.data_size_out = 16384;
+	prog_fd = bpf_program__fd(skel->progs._xdp_adjust_tail_grow);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+
+	ASSERT_OK(err, "9Kb+10b");
+	ASSERT_EQ(topts.retval, XDP_TX, "9Kb+10b retval");
+	ASSERT_EQ(topts.data_size_out, 9000 + 10, "9Kb+10b size");
+out:
+	free(buf);
+	netns_free(ns);
+	test_xdp_adjust_tail_grow__destroy(skel);
+}
+
+/*
+ * The frags generic XDP gets from skb_pp_cow_data() can be parts of a
+ * page_pool page, so its rxq info must not allow growing them. test_run
+ * must not change that for lo.
+ */
+static void test_xdp_adjust_frags_tail_grow_lo_after_test_run(void)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+		.sin_port = htons(9),
+	};
+	struct test_xdp_adjust_frags_tail_grow_lo *skel;
+	struct netns_obj *ns = NULL;
+	static char payload[60000];
+	int fd = -1, lo, i, len, prog_fd;
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		.data_in = &pkt_v4,
+		.data_size_in = sizeof(pkt_v4),
+		.repeat = 1,
+	);
+
+	/* larger than the head generic XDP copies the packet into */
+	len = getpagesize() + 500;
+	if (len > (int)sizeof(payload)) {
+		test__skip();
+		return;
+	}
+
+	skel = test_xdp_adjust_frags_tail_grow_lo__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel open_and_load"))
+		return;
+
+	ns = netns_new("xdp_adjust_tail_ns", true);
+	if (!ASSERT_OK_PTR(ns, "netns_new"))
+		goto out;
+
+	SYS(out, "ip link set dev lo up");
+	lo = if_nametoindex("lo");
+	if (!ASSERT_GT(lo, 0, "lo ifindex"))
+		goto out;
+
+	/* a test run in this netns, before generic XDP sees a packet on lo */
+	prog_fd = bpf_program__fd(skel->progs.xdp_grow_frags);
+	ASSERT_OK(bpf_prog_test_run_opts(prog_fd, &topts), "test_run");
+
+	if (!ASSERT_OK(bpf_xdp_attach(lo, prog_fd, XDP_FLAGS_SKB_MODE, NULL),
+		       "attach generic XDP"))
+		goto out;
+
+	/*
+	 * a linear skb with little headroom: generic XDP copies it into a
+	 * page_pool head page and a frag
+	 */
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (ASSERT_GE(fd, 0, "socket"))
+		ASSERT_EQ(sendto(fd, payload, len, 0, (struct sockaddr *)&addr,
+				 sizeof(addr)), len, "sendto");
+	for (i = 0; i < 100 && skel->data->grow_ret == 1; i++)
+		usleep(10000);
+	bpf_xdp_detach(lo, XDP_FLAGS_SKB_MODE, NULL);
+
+	if (ASSERT_TRUE(skel->data->grow_ret != 1, "xdp prog saw frags"))
+		ASSERT_EQ(skel->data->grow_ret, -EOPNOTSUPP, "grow frag on lo");
+out:
+	if (fd >= 0)
+		close(fd);
+	netns_free(ns);
+	test_xdp_adjust_frags_tail_grow_lo__destroy(skel);
+}
+
 void test_xdp_adjust_tail(void)
 {
 	int page_size = getpagesize();
@@ -373,4 +506,8 @@ void test_xdp_adjust_tail(void)
 		else
 			test_xdp_adjust_frags_tail_grow_4k();
 	}
+	if (test__start_subtest("xdp_adjust_frags_tail_grow_ingress_ifindex"))
+		test_xdp_adjust_frags_tail_grow_ingress_ifindex();
+	if (test__start_subtest("xdp_adjust_frags_tail_grow_lo_after_test_run"))
+		test_xdp_adjust_frags_tail_grow_lo_after_test_run();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_adjust_frags_tail_grow_lo.c b/tools/testing/selftests/bpf/progs/test_xdp_adjust_frags_tail_grow_lo.c
new file mode 100644
index 000000000000..207346b14ad8
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_xdp_adjust_frags_tail_grow_lo.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+/* 1 until the program saw a packet with frags */
+int grow_ret = 1;
+
+SEC("xdp.frags")
+int xdp_grow_frags(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+
+	if (grow_ret != 1 || bpf_xdp_get_buff_len(xdp) <= data_end - data)
+		return XDP_PASS;
+
+	/*
+	 * More than the tailroom of any frag, so nothing is written: the
+	 * result only tells if frag_size of the rxq allows a grow at all.
+	 */
+	grow_ret = bpf_xdp_adjust_tail(xdp, 0x10000);
+	return XDP_PASS;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.56.0

