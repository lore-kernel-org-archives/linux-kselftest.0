Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022497;
	b=0i2bcc7Jzx54ULlcfpQVxRnLLRupWC7dwjqQ5qevQ1haKgTtm42B/Lkf3WSiYL367Pjt
	 i3yY9DbwbO2T9SX+TNn8f3z+FRSs+Ncg6XI1d5Cn6Ux9gIl8C6pQLMFDAa2Nmtepj5aYZ
	 XrH4xInW+U/ToK1+rIXlL8DmJUF5A+FZjgAkEish6oZgiDCvxCmNjLJw9Ss6IYuwJMH5O
	 l39cFqOeCYKF0f307fmgR07wqPQiTps969YnvuF/5oN9pwlnXOI2NIC7TzySIcQ7ypJKp
	 mh8VQjdepp7TmZcPdLzOkQivLSa8XORE45piqWGvV1psVFdzePhjYM0LaYwm0OPzq9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
	b=w+/n0Sm68RQT5+t0NuEB39DQgvh5D6XtTUdaZp0EQmZQBCLsrMAVvHEJ5VH4IbOdZq/K
	 YUF7Xy396O91VtbPMdJGhexlwlfklcyUPaxFZBxrHJ6sQ+4jiJBoexQGIvHDFP5rIRBSE
	 AsTuyR91awfdWmSp1dWMopo9F8uSqCPLUd2DxA2OP1rS8vhmFuzq5VnkFmi33YHJhWr7R
	 +GIMmqcPZjHLUM3BkX6ATgRuXR98LTp/++WiMXi/zL83eS4x1PZe/H+xH0SSTelCf7kOg
	 EBh+bEHcMfE4toowkzIQ+P1hHWfIM9GFgYWWuvOiRpOTHczRWIsxrvYdpSIX7i+QCow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CuGsq7jQ;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60885606A333
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60885606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=CuGsq7jQ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49b431f022so185592566b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022496; x=1794627296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
        b=CuGsq7jQiUwc8uwFzNw/ENZ6f2KjpuUGfKt+Ii/xdmbNtAYmRgsjFbRInOfPysbQUS
         yANdYNbxm3MDT0b8iGW7xxCOA1Kqu8ga8LgD0ARmCfHh33r5FVAaN6MOirGkBsBXpSOV
         mm+ZX2N24PTap4EXGvt97sQdlx+0kKtpBNVx5DBhVkK6KGxHKToFhOSUXTnxX3JwjblU
         eyDPWSCzZIgPdQ84KJWhWZxCOiUtZJ52kPwEQ1ti4gx9DC83S8phs+apvii2AtJkvazi
         vJsoS7aG9IQMc27oyvQX3/kf1KBEGX7428fQczrws3mrU0pqRcWpa3E6O2ty4rHoBCZK
         JpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022496; x=1794627296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFRJqIHH4Uu0/GgveZRmx8TIDB+Hixs9HbJY1cYzKxM=;
        b=o/PZoNie0vzesSfEHpovK2lSyUCHpGKwO/GJBsIHhx75YSwa/VMXehZfp1psuYc/7h
         c/6tKJfOd7U6JPBr/wA2UStE6SVrIIgy1PsV4SfZuli+g0PA2yx+154Usc4YbdkGkuEq
         mx8TCVoBGxd2ee4yKGFgHlOzUnDqAEsfzOBrNgZjd/WSiXtFT4OqGIc3AN0p53d8Ozx+
         mn+NLK0WjnWDQFu+oJSIwSW30MWmQeeUy2b2j/KeDW03Zkzo9CiiDt5ApvHkCHR5UBG4
         2RqKkPqvwyo8uDPDBuqA4zedQC5nnN+WrwP5n2HFn7S/VB/2qJaYVAx2FY+AoOrRPws7
         onsw==
X-Forwarded-Encrypted: i=1; AKwUvBzVLQZ9G6IPB5zxtk+22WKePefqOOeiLIvkAVEdsBXDX2oYF7c0Yte9qmoB2uRNhPgDJbC9+D1yA0zytB4x0pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kV9MVsTpx+dnUR7OYcoPlCuNok5ynp2u7lZRjh2Z/yHo4Z5s+
	Mi7gwN2dMbHIM5NefDdGobSN9AmCl2qeJZ9xuU4HoPBvbcPDSDb61E9fCOUfLSepBes=
X-Gm-Gg: AYBFou1rLWoQizxha33xkKbvmUwNMfTy++BJuIiSRb8fPUI00reZ7Yvy2MdHftv1ux/
	jyUwkTzzjf00cBDCbbskGiZyKn55QUnpw0NpGtu8ctkgc1wvAC+xzDnXEQUoicP5er+1FnAVyDv
	MGriKMxGVWogRxRtPKFwzSrBS7zK4AHL8Rdh50wi1p7Ap4fQpVfdOFz+EIEJqvmS1k/wxdo3v7X
	jdKowOeIrNSf9sT2p9lZKi31FCjXbPEQvPWN13uao3veQch7/p4vSKoWfOa6nH8eGtqxmZdCNO4
	8z+enJYxuR9A/oYQ29/QhPcQtGQDRrKSN8ipo5OBEu6pl60mIdfz8CJBc1sM3USmRAqnnC0cY1J
	egrrQjuukhB3wmRMv2LT9b1MKW9Sop7ODaLhNuB2BzhtgZKvo+zwTRhiIMh3gIsOCG1OzR5auQZ
	MZsPgvq66T8TDA23bh+l1nUew8mcfooYKoSEPdLergLMlqSuKqqoswCxz9UNlL0/crE/OuABPUn
	PIi6G9DOkaBTg/r63lIx43eIW2jbmUwnZGV+zArrCqsQuBery3OY7QvETUAfNKv42jpmmb2D9nW
	4SU145oU/35ftVzdP03ZBd0G7aXcLqonKe2PnlZXHM7a0kTG8lSgwt4Zm6Zsrbw=
X-Received: by 2002:a17:906:f58c:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c4d34cc020dmr370526966b.24.1794022495830;
        Fri, 06 Nov 2026 19:34:55 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:54 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 6/8] selftests: net: add flag to send a frame in xdp_helper
Date: Sat,  7 Nov 2026 03:34:25 +0000
Message-ID: <feab5dcef8743856ff1681f9a6ba62137d845c43.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

xdp_helper only binds an XDP socket and waits. Tests in selftests/net
have no way to send a frame through the AF_XDP TX path.

Add a -t option that takes one Ethernet frame in hex. With -t, the
helper also creates a TX ring and sends the frame. It then waits for
the frame on the completion ring and exits. It returns 1 if sendto()
fails or no completion arrives within one second. Without -t, nothing
changes.

The test passes the whole frame in hex, so xdp_helper does not need to
know about IP or UDP. veth has no AF_XDP zerocopy support, so the
socket runs in copy mode. In copy mode the kernel allocates an skb for
the frame in xsk_build_skb(), which uses the extra headroom.

xdp_helper now maps the completion ring at
XDP_UMEM_PGOFF_COMPLETION_RING (0x180000000). This offset does not fit
in a 32-bit off_t, so define _FILE_OFFSET_BITS to 64.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/lib/xdp_helper.c | 113 +++++++++++++++++--
 1 file changed, 106 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xdp_helper.c b/tools/testing/selftests/net/lib/xdp_helper.c
index eb025a9f35b1..5f4dec4408d9 100644
--- a/tools/testing/selftests/net/lib/xdp_helper.c
+++ b/tools/testing/selftests/net/lib/xdp_helper.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define _FILE_OFFSET_BITS 64
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -19,15 +20,91 @@
 
 static void print_usage(const char *bin)
 {
-	fprintf(stderr, "Usage: %s ifindex queue_id [-z]\n\n"
-		"where:\n\t-z: force zerocopy mode", bin);
+	fprintf(stderr, "Usage: %s ifindex queue_id [-z] [-t frame_hex]\n\n"
+		"where:\n\t-z: force zerocopy mode\n"
+		"\t-t: send one frame, given in hex, and exit\n", bin);
+}
+
+static int parse_frame(unsigned char *buf, const char *hex)
+{
+	size_t len = strlen(hex) / 2;
+	size_t i;
+
+	if (!len || len > 2048 || strlen(hex) % 2 ||
+	    strspn(hex, "0123456789abcdefABCDEF") != strlen(hex))
+		return -1;
+	for (i = 0; i < len; i++)
+		if (sscanf(hex + 2 * i, "%2hhx", &buf[i]) != 1)
+			return -1;
+	return len;
+}
+
+/* Send the frame at UMEM address 0 and wait until its descriptor shows up
+ * on the completion ring. In copy mode this happens when the skb is freed.
+ */
+static int send_frame(int sock_fd, __u32 len)
+{
+	struct xdp_mmap_offsets off;
+	socklen_t optlen = sizeof(off);
+	struct xdp_desc *desc;
+	size_t tx_sz, cq_sz;
+	char *tx, *cq;
+	int ret = 1;
+	int i;
+
+	if (getsockopt(sock_fd, SOL_XDP, XDP_MMAP_OFFSETS, &off, &optlen)) {
+		perror("getsockopt failed");
+		return 1;
+	}
+
+	tx_sz = off.tx.desc + NUM_DESC * sizeof(*desc);
+	tx = mmap(NULL, tx_sz, PROT_READ | PROT_WRITE, MAP_SHARED, sock_fd,
+		  XDP_PGOFF_TX_RING);
+	if (tx == MAP_FAILED) {
+		perror("TX ring mmap failed");
+		return 1;
+	}
+
+	cq_sz = off.cr.desc + NUM_DESC * sizeof(__u64);
+	cq = mmap(NULL, cq_sz, PROT_READ | PROT_WRITE, MAP_SHARED, sock_fd,
+		  XDP_UMEM_PGOFF_COMPLETION_RING);
+	if (cq == MAP_FAILED) {
+		perror("completion ring mmap failed");
+		goto out_tx;
+	}
+
+	desc = (struct xdp_desc *)(tx + off.tx.desc);
+	desc->addr = 0;
+	desc->len = len;
+	__atomic_store_n((__u32 *)(tx + off.tx.producer), 1, __ATOMIC_RELEASE);
+
+	if (sendto(sock_fd, NULL, 0, MSG_DONTWAIT, NULL, 0) < 0) {
+		perror("sendto failed");
+		goto out;
+	}
+
+	for (i = 0; i < 100; i++) {
+		usleep(10000);
+		if (__atomic_load_n((__u32 *)(cq + off.cr.producer),
+				    __ATOMIC_ACQUIRE)) {
+			ret = 0;
+			goto out;
+		}
+	}
+
+	fprintf(stderr, "no TX completion\n");
+out:
+	munmap(cq, cq_sz);
+out_tx:
+	munmap(tx, tx_sz);
+	return ret;
 }
 
 /* this is a simple helper program that creates an XDP socket and does the
  * minimum necessary to get bind() to succeed.
  *
- * this test program is not intended to actually process packets, but could be
- * extended in the future if that is actually needed.
+ * without -t it does not process packets. with -t it sends one frame
+ * through the TX ring and exits once the frame completes.
  *
  * it is used by queues.py to ensure the xsk netlinux attribute is set
  * correctly.
@@ -37,13 +114,16 @@ int main(int argc, char **argv)
 	struct xdp_umem_reg umem_reg = { 0 };
 	struct sockaddr_xdp sxdp = { 0 };
 	int num_desc = NUM_DESC;
+	int frame_len = 0;
 	void *umem_area;
 	int retry = 0;
 	int ifindex;
 	int sock_fd;
 	int queue;
+	int ret;
+	int i;
 
-	if (argc != 3 && argc != 4) {
+	if (argc < 3) {
 		print_usage(argv[0]);
 		return 1;
 	}
@@ -94,9 +174,21 @@ int main(int argc, char **argv)
 	sxdp.sxdp_queue_id = queue;
 	sxdp.sxdp_flags = 0;
 
-	if (argc > 3) {
-		if (!strcmp(argv[3], "-z")) {
+	for (i = 3; i < argc; i++) {
+		if (!strcmp(argv[i], "-z")) {
 			sxdp.sxdp_flags = XDP_ZEROCOPY;
+		} else if (!strcmp(argv[i], "-t") && i + 1 < argc &&
+			   !frame_len) {
+			frame_len = parse_frame(umem_area, argv[++i]);
+			if (frame_len < 0) {
+				print_usage(argv[0]);
+				return 1;
+			}
+			if (setsockopt(sock_fd, SOL_XDP, XDP_TX_RING, &num_desc,
+				       sizeof(num_desc))) {
+				perror("setsockopt XDP_TX_RING failed");
+				return 1;
+			}
 		} else {
 			print_usage(argv[0]);
 			return 1;
@@ -119,6 +211,13 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (frame_len) {
+		ret = send_frame(sock_fd, frame_len);
+		munmap(umem_area, UMEM_SZ);
+		close(sock_fd);
+		return ret;
+	}
+
 	ksft_ready();
 	ksft_wait();
 
-- 
2.56.0

