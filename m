Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C62408629
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874650; cv=none; b=KwY//LhyXf49B8gZ3U8cw9vdAUIoi7/dCS59I1kWkGvLytdYDgsOnmUNV+OUvS2yvnJKx/AfgNyixjdKasWoCBNqtgITMmNLRBXnDo9ixVdIeo65BPk2CQi3TyTgqMKR2Ctrk6OKgosbeHYiv8tk/8DJrHiPHDCuI6lCHfWo9Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874650; c=relaxed/simple;
	bh=Fw9dsfELz78BA8ipIlfO3EHgK0DKWN+NWCxKnscNcYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/Kpw6dd+SeeUiOR1VTN7CsPffimTDONseSzRbAC9sFlmUSCSR+UcOx/lxthP6huyL6CnKcynOWv32NV+lA5OcPKLgu3wxy7Bvqx19GPd+xW1tLe3S7F4RhrfuKkGdaopBa/SC0TGtnO+nJsae0tOTQWBn4lCT0ar9VyRdZXsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=FNutL7he; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="FNutL7he"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49cfcf2548aso27309955e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790874641; x=1791479441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGm7IC7PEFYqvBb16na7BG1gbnvFypBDABToiBBYHKQ=;
        b=FNutL7heJ7dFJzR/PFWMfe0zlkLx2GF/qoSwf1bIMsEyPLjfaDXvuMnsvXn0lbzet1
         dnfScenlPelNc/T0PFj2vutN0VwLsQAw9/M0bfO+QcykgGHzS7T5V5XLt0DCp5zt/vI4
         yhnM1xHifmF6DIcqhxcK6P0iVZ0Fd/7PAMNgdDiHeZx5Lmslmucgm12iXelaxqnhpALO
         S3+Jk5afgHonZc1XuMqUdv6gn9AIYm6sRnE9/NiszVQIF2SRoeTW9vnSsGJkOvw0NHin
         JNBhsJxKia7WztodBmujNYFclsn1uEVq33jfeyYYU1sNzoBfnCLbjmB4UxncYaSiE12a
         VfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874641; x=1791479441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGm7IC7PEFYqvBb16na7BG1gbnvFypBDABToiBBYHKQ=;
        b=KZ/kGjojMQnTXFnKssZKAfhjq0xGcB2AViYxE2Qu0XrxsW+52j2aNOPUS7EPHFXNVb
         /Sxs3Z9QEbTgL+1QGlo/kAs5GckRVkdKlsDYBV6KCET70ViaihwfmLTiAWQCl49ojZjG
         4kyYcMbBYYVygSR59/XvEn0QIyUa7Ca0JubojxJBvCYVgF0GJ+ReTasIgFgoOwYK4ZnJ
         G3ntlKlnDgLOT12Dc023vLE9srgltYbrRcnpwCdONzxRex8b0E9wnzQAcZ3+mc6zIAKX
         fYtS8SI9nw6SEqus1zbQrtkhTi0Wd915Ldgj1ltsduLt03kScJLb3mXvwH51G0w2Hg3a
         kHNg==
X-Forwarded-Encrypted: i=1; AKwUvBx5ryHteaDwoM/y+vCRAKz8OJKiEY5/AMbkM7RgJjwRoo3ceOwFC72H6R90ANrc+P+isUlt0WTsnykYNRqQx3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l2mU3v1GAZatkFoCtCQeTWBA2aXtXBMI/iiyXfxPKy51QbeqXk
	wbOsq2U2SE6CbqzJXXYJj3jxiJI9gd2oq7JGqWYlC8Avaa3iT7CvwL+PgH2QugppvdA=
X-Gm-Gg: AYBFou1w4Ui8CNUgio4oDsZsM945S+MzpmPGsFX4JGXmqfXPQmGPBmhDNiRLPiZVhBb
	V6OVXaeqxpEBljbrX5q5g4OaoOxAiRRjI7HO3i1PaNNeXPbftiCk1Rj/t6c/0gDIwEKeyWVq0f8
	JMg+W3WITx7hVjzAEcUYPQHYG1FAPIFIFDUgKdgIeV0+1RUi1Tzv91madX+I92Mhxf3HxPTSj/t
	Fh/pr9zPI+BZXJQk/S0JjlmAOuyaGQEHbJ6dHK/856o/HXPPMM/sGqW8ez/YTYJCvOXRIvNxSjl
	7N/nboZ8i5SenEjvBdmdRcjFKZntfc+98tibYL4bsMwirjBAOKMfzXWMVinwLG0NL0v0/LSUlcw
	mLoe8rrW87JJDg7vDiR/2Ktx1xy/Zd6zBAFowWjp0Hl/FijLv0s0WwLt4Z8m532aDTY6unHN69m
	1e6ZNskO/V9+heTOOFkkpEYTzfnKDysrKtf3nsGxxbPg7zBz6IQs2+rpMyzdGqGni5mhcfwXN+a
	VRaU6mXmaidyQjcx2bSBeFDWQQXNxLMAxr7MnEE2eSgr/vyjTEsHoVLkq2K7wzch/11xt9FYw1q
	sErdWQ==
X-Received: by 2002:a05:600c:3510:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a02756729dmr5277165e9.9.1790874641017;
        Thu, 01 Oct 2026 10:10:41 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0278fb6f1sm2496985e9.9.2026.10.01.10.10.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 10:10:40 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: net: add an amt test for UDP_SEGMENT through the relay
Date: Thu,  1 Oct 2026 20:10:16 +0300
Message-ID: <20261001171016.88208-3-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261001171016.88208-1-omar@blockcast.net>
References: <20261001171016.88208-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add amt_gso.sh, which sends a UDP_SEGMENT burst from a local sender on
the relay to a listener behind a gateway, for IPv4 and IPv6, and checks
that every segment arrives with the right length and payload.

With the default features of the amt device, the core segments the burst
before amt_dev_xmit(), so that case is the control for the harness. With
"ethtool -K amtr tx on" the GSO skb reaches the driver unsegmented.
A capture on amtr, which sees what is handed to the driver, is used to
show that, and the case is reported as skipped if no frame larger than
the MTU reached amt_dev_xmit(). A capture on the gateway side of the
link checks that the AMT messages on the wire are not larger than the
MTU, that there is one for each segment, and that the gateway has not
counted checksum errors. The tx_dropped counter of the relay's egress
device must not move. Plain, non-GSO datagrams with tx on are sent as
well.

The relay's egress device has tx offload switched off so that the outer
segmentation and checksum are done in software and the result does not
depend on what the veth passes through.

amt_gso is a small helper because none of the existing tools can send
UDP_SEGMENT to a multicast group through a chosen interface and also
check payloads. It sends, receives and captures.

Without the previous patch the two cases with tx on and a UDP_SEGMENT
burst fail (the burst is dropped on the relay's egress device); the
control and the plain datagram cases pass. With it, all six pass. That
was the result in each of 11 runs per kernel.

About the stability of the test itself: an earlier version failed
intermittently, in about 3 of 25 full runs. The listener's interface
counted the packets but the receiver reported none, in a control case or
a tx-on case. I think the receiver's idle timer expired before the
sender started on a loaded guest, because the receiver had already
exited when the counters rose, but I only inferred that from the
counters. The receiver now waits up to 15 seconds for the first
datagram, and the final version has no warm-up traffic and no fixed
sleeps: the captures are drained after SIGTERM, once the receiver is
done. The final version was run 22 times (11 per kernel) in a 4-vCPU KVM
guest, two guests at a time on a busy host, with the expected result
each time. That is a small sample, so occasional flakiness cannot be
excluded, and it has not been run under a stock kselftest runner or on
another machine. The remaining waits are timeouts: 3 s idle, 15 s for
the first datagram, 5 s for each helper's READY line.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 473 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 269 ++++++++++++++
 4 files changed, 745 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index c9f46031a..0f11d58a8 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+amt_gso
 bind_bhash
 bind_timewait
 bind_wildcard
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index d4ca82fec..b90a9a382 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_gso.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
 	bareudp.sh \
@@ -143,6 +144,7 @@ TEST_PROGS_EXTENDED := \
 # end of TEST_PROGS_EXTENDED
 
 TEST_GEN_FILES := \
+	amt_gso \
 	bind_bhash \
 	cmsg_sender \
 	fin_ack_lat \
diff --git a/tools/testing/selftests/net/amt_gso.c b/tools/testing/selftests/net/amt_gso.c
new file mode 100644
index 000000000..96c002e58
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gso.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helper for amt_gso.sh.
+ *
+ * send:  send datagrams to a multicast group, optionally as one UDP_SEGMENT
+ *        burst per datagram, with a self-describing payload pattern.
+ * recv:  receive datagrams on a UDP port and check count, length and payload
+ *        of every one of them against the pattern used by "send".
+ * sniff: capture on an interface with AF_PACKET and report how large the
+ *        frames handed to the device were.
+ *
+ * Every datagram consists of "chunks" cnt chunks of seg bytes followed by an
+ * optional tail chunk of tail bytes. A chunk starts with a struct chunk_hdr and
+ * the rest of it is a function of (datagram number, chunk number, offset).
+ * With UDP_SEGMENT set to seg, every chunk is one segment on the wire.
+ */
+#define _GNU_SOURCE
+#include <arpa/inet.h>
+#include <errno.h>
+#include <linux/if_packet.h>
+#include <linux/if_ether.h>
+#include <net/if.h>
+#include <netinet/in.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <time.h>
+#include <unistd.h>
+
+#ifndef UDP_SEGMENT
+#define UDP_SEGMENT	103
+#endif
+#ifndef SOL_UDP
+#define SOL_UDP		17
+#endif
+
+#define MAX_DGRAM	65507
+#define AMT_MSG_MCAST_DATA	6
+#define AMT_UDP_PORT_HDR	8
+
+struct chunk_hdr {
+	uint32_t seq;
+	uint16_t idx;
+	uint16_t len;
+};
+
+struct cfg {
+	bool ipv6;
+	bool gso;
+	bool ignore_out;	/* sniff: skip frames sent by this host */
+	bool only_out;		/* sniff: skip frames received */
+	bool amt;		/* sniff: count AMT multicast data messages */
+	const char *ifname;
+	const char *group;
+	const char *bind_addr;
+	unsigned int port;
+	unsigned int seg;
+	unsigned int cnt;
+	unsigned int tail;
+	unsigned int num;
+	unsigned int delay_us;
+	unsigned int idle;
+	unsigned int grace;	/* recv: extra wait for the first datagram */
+	unsigned int mtu;
+};
+
+static void die(const char *what)
+{
+	fprintf(stderr, "amt_gso: %s: %s\n", what, strerror(errno));
+	exit(2);
+}
+
+static uint8_t fill_byte(uint32_t seq, unsigned int idx, unsigned int off)
+{
+	return (uint8_t)(seq * 131 + idx * 17 + off * 7 + (off >> 8));
+}
+
+static unsigned int chunk_len(const struct cfg *c, unsigned int idx)
+{
+	return idx < c->cnt ? c->seg : c->tail;
+}
+
+static unsigned int chunks_per_dgram(const struct cfg *c)
+{
+	return c->cnt + (c->tail ? 1 : 0);
+}
+
+static void fill_dgram(const struct cfg *c, uint32_t seq, uint8_t *buf)
+{
+	unsigned int i, off, n = chunks_per_dgram(c);
+
+	for (i = 0; i < n; i++) {
+		unsigned int len = chunk_len(c, i);
+		struct chunk_hdr h = { .seq = seq, .idx = i, .len = len };
+
+		memcpy(buf, &h, sizeof(h));
+		for (off = sizeof(h); off < len; off++)
+			buf[off] = fill_byte(seq, i, off);
+		buf += len;
+	}
+}
+
+static int open_udp(const struct cfg *c)
+{
+	int fd = socket(c->ipv6 ? AF_INET6 : AF_INET, SOCK_DGRAM, 0);
+
+	if (fd < 0)
+		die("socket");
+	return fd;
+}
+
+static void fill_addr(const struct cfg *c, const char *str, unsigned int port,
+		      struct sockaddr_storage *ss, socklen_t *len)
+{
+	memset(ss, 0, sizeof(*ss));
+	if (c->ipv6) {
+		struct sockaddr_in6 *a = (void *)ss;
+
+		a->sin6_family = AF_INET6;
+		a->sin6_port = htons(port);
+		if (inet_pton(AF_INET6, str, &a->sin6_addr) != 1)
+			die("inet_pton");
+		*len = sizeof(*a);
+	} else {
+		struct sockaddr_in *a = (void *)ss;
+
+		a->sin_family = AF_INET;
+		a->sin_port = htons(port);
+		if (inet_pton(AF_INET, str, &a->sin_addr) != 1)
+			die("inet_pton");
+		*len = sizeof(*a);
+	}
+}
+
+static int do_send(const struct cfg *c)
+{
+	static uint8_t buf[MAX_DGRAM];
+	struct sockaddr_storage dst, src;
+	socklen_t dlen, slen;
+	unsigned int total, ifindex, i;
+	int fd, ttl = 8, zero = 0;
+
+	total = c->cnt * c->seg + c->tail;
+	if (total > MAX_DGRAM || (c->tail && c->tail < sizeof(struct chunk_hdr)) ||
+	    c->seg < sizeof(struct chunk_hdr)) {
+		fprintf(stderr, "amt_gso: bad sizes\n");
+		return 2;
+	}
+	ifindex = if_nametoindex(c->ifname);
+	if (!ifindex)
+		die("if_nametoindex");
+
+	fd = open_udp(c);
+	if (c->bind_addr) {
+		fill_addr(c, c->bind_addr, 0, &src, &slen);
+		if (bind(fd, (void *)&src, slen))
+			die("bind");
+	}
+	if (c->ipv6) {
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_IF, &ifindex,
+			       sizeof(ifindex)))
+			die("IPV6_MULTICAST_IF");
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, &ttl,
+			       sizeof(ttl)))
+			die("IPV6_MULTICAST_HOPS");
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_LOOP, &zero,
+			       sizeof(zero)))
+			die("IPV6_MULTICAST_LOOP");
+	} else {
+		struct ip_mreqn mr = { .imr_ifindex = ifindex };
+
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF, &mr, sizeof(mr)))
+			die("IP_MULTICAST_IF");
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_TTL, &ttl,
+			       sizeof(ttl)))
+			die("IP_MULTICAST_TTL");
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP, &zero,
+			       sizeof(zero)))
+			die("IP_MULTICAST_LOOP");
+	}
+	if (c->gso) {
+		int gso = c->seg;
+
+		if (setsockopt(fd, SOL_UDP, UDP_SEGMENT, &gso, sizeof(gso)))
+			die("UDP_SEGMENT");
+	}
+	fill_addr(c, c->group, c->port, &dst, &dlen);
+
+	for (i = 0; i < c->num; i++) {
+		fill_dgram(c, i, buf);
+		if (sendto(fd, buf, total, 0, (void *)&dst, dlen) != (ssize_t)total)
+			die("sendto");
+		if (c->delay_us)
+			usleep(c->delay_us);
+	}
+	close(fd);
+	printf("SENT datagrams=%u bytes_each=%u gso=%d\n", c->num, total, c->gso);
+	return 0;
+}
+
+static int do_recv(const struct cfg *c)
+{
+	unsigned int per = chunks_per_dgram(c), expected = c->num * per;
+	unsigned int good = 0, bad_len = 0, bad_payload = 0, dup = 0, unk = 0;
+	static uint8_t buf[MAX_DGRAM + 1];
+	struct sockaddr_storage any;
+	socklen_t alen;
+	uint8_t *seen;
+	int fd, rcvbuf = 8 << 20, idle_ms = 0;
+	bool got_any = false;
+
+	seen = calloc(expected ? expected : 1, 1);
+	if (!seen)
+		die("calloc");
+	fd = open_udp(c);
+	setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
+	fill_addr(c, c->ipv6 ? "::" : "0.0.0.0", c->port, &any, &alen);
+	if (bind(fd, (void *)&any, alen))
+		die("bind");
+	printf("READY\n");
+	fflush(stdout);
+
+	while (good < expected) {
+		struct pollfd pfd = { .fd = fd, .events = POLLIN };
+		struct chunk_hdr h;
+		unsigned int off;
+		ssize_t n;
+		int r = poll(&pfd, 1, 100);
+
+		if (r < 0)
+			die("poll");
+		if (!r) {
+			idle_ms += 100;
+			if (idle_ms >= (int)(c->idle + (got_any ? 0 : c->grace)) * 1000)
+				break;
+			continue;
+		}
+		idle_ms = 0;
+		got_any = true;
+		n = recv(fd, buf, sizeof(buf), 0);
+		if (n < 0)
+			die("recv");
+		if (n < (ssize_t)sizeof(h)) {
+			bad_len++;
+			continue;
+		}
+		memcpy(&h, buf, sizeof(h));
+		if (h.seq >= c->num || h.idx >= per) {
+			unk++;
+			continue;
+		}
+		if ((unsigned int)n != chunk_len(c, h.idx) || h.len != n) {
+			bad_len++;
+			continue;
+		}
+		for (off = sizeof(h); off < (unsigned int)n; off++)
+			if (buf[off] != fill_byte(h.seq, h.idx, off))
+				break;
+		if (off != (unsigned int)n) {
+			bad_payload++;
+			continue;
+		}
+		if (seen[h.seq * per + h.idx]++) {
+			dup++;
+			continue;
+		}
+		good++;
+	}
+	printf("RECV expected=%u good=%u bad_len=%u bad_payload=%u dup=%u unknown=%u\n",
+	       expected, good, bad_len, bad_payload, dup, unk);
+	free(seen);
+	return good == expected && !bad_len && !bad_payload && !dup && !unk ? 0 : 1;
+}
+
+static int sniff_stop;
+
+static void sniff_sig(int sig)
+{
+	__atomic_store_n(&sniff_stop, 1, __ATOMIC_RELAXED);
+}
+
+static int do_sniff(const struct cfg *c)
+{
+	static uint8_t buf[MAX_DGRAM + 256];
+	unsigned int n = 0, max_len = 0, over = 0, amt = 0;
+	struct sockaddr_ll sll = { .sll_family = AF_PACKET };
+	struct timespec t0, last, now;
+	struct tpacket_stats st = { 0 };
+	socklen_t stlen = sizeof(st);
+	int fd, rcvbuf = 32 << 20;
+
+	fd = socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_ALL));
+	if (fd < 0)
+		die("socket(AF_PACKET)");
+	sll.sll_protocol = htons(ETH_P_ALL);
+	sll.sll_ifindex = if_nametoindex(c->ifname);
+	if (!sll.sll_ifindex)
+		die("if_nametoindex");
+	if (bind(fd, (void *)&sll, sizeof(sll)))
+		die("bind(AF_PACKET)");
+	/* Do not lose frames to a full receive queue: the verdict counts them */
+	if (setsockopt(fd, SOL_SOCKET, SO_RCVBUFFORCE, &rcvbuf, sizeof(rcvbuf)))
+		setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
+	signal(SIGTERM, sniff_sig);
+	printf("READY\n");
+	fflush(stdout);
+	clock_gettime(CLOCK_MONOTONIC, &t0);
+	last = t0;
+
+	for (;;) {
+		/* Once asked to stop, read what is still queued, then report */
+		int stopping = __atomic_load_n(&sniff_stop, __ATOMIC_RELAXED);
+		struct pollfd pfd = { .fd = fd, .events = POLLIN };
+		struct sockaddr_ll from;
+		socklen_t flen = sizeof(from);
+		unsigned int hl, dport;
+		const uint8_t *p = buf;
+		ssize_t len, got;
+		int r;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if (!stopping && (now.tv_sec - t0.tv_sec > 120 ||
+				  now.tv_sec - last.tv_sec >= (long)c->idle))
+			break;
+		r = poll(&pfd, 1, stopping ? 0 : 100);
+		if (r < 0 && errno == EINTR)
+			continue;
+		if (r < 0)
+			die("poll");
+		if (!r) {
+			if (stopping)
+				break;
+			continue;
+		}
+		got = recvfrom(fd, buf, sizeof(buf), MSG_TRUNC,
+			       (void *)&from, &flen);
+		if (got < 0)
+			die("recvfrom");
+		len = got;
+		if (from.sll_pkttype == PACKET_OUTGOING ? c->ignore_out : c->only_out)
+			continue;
+		if (got > (ssize_t)sizeof(buf))
+			got = sizeof(buf);
+
+		if (ntohs(from.sll_protocol) == ETH_P_IP && got >= 28 &&
+		    (p[0] >> 4) == 4 && p[9] == IPPROTO_UDP) {
+			hl = (p[0] & 0xf) * 4;
+		} else if (ntohs(from.sll_protocol) == ETH_P_IPV6 && got >= 48 &&
+			   (p[0] >> 4) == 6 && p[6] == IPPROTO_UDP) {
+			hl = 40;
+		} else {
+			continue;
+		}
+		if (got < (ssize_t)hl + 8)
+			continue;
+		dport = (p[hl + 2] << 8) | p[hl + 3];
+		if (dport != c->port)
+			continue;
+		if (c->amt) {
+			const uint8_t *a = p + hl + AMT_UDP_PORT_HDR;
+
+			/* type in the low nibble, version 0 in the high one,
+			 * then one reserved byte, then the IP packet.
+			 */
+			if (got < (ssize_t)hl + 8 + 3 ||
+			    a[0] != AMT_MSG_MCAST_DATA || a[1] != 0)
+				continue;
+			if ((a[2] >> 4) != (c->ipv6 ? 6 : 4))
+				continue;
+			amt++;
+		}
+		last = now;
+		n++;
+		if ((unsigned int)len > max_len)
+			max_len = len;
+		if ((unsigned int)len > c->mtu)
+			over++;
+	}
+	getsockopt(fd, SOL_PACKET, PACKET_STATISTICS, &st, &stlen);
+	printf("SNIFF frames=%u max_len=%u over_mtu=%u amt_data=%u lost=%u\n",
+	       n, max_len, over, amt, st.tp_drops);
+	return 0;
+}
+
+static void usage(void)
+{
+	fprintf(stderr,
+		"amt_gso send|recv|sniff [-6] [-I ifname] [-g group] [-b srcaddr]\n"
+		"           [-p port] [-s seg] [-c chunks] [-t tail] [-n datagrams]\n"
+		"           [-G] [-d delay_us] [-T idle_s] [-S grace_s] [-M mtu] [-a] [-i] [-o]\n");
+	exit(2);
+}
+
+int main(int argc, char **argv)
+{
+	struct cfg c = { .port = 4000, .seg = 1200, .cnt = 8, .tail = 100,
+			 .num = 1, .idle = 2, .mtu = 1500 };
+	int opt;
+
+	if (argc < 2)
+		usage();
+	optind = 2;
+	while ((opt = getopt(argc, argv, "6I:g:b:p:s:c:t:n:Gd:T:S:M:aio")) != -1) {
+		switch (opt) {
+		case '6':
+			c.ipv6 = true;
+			break;
+		case 'I':
+			c.ifname = optarg;
+			break;
+		case 'g':
+			c.group = optarg;
+			break;
+		case 'b':
+			c.bind_addr = optarg;
+			break;
+		case 'p':
+			c.port = atoi(optarg);
+			break;
+		case 's':
+			c.seg = atoi(optarg);
+			break;
+		case 'c':
+			c.cnt = atoi(optarg);
+			break;
+		case 't':
+			c.tail = atoi(optarg);
+			break;
+		case 'n':
+			c.num = atoi(optarg);
+			break;
+		case 'G':
+			c.gso = true;
+			break;
+		case 'd':
+			c.delay_us = atoi(optarg);
+			break;
+		case 'S':
+			c.grace = atoi(optarg);
+			break;
+		case 'T':
+			c.idle = atoi(optarg);
+			break;
+		case 'M':
+			c.mtu = atoi(optarg);
+			break;
+		case 'a':
+			c.amt = true;
+			break;
+		case 'i':
+			c.ignore_out = true;
+			break;
+		case 'o':
+			c.only_out = true;
+			break;
+		default:
+			usage();
+		}
+	}
+	if (!strcmp(argv[1], "send") && c.ifname && c.group)
+		return do_send(&c);
+	if (!strcmp(argv[1], "recv"))
+		return do_recv(&c);
+	if (!strcmp(argv[1], "sniff") && c.ifname)
+		return do_sniff(&c);
+	usage();
+	return 2;
+}
diff --git a/tools/testing/selftests/net/amt_gso.sh b/tools/testing/selftests/net/amt_gso.sh
new file mode 100755
index 000000000..8b32f17b6
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gso.sh
@@ -0,0 +1,269 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check that an AMT relay forwards a UDP GSO burst (UDP_SEGMENT) to a gateway
+# when transmit checksum offload is enabled on the amt device.
+#
+# With the default features the core segments the burst before it reaches
+# amt_dev_xmit(), so that case is the positive control for the harness. With
+# "tx on" the unsegmented GSO skb is handed to the driver, which must mark it
+# as a UDP tunnel packet before it hands it to the lower device.
+#
+# There are three network namespaces. The sender runs in the RELAY namespace,
+# because a forwarded GRO skb with DF set would be dropped by the multicast
+# router before it ever gets to amt.
+#
+#   LISTENER             GATEWAY                RELAY
+#  +---------+        +-------------+       +-----------------+
+#  |  l_gw   |--------| gw_l  br0   |       |                 |
+#  |         |        |       amtg  |       |  amtr  <- sender|
+#  +---------+        |  gw_relay   |-------| relay_gw        |
+#                     +-------------+       +-----------------+
+#
+# amt_gso, built from amt_gso.c, sends, receives and captures. The listener
+# reports datagrams by count, length and payload. A capture on amtr shows what
+# was handed to amt_dev_xmit(), and one on gw_relay shows what was put on the
+# wire.
+
+source lib.sh
+
+AMT_GSO=./amt_gso
+GRP4=239.0.0.1
+GRP6=ff0e::5:6
+SRC4=192.0.2.1
+SRC6=2001:db8:3::1
+PORT_AMT=2268
+SEG=1200
+TAIL=100
+BURST=8
+NUM=100
+PROBE_OPTS="-s 64 -c 1 -t 0 -n 1"
+
+TMPD=$(mktemp -d)
+
+cleanup()
+{
+	rm -rf "$TMPD"
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+dev_stat()
+{
+	ip netns exec "$1" cat "/sys/class/net/$2/statistics/$3"
+}
+
+udp_mib()
+{
+	ip netns exec "$1" awk -v f="$2" '
+		/^Udp:/ { if (!h) { split($0, k); h = 1 }
+			  else for (i = 2; i <= NF; i++) if (k[i] == f) print $i }
+	' /proc/net/snmp
+}
+
+field()
+{
+	grep -o " $2=[0-9]*" "$1" | tail -n 1 | cut -d= -f2
+}
+
+setup_topology()
+{
+	setup_ns LISTENER GATEWAY RELAY || exit $ksft_skip
+
+	ip link add l_gw netns "$LISTENER" type veth peer name gw_l \
+		netns "$GATEWAY"
+	ip link add gw_relay netns "$GATEWAY" type veth peer name relay_gw \
+		netns "$RELAY"
+
+	ip -n "$LISTENER" link set l_gw up
+	ip -n "$LISTENER" addr add 192.168.0.2/24 dev l_gw
+	ip -n "$LISTENER" addr add 2001:db8::2/64 dev l_gw nodad
+	ip -n "$LISTENER" route add default via 192.168.0.1 dev l_gw
+	ip -n "$LISTENER" addr add "$GRP4"/32 dev l_gw autojoin
+	ip -n "$LISTENER" addr add "$GRP6"/128 dev l_gw autojoin
+
+	ip -n "$GATEWAY" link set gw_l up
+	ip -n "$GATEWAY" link set gw_relay up
+	ip -n "$GATEWAY" addr add 192.168.0.1/24 dev gw_l
+	ip -n "$GATEWAY" addr add 2001:db8::1/64 dev gw_l nodad
+	ip -n "$GATEWAY" addr add 10.0.0.1/24 dev gw_relay
+	ip -n "$GATEWAY" link add br0 type bridge
+	ip -n "$GATEWAY" link set br0 up
+	ip -n "$GATEWAY" link set gw_l master br0
+	ip -n "$GATEWAY" link add amtg master br0 type amt mode gateway \
+		local 10.0.0.1 discovery 10.0.0.2 dev gw_relay \
+		gateway_port $PORT_AMT relay_port $PORT_AMT || exit $ksft_skip
+
+	ip -n "$RELAY" link set relay_gw up
+	ip -n "$RELAY" addr add 10.0.0.2/24 dev relay_gw
+	ip -n "$RELAY" link add amtr type amt mode relay local 10.0.0.2 \
+		dev relay_gw relay_port $PORT_AMT max_tunnels 4 || exit $ksft_skip
+	ip -n "$RELAY" addr add "$SRC4"/32 dev amtr
+	ip -n "$RELAY" addr add "$SRC6"/128 dev amtr nodad
+	ip -n "$RELAY" link set amtr up
+	ip -n "$GATEWAY" link set amtg up
+
+	# Segment and checksum in software on the relay's egress, so that the
+	# frames on the wire are at most one MTU and carry a final checksum
+	# whatever the veth can do.
+	ip netns exec "$RELAY" ethtool -K relay_gw tx off >/dev/null ||
+		exit $ksft_skip
+
+	AMTR_MTU=$(ip netns exec "$RELAY" cat /sys/class/net/amtr/mtu)
+}
+
+# Send one single-datagram probe every second until the listener sees it,
+# which means that discovery, request and update are done for this group.
+wait_tunnel()
+{
+	local fam=$1 v6="" grp=$GRP4 src=$SRC4 port=4999 i
+
+	[ "$fam" = 6 ] && { v6=-6; grp=$GRP6; src=$SRC6; port=6999; }
+
+	for i in $(seq 40); do
+		ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port \
+			$PROBE_OPTS -T 1 >"$TMPD/probe.out" &
+		local pid=$!
+		busywait 5000 grep -q READY "$TMPD/probe.out"
+		ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp \
+			-b $src -p $port $PROBE_OPTS >/dev/null
+		if wait $pid; then
+			return 0
+		fi
+	done
+	return 1
+}
+
+# run_burst <4|6> <gso 0|1>: send NUM datagrams and capture. Sets RECV_RC.
+run_burst()
+{
+	local fam=$1 gso=$2 v6="" grp=$GRP4 src=$SRC4 port=4000 cnt=$BURST
+	local tail=$TAIL gsoopt="" pid_r pid_a pid_g f
+
+	[ "$fam" = 6 ] && { v6=-6; grp=$GRP6; src=$SRC6; port=6000; }
+	if [ "$gso" = 1 ]; then
+		gsoopt=-G
+	else
+		cnt=1
+		tail=0
+	fi
+	local opts="-s $SEG -c $cnt -t $tail -n $NUM"
+
+	rm -f "$TMPD"/{recv,amtr,gw,send}.out
+
+	ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port $opts -T 3 -S 15 \
+		>"$TMPD/recv.out" &
+	pid_r=$!
+	ip netns exec "$RELAY" $AMT_GSO sniff -I amtr -p $port -M "$AMTR_MTU" \
+		-o -T 20 >"$TMPD/amtr.out" &
+	pid_a=$!
+	ip netns exec "$GATEWAY" $AMT_GSO sniff -I gw_relay -p $PORT_AMT \
+		-M 1500 -i -a $v6 -T 20 >"$TMPD/gw.out" &
+	pid_g=$!
+	for f in recv amtr gw; do
+		busywait 5000 grep -q READY "$TMPD/$f.out"
+	done
+
+	DROP0=$(dev_stat "$RELAY" relay_gw tx_dropped)
+	TXP0=$(dev_stat "$RELAY" relay_gw tx_packets)
+	CSUM0=$(udp_mib "$GATEWAY" InCsumErrors)
+	GRX0=$(dev_stat "$GATEWAY" amtg rx_packets)
+	LRX0=$(dev_stat "$LISTENER" l_gw rx_packets)
+	GRXD0=$(dev_stat "$GATEWAY" amtg rx_dropped)
+
+	ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp -b $src \
+		-p $port $opts $gsoopt -d 2000 >"$TMPD/send.out"
+
+	wait $pid_r
+	RECV_RC=$?
+	# The receiver is done, so every frame the captures will see is already
+	# queued on their sockets. Ask them to drain it and report.
+	kill -TERM $pid_a $pid_g
+	wait $pid_a $pid_g
+
+	DROPS=$(($(dev_stat "$RELAY" relay_gw tx_dropped) - DROP0))
+	TXP=$(($(dev_stat "$RELAY" relay_gw tx_packets) - TXP0))
+	CSUMERR=$(($(udp_mib "$GATEWAY" InCsumErrors) - CSUM0))
+	GRX=$(($(dev_stat "$GATEWAY" amtg rx_packets) - GRX0))
+	LRX=$(($(dev_stat "$LISTENER" l_gw rx_packets) - LRX0))
+	GRXD=$(($(dev_stat "$GATEWAY" amtg rx_dropped) - GRXD0))
+	EXPECT=$((NUM * (cnt + (tail ? 1 : 0))))
+}
+
+# run_case <name> <4|6> <tx on|off> <gso 0|1>
+run_case()
+{
+	local name=$1 fam=$2 tx=$3 gso=$4 big gwn stats
+
+	RET=0
+	retmsg=
+	ip netns exec "$RELAY" ethtool -K amtr tx "$tx" >/dev/null
+	if [ "$tx" = on ] && ! ip netns exec "$RELAY" ethtool -k amtr |
+	   grep -q '^tx-udp-segmentation: on'; then
+		log_test_skip "$name" "amtr cannot take tx-udp-segmentation"
+		return
+	fi
+
+	run_burst "$fam" "$gso"
+	big=$(field "$TMPD/amtr.out" over_mtu)
+
+	gwn=$(field "$TMPD/gw.out" amt_data)
+	log_info "$name: $(grep RECV "$TMPD/recv.out")"
+	log_info "$name: amtr tx $(grep SNIFF "$TMPD/amtr.out")"
+	log_info "$name: wire $(grep SNIFF "$TMPD/gw.out")"
+	stats="relay_gw tx +$TXP drop +$DROPS; gw csum_err +$CSUMERR"
+	stats="$stats; amtg rx +$GRX drop +$GRXD; listener rx +$LRX"
+	log_info "$name: $stats"
+
+	check_err $(($(field "$TMPD/amtr.out" lost) + \
+		     $(field "$TMPD/gw.out" lost) != 0)) \
+		"a packet capture lost frames, the verdict is unreliable"
+	check_err $RECV_RC "listener did not get every datagram intact"
+	check_err $((DROPS != 0)) "relay_gw dropped $DROPS packets"
+	check_err $((CSUMERR != 0)) "gateway counted $CSUMERR csum errors"
+	check_err $((gwn != EXPECT)) \
+		"gateway saw $gwn AMT data messages, expected $EXPECT"
+	check_err $(($(field "$TMPD/gw.out" over_mtu) != 0)) \
+		"frames larger than the MTU were put on the wire"
+
+	if [ "$tx" = on ] && [ "$gso" = 1 ]; then
+		# Without this the case proves nothing about the driver.
+		if [ "$big" = 0 ] && [ $RET -eq 0 ]; then
+			RET=$ksft_skip
+			retmsg="no GSO skb reached amt_dev_xmit()"
+		fi
+	else
+		check_err $((big != 0)) \
+			"a frame larger than the MTU reached amt_dev_xmit()"
+	fi
+
+	log_test "$name"
+}
+
+require_command ip
+require_command ethtool
+if [ ! -x $AMT_GSO ]; then
+	log_test_skip "amt_gso helper not built"
+	exit $EXIT_STATUS
+fi
+ip link help 2>&1 | grep -q amt || {
+	log_test_skip "iproute2 without amt support"
+	exit $EXIT_STATUS
+}
+
+setup_topology
+
+wait_tunnel 4 || { log_test_skip "IPv4 AMT tunnel did not come up"
+		   exit $EXIT_STATUS; }
+wait_tunnel 6 || { log_test_skip "IPv6 AMT tunnel did not come up"
+		   exit $EXIT_STATUS; }
+
+run_case "IPv4 UDP_SEGMENT burst, amt tx offload off (control)" 4 off 1
+run_case "IPv6 UDP_SEGMENT burst, amt tx offload off (control)" 6 off 1
+run_case "IPv4 UDP_SEGMENT burst, amt tx offload on" 4 on 1
+run_case "IPv6 UDP_SEGMENT burst, amt tx offload on" 6 on 1
+run_case "IPv4 plain datagrams, amt tx offload on" 4 on 0
+run_case "IPv6 plain datagrams, amt tx offload on" 6 on 0
+
+exit $EXIT_STATUS
-- 
2.43.0

