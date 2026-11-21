Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257448;
	b=hGyBJIE46A7hSkaRLDRYKEUo7plKt+C8qH53Tlnp4E6us1nvJhSCapjxu5anynY/W1ut
	 OplvEpwflm3Pklt2WW6AS5nf7lfSwmpfy6ygV5as09NPTVylfJBnsPu9QDoFPogBjXaNi
	 CWRVDRskxYlcO+Lk8UoXkY4QMyzoI5uajRjwZ2s/Y+rrnCZJnY+BanGVMyniQr30pIuwK
	 5XE5gwcEW4rfMxECttBbFCQkxK/uTaSxf7IISo10X191/7SnlFJiVRuMc7q0xNz+UurAS
	 KfrajmGWoFgfcaHMjEdYUY5T9DnYyULTjKlvfrt6Qvn6qx4vZ7AOuwGogNrFAbyEFug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257448;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vzL7OZ78FCJCA7+dBpZt/8Px2Lw+1L+aRqKuEWDIegk=;
	b=qIPOsmffvIjOcCfWgxO8lvR7BcHmo/6Y2Cri8eOLvGZpOF94uLuPEyuDTmbJ9CnFREEx
	 vM58A2Sgwy30M2B2K94LKQxB7FAbDls/PXINuiEeqCQS7SUFuw+00dinpvpcaPx45wCiJ
	 TrqlzwOOV0qI4HXkgVLN6WUE/n0r9BxYwXvyT9B9GMm7z1L3jDUWaOUWmFu3pUxhfxAHv
	 oFT1b4VoPhUjCVEsxDDOijuQHTuJhZl1SHZqcsgEZXideIT7FksweGKCz06u++7bzRSeP
	 hKvxGYtgWvxmc92pLGZY93OCDs3TppspxDqOEXHr3/FWwwfCTcWnvqPZutiS/WMS8DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="JgWu5E/k";
	arc=none smtp.remote-ip=91.218.175.59
Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF5606A331
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EF5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JgWu5E/k
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w0drH2z2Hn/mfe5505Dfkw+sLs+x0GacfO7VVM4vud4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257446; v=1; x=1795862246;
 b=JgWu5E/kaMnef7XHjxU+9ANa47PV67zYHfWXrdRdGyyXx4EYJKxK3BSrUL3p5fQi00RBp6Bh
 +fQ27JdBLY74h1G778GHZ5+hP0DtwkRSB7QnsJNY9IfwLKhLJ4/8Qx3RnaBEHzEn+faYr4ML0ty
 wWKg2UkG3YobylbhCTvJx4KQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44b387aced1257de;
	Sat, 21 Nov 2026 10:37:25 +0000
X-Mizu-Trace-ID: 44b387aced1257de
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 11/11] selftests/bpf: Add test for apply_bytes when a redirect sends a part
Date: Sat, 21 Nov 2026 18:30:12 +0800
Message-ID: <20261121103222.88209-12-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
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

An sk_msg prog parses the header of a message and applies its verdict
to the whole message with bpf_msg_apply_bytes(), so it runs once per
message, at the header:

  +-----+-----------+-----+-------+------
  | hdr |   body    | hdr | body  | ...
  +-----+-----------+-----+-------+------
  ^                 ^
  prog: apply(len1) prog: apply(len2)

The test sends one such message and redirects it to the egress of a
socket that has the smallest send buffer, whose peer has the smallest
receive buffer. The redirect sends only a part, so send() returns
early, and the test sends the rest:

  +-----+-----------+
  | hdr |   body    |
  +-----+-----------+
  |<-- send -->|
               |<-->| send again

Check that the prog ran once, at the header, and that the peer gets the
whole message.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 126 ++++++++++++++++++
 .../bpf/progs/test_sockmap_msg_apply.c        |  46 +++++++
 2 files changed, 172 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/test_sockmap_msg_apply.c

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index 1fef6ec2ba7ae..3979cbab7dc76 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -14,6 +14,7 @@
 #include "test_sockmap_drop_prog.skel.h"
 #include "test_sockmap_change_tail.skel.h"
 #include "test_sockmap_msg_pop_data.skel.h"
+#include "test_sockmap_msg_apply.skel.h"
 #include "bpf_iter_sockmap.skel.h"
 
 #include "sockmap_helpers.h"
@@ -1362,6 +1363,129 @@ static void test_sockmap_no_verdict_fionread(void)
 	test_sockmap_pass_prog__destroy(skel);
 }
 
+#define APPLY_MSG_MAGIC 0xbeefcafe
+
+/*
+ * One message: a header with its length, then the body. The sk_msg prog
+ * applies the verdict to the whole message and redirects it to the egress
+ * of b. b has the smallest send buffer and its peer the smallest receive
+ * buffer, so the first send() stops in the middle of the message. The rest
+ * must still go to b without another run of the prog.
+ */
+static void test_sockmap_msg_verdict_apply_partial(void)
+{
+	int a = -1, a_peer = -1, b = -1, b_peer = -1, s = -1;
+	struct test_sockmap_msg_apply *skel;
+	int err, map, one = 1, zero = 0;
+	struct sockaddr_storage addr;
+	size_t len, off = 0, got = 0;
+	char *buf = NULL, *rbuf = NULL;
+	int sndbuf, rcvbuf;
+	socklen_t optlen;
+	struct {
+		__u32 magic;
+		__u32 len;
+	} hdr;
+	ssize_t n;
+
+	skel = test_sockmap_msg_apply__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+	map = bpf_map__fd(skel->maps.sock_map);
+
+	err = bpf_prog_attach(bpf_program__fd(skel->progs.prog_msg_apply_redir),
+			      map, BPF_SK_MSG_VERDICT, 0);
+	if (!ASSERT_OK(err, "bpf_prog_attach"))
+		goto out;
+
+	err = create_pair(AF_INET, SOCK_STREAM, &a_peer, &a);
+	if (!ASSERT_OK(err, "create_pair"))
+		goto out;
+
+	/* The peer of b gets its receive buffer before the handshake */
+	s = socket_loopback(AF_INET, SOCK_STREAM);
+	if (!ASSERT_GE(s, 0, "socket_loopback"))
+		goto out_close;
+	if (xsetsockopt(s, SOL_SOCKET, SO_RCVBUF, &one, sizeof(one)))
+		goto out_close;
+	b = xsocket(AF_INET, SOCK_STREAM, 0);
+	if (b < 0)
+		goto out_close;
+	if (xsetsockopt(b, SOL_SOCKET, SO_SNDBUF, &one, sizeof(one)))
+		goto out_close;
+	optlen = sizeof(addr);
+	if (xgetsockname(s, sockaddr(&addr), &optlen))
+		goto out_close;
+	if (xconnect(b, sockaddr(&addr), optlen))
+		goto out_close;
+	b_peer = xaccept_nonblock(s, NULL, NULL);
+	if (b_peer < 0)
+		goto out_close;
+
+	optlen = sizeof(sndbuf);
+	if (xgetsockopt(b, SOL_SOCKET, SO_SNDBUF, &sndbuf, &optlen))
+		goto out_close;
+	optlen = sizeof(rcvbuf);
+	if (xgetsockopt(b_peer, SOL_SOCKET, SO_RCVBUF, &rcvbuf, &optlen))
+		goto out_close;
+	/* Larger than what b and its peer can hold */
+	len = 4 * (sndbuf + rcvbuf);
+
+	err = bpf_map_update_elem(map, &zero, &b, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(b)"))
+		goto out_close;
+	err = bpf_map_update_elem(map, &one, &a, BPF_NOEXIST);
+	if (!ASSERT_OK(err, "bpf_map_update_elem(a)"))
+		goto out_close;
+
+	buf = malloc(len);
+	rbuf = calloc(len, 1);
+	if (!ASSERT_OK_PTR(buf, "malloc") || !ASSERT_OK_PTR(rbuf, "calloc"))
+		goto out_close;
+	memset(buf, 0xaa, len);
+	hdr.magic = APPLY_MSG_MAGIC;
+	hdr.len = len;
+	memcpy(buf, &hdr, sizeof(hdr));
+
+	while (got < len) {
+		if (off < len) {
+			n = send(a, buf + off, len - off, MSG_DONTWAIT);
+			if (!ASSERT_TRUE(n >= 0 || errno == EAGAIN, "send"))
+				break;
+			if (n > 0) {
+				if (!off && !ASSERT_LT(n, len, "first send partial"))
+					break;
+				off += n;
+			} else {
+				usleep(1000);
+			}
+		}
+		while (got < off) {
+			n = recv_timeout(b_peer, rbuf + got, off - got, 0,
+					 IO_TIMEOUT_SEC);
+			if (!ASSERT_GT(n, 0, "recv_timeout"))
+				goto out_close;
+			got += n;
+		}
+	}
+
+	ASSERT_EQ(got, len, "received");
+	ASSERT_OK(memcmp(buf, rbuf, len), "data");
+	ASSERT_EQ(skel->bss->good_hdrs, 1, "prog runs on the header");
+	ASSERT_EQ(skel->bss->bad_hdrs, 0, "prog runs in the body");
+
+out_close:
+	free(buf);
+	free(rbuf);
+	close(s);
+	close(a);
+	close(a_peer);
+	close(b);
+	close(b_peer);
+out:
+	test_sockmap_msg_apply__destroy(skel);
+}
+
 void test_sockmap_basic(void)
 {
 	if (test__start_subtest("sockmap create_update_free"))
@@ -1438,4 +1562,6 @@ void test_sockmap_basic(void)
 		test_sockmap_multi_channels(SOCK_STREAM);
 	if (test__start_subtest("sockmap udp multi channels"))
 		test_sockmap_multi_channels(SOCK_DGRAM);
+	if (test__start_subtest("sockmap msg_verdict apply_bytes partial redirect"))
+		test_sockmap_msg_verdict_apply_partial();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_msg_apply.c b/tools/testing/selftests/bpf/progs/test_sockmap_msg_apply.c
new file mode 100644
index 0000000000000..6e24117933d03
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_sockmap_msg_apply.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+
+struct {
+	__uint(type, BPF_MAP_TYPE_SOCKMAP);
+	__uint(max_entries, 2);
+	__type(key, int);
+	__type(value, int);
+} sock_map SEC(".maps");
+
+#define MSG_MAGIC 0xbeefcafe
+
+struct msg_hdr {
+	__u32 magic;
+	__u32 len;
+};
+
+int good_hdrs;
+int bad_hdrs;
+
+/*
+ * Each message starts with a header. Apply the verdict to the whole
+ * message, so the prog runs again at the next header.
+ */
+SEC("sk_msg")
+int prog_msg_apply_redir(struct sk_msg_md *msg)
+{
+	struct msg_hdr *hdr;
+
+	if (bpf_msg_pull_data(msg, 0, sizeof(*hdr), 0))
+		goto bad;
+
+	hdr = msg->data;
+	if ((void *)(hdr + 1) > msg->data_end || hdr->magic != MSG_MAGIC)
+		goto bad;
+
+	good_hdrs++;
+	bpf_msg_apply_bytes(msg, hdr->len);
+	return bpf_msg_redirect_map(msg, &sock_map, 0, 0);
+bad:
+	bad_hdrs++;
+	return SK_DROP;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.43.0

