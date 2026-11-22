Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320875;
	b=J0g3MX4v5tnQWQ0Ka4p2KOh+optRaWRLvasXDFQOytuSij3hKJWW5mtCb7VZB+yf5VZ/
	 AuUH5HIpbb27dSVdqIUBwYkGJv24GhbeG76K5Gy2erSkmq+z6ezxDSN8z3Z+w4IEL7UzW
	 RTJ8RMilgVfXUSGqNkoJfvIzt6Xq1tD7JtLzMlSw3MD4zKq2r4wTSyRJ8l5mKpF17R/bw
	 u7vTcw0aVCWXtI4RY/rTmjnB/XTiLwvyjh7c6hvXvgf6ygIrqAYnYpNLxfBM25J16ao8c
	 UNg7HnnNeks7Jh8epB0K01iqm0C9VKQSXMZ1EJLEORnniXsMzmn7eCRxs9BmQaZIwNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320875;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lb38nMxOfAlLbtezAc3dRCaDpF4QbPhXFYzRnbMlPHM=;
	b=H4+/z+B+KOs8/aRihxsEFocGao8aKTy+z/Q4b6HGEE4AjngzAzCdyhqjSySGEoE6Dcrq
	 cDysFxMnghKmU89E/GXUzVJwV3Ozie0feZB+uWKzaVGemV2HhTYx3afFJoKLLuC5Td3DY
	 W+dDgDPpU36pVqzjV8OrHzFUR9L5X3NM2tgx6z24MQALh8YH5Mlf+Tb4X6qeXglZQ+UOh
	 oaKxYJHgx/MtDrVHpw3J/8+3dgt8fii2gWZuu4xOEWOnf+uZ8GIjYB5uJ+YYDQm+RnMKX
	 WFdrDOAH+6bd9XanihqjA2jVjQU/2s6HwizhYDU14HMwq4rp0GxKHJaMRZykzyO3huA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SQznjq0P;
	arc=none smtp.remote-ip=95.215.58.189
Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A2606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 04:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A1A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SQznjq0P
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JwIXtkgmQnvWYqCsXOrCGYCDMk1uEahCPH3Tnd+gNFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795320872; v=1; x=1795925672;
 b=SQznjq0PzjWacY5RI7IZkMLtQnykYNY8Tvxkbs3v6aYyOkRT1jWsxRVQ9cyGg4KgacMJPzkT
 DcCXJ0tUqRPByE3VDe86g6IJDnYIAfbYRYQEbXTE9FiR7wq5yHZNdQ7gRxaVoRhsn0PebYt746L
 j/VRHVpxmDZSqaR6/g4mBTPo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1dac3f365d5e8237;
	Sun, 22 Nov 2026 04:14:32 +0000
X-Mizu-Trace-ID: 1dac3f365d5e8237
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Junseo Lim <zirajs7@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	Yuqiang Sun <izaiahsun@gmail.com>,
	Peter Oskolkov <posk@google.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: test lwt_xmit reroute of an IPv4-in-IPv6 encap
Date: Sun, 22 Nov 2026 12:13:46 +0800
Message-ID: <20261122041401.189733-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122041401.189733-1-jiayuan.chen@linux.dev>
References: <20261122041401.189733-1-jiayuan.chen@linux.dev>
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

Add a test where an lwt_xmit prog pushes an IPv6 header with a ::
source on an IPv4 packet and reroutes. On an unfixed kernel this
dereferences inet6_sk() of the IPv4 socket and crashes; here reaching
the end is the pass.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../selftests/bpf/prog_tests/lwt_reroute.c    | 20 ++++++++++++++--
 .../selftests/bpf/progs/test_lwt_reroute.c    | 24 +++++++++++++++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/lwt_reroute.c b/tools/testing/selftests/bpf/prog_tests/lwt_reroute.c
index 6c50c0f63f43..01387c0f1b19 100644
--- a/tools/testing/selftests/bpf/prog_tests/lwt_reroute.c
+++ b/tools/testing/selftests/bpf/prog_tests/lwt_reroute.c
@@ -18,8 +18,8 @@
  *
  *    ip route add 10.0.0.0/24 encap bpf xmit <obj> sec "<section_N>" dev link_err
  *
- *  Here <obj> is statically defined to test_lwt_reroute.bpf.o, and it contains
- *  a single test program entry. This program sets packet mark by last byte of
+ *  Here <obj> is statically defined to test_lwt_reroute.bpf.o.
+ *  The lwt_xmit program sets packet mark by last byte of
  *  the IPv4 daddr. For example, a packet going to 1.2.3.4 will receive a skb
  *  mark 4. A packet will only be marked once, and IP x.x.x.0 will be skipped
  *  to avoid route loop. We didn't use generated BPF skeleton since the
@@ -42,6 +42,7 @@
  * --------------------------------
  *  1. Reroute to a running tun device
  *  2. Reroute to a device where qdisc drop
+ *  3. Reroute an IPv4 packet with a pushed IPv6 header
  *
  *  For case 1, ping packets should be received by the tun device.
  *
@@ -241,11 +242,26 @@ static void test_lwt_reroute_qdisc_dropped(void)
 		close(tun_fd);
 }
 
+static void test_lwt_reroute_push6(void)
+{
+	SYS(out, "ip link add link_err type dummy");
+	SYS(out, "ip link set lo up");
+	SYS(out, "ip addr add dev lo " LOCAL_SRC "/32");
+	SYS(out, "ip link set link_err up");
+	SYS(out, "ip route add %s dev link_err encap bpf xmit obj %s sec push6_zerosrc",
+	    TEST_CIDR, BPF_OBJECT);
+
+	ping_once("10.0.0.2");
+out:
+	return;
+}
+
 static void *test_lwt_reroute_run(void *arg)
 {
 	netns_delete();
 	RUN_TEST(lwt_reroute_normal_xmit);
 	RUN_TEST(lwt_reroute_qdisc_dropped);
+	RUN_TEST(lwt_reroute_push6);
 	return NULL;
 }
 
diff --git a/tools/testing/selftests/bpf/progs/test_lwt_reroute.c b/tools/testing/selftests/bpf/progs/test_lwt_reroute.c
index 1dc64351929c..c969962926e6 100644
--- a/tools/testing/selftests/bpf/progs/test_lwt_reroute.c
+++ b/tools/testing/selftests/bpf/progs/test_lwt_reroute.c
@@ -4,7 +4,9 @@
 #include <bpf/bpf_endian.h>
 #include <bpf/bpf_helpers.h>
 #include <linux/if_ether.h>
+#include <linux/in.h>
 #include <linux/ip.h>
+#include <linux/ipv6.h>
 
 /* This function extracts the last byte of the daddr, and uses it
  * as output dev index.
@@ -33,4 +35,26 @@ int test_lwt_reroute(struct __sk_buff *skb)
 	return BPF_LWT_REROUTE;
 }
 
+SEC("push6_zerosrc")
+int test_lwt_reroute_push6(struct __sk_buff *skb)
+{
+	struct ipv6hdr h = {};
+
+	h.version = 6;
+	h.payload_len = bpf_htons(skb->len);
+	h.nexthdr = IPPROTO_IPIP;
+	h.hop_limit = 64;
+	/* 2001:db8::3, a fake address */
+	h.daddr.s6_addr[0] = 0x20;
+	h.daddr.s6_addr[1] = 0x01;
+	h.daddr.s6_addr[2] = 0x0d;
+	h.daddr.s6_addr[3] = 0xb8;
+	h.daddr.s6_addr[15] = 0x03;
+
+	if (bpf_lwt_push_encap(skb, BPF_LWT_ENCAP_IP, &h, sizeof(h)))
+		return BPF_DROP;
+
+	return BPF_LWT_REROUTE;
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.43.0

