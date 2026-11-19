Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095075;
	b=blqsCwKglQ6kAjb/7tV4NPtNke0O61dbnmhlzxRevjGKsssBbN9T9T39SkGbMoOuFhid
	 UnxY9Nb8PC9A44svgzLWb4Ypd2nydRqKBUdJ7izWykHNPKiJVZjQhkfbDWv6qvD0IsyB/
	 OaY7kVIPLfUFgUFvR3TP9QMz81ucr4IkrQ8I3HdFShDnc1CIdgRgw4Fx//1aPUVpt+SJq
	 rWf1XCr8VGQ0RbWqeqULubGznI6P/Pukw7WZ7YcHhkMVSpt2nKisZUTi+KKcscdkdD7Oy
	 1LQHIkl50FBq2P0X1apWkAOPzwpSz2OGBPjHA9CpfW8ikQTIWhvyC+jJiMMcVp4nmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095075;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=ek7NZSZk66IEwU0BTvcPsgNpxaCLENhsZm176O6DDyU=;
	b=f3XThv9raHo2Y3NDrdCb20IHrTSF7ALuWSLl2Lc+IUZgG4IUpHtucJXHN6CXuKqQN344
	 xkH7rx7dqUQBg2e83fcoTpbgGx9BNIsph5s9QNdfH2MQib7EdLcIxWgy1G2XioecF9olW
	 VEAnmzSgOphKc4gVzfuG7pltCRw4tpDpN/FpOCZNlL5vlRwv2wKlLSzFioHA33Ma+IRsg
	 GrdMJnEggkWvOrNyy2WC9LeGSyvCalj2jRSPHA1xKae5sL65bNzpF4U+pDjobBmN87osY
	 yC64bqds7VPBG359gwvnzK6d24mZ1Gm557B54gas8OLcQSTIUBUKeUifqyxmDP9yxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b="yQjV/pXu";
	arc=none smtp.remote-ip=217.74.67.75
Received: from smtpo75.interia.pl (smtpo75.interia.pl [217.74.67.75])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B160A260C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF9B160A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=yQjV/pXu
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 19 Nov 2026 14:31:09 +0100 (CET)
From: Slawomir Stepien <sst@poczta.fm>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Tianyi Gao <tianyi@cloudflare.com>,
	Octavian Purdila <tavip@google.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH v7 bpf 5/5] selftests/bpf: Shrink test_run frags after generic XDP ran on lo
Date: Thu, 19 Nov 2026 14:30:32 +0100
Message-ID: <20261119133032.2015656-6-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119133032.2015656-1-sst@poczta.fm>
References: <20261119133032.2015656-1-sst@poczta.fm>
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
	t=1795095072; bh=ek7NZSZk66IEwU0BTvcPsgNpxaCLENhsZm176O6DDyU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=yQjV/pXuU8HvAJ67XKahDyNu0UxnWZKUj0AmBXyw+8ifxEwFUjIKPkzycztwVaYGN
	 HhOgkZwdjbb6J8Lh4XCSAbl9UNl8ei6mIp2hL4IEZDWDnTgUQewAkQc7cBDzmEt3r2
	 riOZp2fpp/3a9i11AES5XMN7KD5z4Hh9k3q1a2OM=

bpf_prog_test_run_xdp() used the rxq info of the loopback device's
queue 0, and generic XDP sets the mem type of that rxq info for the
packets it handles. Run a packet through generic XDP on lo in a new
netns, then repeat xdp_adjust_frags_tail_shrink there, which frees
test_run frags from the program.

Without the test_run fix this hits WARN_ON() in page_pool_unref_netmem()
and leaks the frag pages; the test itself still passes, so the failure
shows up in the kernel log (and as a panic with panic_on_warn).

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 .../bpf/prog_tests/xdp_adjust_tail.c          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c b/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
index 43264347e7d7..c0d54cf421d8 100644
--- a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
+++ b/tools/testing/selftests/bpf/prog_tests/xdp_adjust_tail.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <test_progs.h>
 #include <network_helpers.h>
+#include <linux/if_link.h>
+#include <net/if.h>
+#include "xdp_dummy.skel.h"
 
 static void test_xdp_adjust_tail_shrink(void)
 {
@@ -355,6 +358,52 @@ static void test_xdp_adjust_frags_tail_grow_64k(void)
 	bpf_object__close(obj);
 }
 
+/* bpf_prog_test_run_xdp() runs on the rxq of lo's queue 0, where generic
+ * XDP sets the mem type of the frags it hands to its program. Let generic
+ * XDP see a packet on lo first, then free test_run frags from the program.
+ */
+static void test_xdp_adjust_frags_tail_shrink_after_generic(void)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
+		.sin_port = htons(9),
+	};
+	struct netns_obj *ns = NULL;
+	struct xdp_dummy *skel;
+	int fd = -1, lo;
+
+	skel = xdp_dummy__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "xdp_dummy__open_and_load"))
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
+	if (!ASSERT_OK(bpf_xdp_attach(lo, bpf_program__fd(skel->progs.xdp_dummy_prog),
+				      XDP_FLAGS_SKB_MODE, NULL), "attach generic XDP"))
+		goto out;
+
+	fd = socket(AF_INET, SOCK_DGRAM, 0);
+	if (ASSERT_GE(fd, 0, "socket"))
+		ASSERT_EQ(sendto(fd, "x", 1, 0, (struct sockaddr *)&addr, sizeof(addr)),
+			  1, "sendto");
+	bpf_xdp_detach(lo, XDP_FLAGS_SKB_MODE, NULL);
+
+	test_xdp_adjust_frags_tail_shrink();
+out:
+	if (fd >= 0)
+		close(fd);
+	netns_free(ns);
+	xdp_dummy__destroy(skel);
+}
+
 void test_xdp_adjust_tail(void)
 {
 	int page_size = getpagesize();
@@ -367,6 +416,8 @@ void test_xdp_adjust_tail(void)
 		test_xdp_adjust_tail_grow2();
 	if (test__start_subtest("xdp_adjust_frags_tail_shrink"))
 		test_xdp_adjust_frags_tail_shrink();
+	if (test__start_subtest("xdp_adjust_frags_tail_shrink_after_generic"))
+		test_xdp_adjust_frags_tail_shrink_after_generic();
 	if (test__start_subtest("xdp_adjust_frags_tail_grow")) {
 		if (page_size == 65536)
 			test_xdp_adjust_frags_tail_grow_64k();
-- 
2.56.0

