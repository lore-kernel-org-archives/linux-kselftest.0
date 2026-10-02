Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D61442B3E
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976413; cv=none; b=DOX9iPzf+Oe1a9KLXVhubJFAd+iQ6zHtd9B9FHHK5qFLOyYJ+Ajc43JemqLNLJZWLeTuWStBognsQ6CCFRGx2gGEGrcZJtw0VeOWBFaRdvqHa0jODQT9a477l/SJP/yAPU7IWoio97pchqI6FlHGa2lD8Yxj9UgJP3OUbvpyv7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976413; c=relaxed/simple;
	bh=ssNVTjuILOJ3wuYffFNZFvNL/FgzuydT3ufYb9HB8Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsAuA1mwkYL5rrRnxC1BXuQvcqmcoFTihbR18WHT12lfizn4xGHyIgp9TNrKNL8Xu+OmwnsS5NZJF4yr7kIsTTkJTpJNPQ+GgbBIzXl/VJZP4YwW7VLQmHHWRWMWG31kr0tO3F4lLvqLB3AzVyxKeqxOBFl73WyWPnHkvIOEB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=IW7PD0w4; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="IW7PD0w4"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b02aab050so127899f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790976409; x=1791581209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dagUA5orxdkXU9oBp3ht1XcBNJ39fBBwGCNGVrcaZ1M=;
        b=IW7PD0w4tPeKsLw8VolDGDJXIK0hq8u3//SeGKBSUxFoK46eR8te0jL8RkiAFGiX0Y
         DhKqfYDQehPZr04bF45FyIJrTnFhnH9JGurpvRN3itvSHepWEY7O/gRmDBdod/M98Kas
         5FuMdtvP7g9fDip4uk+U5RcEVviSItnc8zKQNPw0lXXi5nbOtKRwElEaZisU9qqu0diJ
         RKP/w8wbcaLrJug1CZC21WhfewjzKd6FkeFQX1Hhk3qvATe/augAMPZyGaLxY3tcaJVE
         SQAPE/Up8x5D+3ASwgcpcqU68G85ZD2glRjw6XAzIrYVEfd64CNzgj/kX7qwnbWQq2MS
         d7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976409; x=1791581209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dagUA5orxdkXU9oBp3ht1XcBNJ39fBBwGCNGVrcaZ1M=;
        b=F0+phgXQfntddiZYJcBODEBwR9hBHWam6qIoYkmpa27i2JqycLZaef++2TSHdUCEEP
         RK220JcKWugali2MIospAXOm/BRmB6f2s+E6neEAGn5eChQOVUJvzQKNeFeKNGqNdiGV
         cSl3EqIniYeFOoxhkiN/S8VHbdbgVRKpjcOya6E5o9YziVGyY10n9D8UHBhpIetsB7Ql
         KUL7rsO7fHO4qw47ofl9dIQbUAbnqe5qeKJTwL31/Hx+6O5S99pxn7aMtqCcb6AhOATM
         WY5FKQxOuedVWziKKARFoXpR8pi+wGJ2sFnHQqp1NvJbnbja2o02KefhkbhPCuK4p+tb
         ZK+w==
X-Forwarded-Encrypted: i=1; AKwUvBxUMdi0/2JV9HiRcuDH3FY3DEGplD8ckqLRdPQh82fsoYck6v1o5yB8QlGF2TLB4IQBCXOruRvSXMTceYf+ujQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQdhQvPMJf+bgIoOdNHKlcNc9ANc01/1rnuYiTybbhSAp2VRj4
	9luQlQjYttt9Uj43ySiG0ZK8ENgYXRY0cdisEe4kDjNzrtQJ+nJzGNxkr/2ceDWVlBPCSnIBL3F
	oQP3KsT3wxmh4Ing=
X-Gm-Gg: AYBFou00GkrGkeiSlihFObL9iAYF5y5HRyu7m2ooi7Md5TAC9X1cLtSpcNqmTn28XUP
	fcP/lsX4k0tg2TU9KL63ocUSD5A42S/u3KAt1fAm7mYbitYDpFyD4nx7ogIdpf6RxFIEh+yhM9z
	MLroKVqwSiXDZlhO0rYnTJMCkCXZELopdIJdA0SinciWL3e8lSgXH4yOcALzwPulJcIf27uvhMF
	KvR6Q3mETUNzI4DIItde8lpKFPad7542LNCIhzAGeQHfAzeMbyD9WSrHNYUIt7mIxaMLYJL9xVk
	DPE/gLhmyUPvZSrrtvoeYf1ZLjzwjbyLSbCh7EtIdgkNJQhBEDwgAsSUa/omP/k0giUTLTI9Zdi
	oeAilhF5LrDw3AA7LDjfYkViALG9LmLGj7AIYUfmC0S8Z6gm27l8ig75OY1DPeWCKL4FHYFT8Mc
	vYzbp5xYhOaA6B/A3mkZBWIauyVZWZxo8Ib6xOa/FL3wg2pUaqn5XYHwEPJCqGL0aFUGCizgJqF
	1D9WpPW5PC2gHjQ2ClntaJMUm/l7bHtNXjVYxrlM33BFu32pXh+qfPE4zsQHAJwvkxSKooecT0g
	yg==
X-Received: by 2002:a05:6000:178f:b0:488:8436:b343 with SMTP id ffacd0b85a97d-48b1271aa6fmr6998760f8f.37.1790976408879;
        Fri, 02 Oct 2026 14:26:48 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm7183149f8f.2.2026.10.02.14.26.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 14:26:48 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/2] selftests: net: add an amt test for UDP_SEGMENT through the relay
Date: Sat,  3 Oct 2026 00:24:58 +0300
Message-ID: <20261002212458.34247-3-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002212458.34247-1-omar@blockcast.net>
References: <20261002212458.34247-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add amt_gso.sh and its helper amt_gso. The test sends a UDP_SEGMENT
burst from the relay namespace through an amt relay and gateway to a
listener, with tx checksum offload off on the amt device (a control:
the core segments the burst before the driver) and on (the GSO skb
reaches amt_dev_xmit()). It checks that the listener gets every
datagram intact, that a GSO skb really reached the driver, that nothing
larger than the MTU was put on the wire, and that the relay's egress
device and the gateway report no drops or checksum errors.

The verdict needs AF_PACKET captures: add CONFIG_PACKET to the config,
and skip when they are not available.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---

Notes (v2):
    New in v2: the test skips when AF_PACKET is not available (without
    CONFIG_PACKET or CAP_NET_RAW the v1 test printed no result and exited
    0), and dead options and code are gone. It gave the expected result in
    20 of 20 runs per kernel on net-next 071876fd5048 (v1: 40 of 40 on
    eb0c18404c89), in a 4-vCPU KVM guest on a busy host: unpatched, only the
    two tx-on UDP_SEGMENT cases fail; patched, all six pass. An earlier
    draft failed in about 3 of 25 runs on a loaded guest because the
    receiver gave up waiting for the first datagram (inferred from the
    counters); it now waits up to 15 s for it, but the test may still be
    flaky elsewhere.

 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 457 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 269 +++++++++++++++
 tools/testing/selftests/net/config     |   1 +
 5 files changed, 730 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index dacd36e..489d37b 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+amt_gso
 bind_bhash
 bind_timewait
 bind_wildcard
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index cab3f2c..9af0d17 100644
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
index 0000000..eebf3ec
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gso.c
@@ -0,0 +1,457 @@
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
+ * Every datagram consists of cnt chunks of seg bytes followed by an optional
+ * tail chunk of tail bytes. A chunk starts with a struct chunk_hdr and the
+ * rest of it is a function of (datagram number, chunk number, offset).
+ * With UDP_SEGMENT set to seg, every chunk is one segment on the wire.
+ */
+#define _GNU_SOURCE
+#include <arpa/inet.h>
+#include <errno.h>
+#include <error.h>
+#include <linux/if_packet.h>
+#include <linux/if_ether.h>
+#include <net/if.h>
+#include <netinet/in.h>
+#include <netinet/udp.h>
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
+
+#define MAX_DGRAM	65507
+#define AMT_MSG_MCAST_DATA	6
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
+		error(2, errno, "socket");
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
+			error(2, errno, "inet_pton");
+		*len = sizeof(*a);
+	} else {
+		struct sockaddr_in *a = (void *)ss;
+
+		a->sin_family = AF_INET;
+		a->sin_port = htons(port);
+		if (inet_pton(AF_INET, str, &a->sin_addr) != 1)
+			error(2, errno, "inet_pton");
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
+	if (total > MAX_DGRAM ||
+	    (c->tail && c->tail < sizeof(struct chunk_hdr)) ||
+	    c->seg < sizeof(struct chunk_hdr))
+		error(2, 0, "bad sizes");
+	ifindex = if_nametoindex(c->ifname);
+	if (!ifindex)
+		error(2, errno, "if_nametoindex");
+
+	fd = open_udp(c);
+	if (c->bind_addr) {
+		fill_addr(c, c->bind_addr, 0, &src, &slen);
+		if (bind(fd, (void *)&src, slen))
+			error(2, errno, "bind");
+	}
+	if (c->ipv6) {
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_IF, &ifindex,
+			       sizeof(ifindex)))
+			error(2, errno, "IPV6_MULTICAST_IF");
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, &ttl,
+			       sizeof(ttl)))
+			error(2, errno, "IPV6_MULTICAST_HOPS");
+		if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_LOOP, &zero,
+			       sizeof(zero)))
+			error(2, errno, "IPV6_MULTICAST_LOOP");
+	} else {
+		struct ip_mreqn mr = { .imr_ifindex = ifindex };
+
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF, &mr,
+			       sizeof(mr)))
+			error(2, errno, "IP_MULTICAST_IF");
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_TTL, &ttl,
+			       sizeof(ttl)))
+			error(2, errno, "IP_MULTICAST_TTL");
+		if (setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP, &zero,
+			       sizeof(zero)))
+			error(2, errno, "IP_MULTICAST_LOOP");
+	}
+	if (c->gso) {
+		int gso = c->seg;
+
+		if (setsockopt(fd, IPPROTO_UDP, UDP_SEGMENT, &gso, sizeof(gso)))
+			error(2, errno, "UDP_SEGMENT");
+	}
+	fill_addr(c, c->group, c->port, &dst, &dlen);
+
+	for (i = 0; i < c->num; i++) {
+		fill_dgram(c, i, buf);
+		if (sendto(fd, buf, total, 0, (void *)&dst, dlen) !=
+		    (ssize_t)total)
+			error(2, errno, "sendto");
+		if (c->delay_us)
+			usleep(c->delay_us);
+	}
+	close(fd);
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
+		error(2, errno, "calloc");
+	fd = open_udp(c);
+	setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
+	fill_addr(c, c->ipv6 ? "::" : "0.0.0.0", c->port, &any, &alen);
+	if (bind(fd, (void *)&any, alen))
+		error(2, errno, "bind");
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
+			error(2, errno, "poll");
+		if (!r) {
+			idle_ms += 100;
+			if (idle_ms >=
+			    (int)(c->idle + (got_any ? 0 : c->grace)) * 1000)
+				break;
+			continue;
+		}
+		idle_ms = 0;
+		got_any = true;
+		n = recv(fd, buf, sizeof(buf), 0);
+		if (n < 0)
+			error(2, errno, "recv");
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
+	printf("RECV expected=%u good=%u bad_len=%u ", expected, good, bad_len);
+	printf("bad_payload=%u dup=%u unknown=%u\n", bad_payload, dup, unk);
+	free(seen);
+	return good == expected && !bad_len && !bad_payload && !dup &&
+	       !unk ? 0 : 1;
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
+		error(2, errno, "socket(AF_PACKET)");
+	sll.sll_protocol = htons(ETH_P_ALL);
+	sll.sll_ifindex = if_nametoindex(c->ifname);
+	if (!sll.sll_ifindex)
+		error(2, errno, "if_nametoindex");
+	if (bind(fd, (void *)&sll, sizeof(sll)))
+		error(2, errno, "bind(AF_PACKET)");
+	/* Do not lose frames to a full receive queue: they are counted */
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
+			error(2, errno, "poll");
+		if (!r) {
+			if (stopping)
+				break;
+			continue;
+		}
+		got = recvfrom(fd, buf, sizeof(buf), MSG_TRUNC,
+			       (void *)&from, &flen);
+		if (got < 0)
+			error(2, errno, "recvfrom");
+		len = got;
+		if (got > (ssize_t)sizeof(buf))
+			got = sizeof(buf);
+
+		if (ntohs(from.sll_protocol) == ETH_P_IP && got >= 28 &&
+		    (p[0] >> 4) == 4 && p[9] == IPPROTO_UDP) {
+			hl = (p[0] & 0xf) * 4;
+		} else if (ntohs(from.sll_protocol) == ETH_P_IPV6 &&
+			   got >= 48 && (p[0] >> 4) == 6 &&
+			   p[6] == IPPROTO_UDP) {
+			hl = 40;
+		} else {
+			continue;
+		}
+		if (got < (ssize_t)(hl + sizeof(struct udphdr)))
+			continue;
+		dport = (p[hl + 2] << 8) | p[hl + 3];
+		if (dport != c->port)
+			continue;
+		if (c->amt) {
+			const uint8_t *a = p + hl + sizeof(struct udphdr);
+
+			/* version 0, type 6, a reserved byte, the IP packet */
+			if (got < (ssize_t)(hl + sizeof(struct udphdr) + 3) ||
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
+		"           [-G] [-d delay_us] [-T idle_s] [-S grace_s] [-M mtu] [-a]\n");
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
+	while ((opt = getopt(argc, argv,
+			     "6I:g:b:p:s:c:t:n:Gd:T:S:M:a")) != -1) {
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
index 0000000..3c37cb5
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
+PROBE_OPTS=(-s 64 -c 1 -t 0 -n 1)
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
+csum_errors()
+{
+	ip netns exec "$GATEWAY" nstat -asz UdpInCsumErrors |
+		awk '$1 == "UdpInCsumErrors" { n = $2 } END { print n + 0 }'
+}
+
+field()
+{
+	local val
+
+	val=$(grep -o " $2=[0-9]*" "$1" | tail -n 1 | cut -d= -f2)
+	echo "${val:-0}"
+}
+
+skip_all()
+{
+	log_test_skip "$1"
+	exit "$EXIT_STATUS"
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
+		dev relay_gw relay_port $PORT_AMT max_tunnels 4 ||
+		exit $ksft_skip
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
+			"${PROBE_OPTS[@]}" -T 1 >"$TMPD/probe.out" &
+		local pid=$!
+		busywait 5000 grep -q READY "$TMPD/probe.out"
+		ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp \
+			-b $src -p $port "${PROBE_OPTS[@]}"
+		wait $pid && return 0
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
+	local opts=(-s "$SEG" -c "$cnt" -t "$tail" -n "$NUM")
+
+	rm -f "$TMPD"/{recv,amtr,gw}.out
+
+	ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port "${opts[@]}" \
+		-T 3 -S 15 >"$TMPD/recv.out" &
+	pid_r=$!
+	ip netns exec "$RELAY" $AMT_GSO sniff -I amtr -p $port -M "$AMTR_MTU" \
+		-T 20 >"$TMPD/amtr.out" &
+	pid_a=$!
+	ip netns exec "$GATEWAY" $AMT_GSO sniff -I gw_relay -p $PORT_AMT \
+		-M 1500 -a $v6 -T 20 >"$TMPD/gw.out" &
+	pid_g=$!
+	for f in recv amtr gw; do
+		busywait 5000 grep -q READY "$TMPD/$f.out"
+	done
+
+	DROP0=$(dev_stat "$RELAY" relay_gw tx_dropped)
+	TXP0=$(dev_stat "$RELAY" relay_gw tx_packets)
+	CSUM0=$(csum_errors)
+	GRX0=$(dev_stat "$GATEWAY" amtg rx_packets)
+	LRX0=$(dev_stat "$LISTENER" l_gw rx_packets)
+	GRXD0=$(dev_stat "$GATEWAY" amtg rx_dropped)
+
+	ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp -b $src \
+		-p $port "${opts[@]}" $gsoopt -d 2000
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
+	CSUMERR=$(($(csum_errors) - CSUM0))
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
+		[ "$big" = 0 ] && ret_set_ksft_status "$ksft_skip" \
+			"no GSO skb reached amt_dev_xmit()"
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
+require_command nstat
+[ -x $AMT_GSO ] || skip_all "amt_gso helper not built"
+ip link help 2>&1 | grep -q amt || skip_all "iproute2 without amt support"
+# Without AF_PACKET (CONFIG_PACKET, CAP_NET_RAW) there is no verdict.
+$AMT_GSO sniff -I lo -p 1 -T 0 >/dev/null 2>&1 ||
+	skip_all "AF_PACKET capture not available"
+
+setup_topology
+
+wait_tunnel 4 || skip_all "IPv4 AMT tunnel did not come up"
+wait_tunnel 6 || skip_all "IPv6 AMT tunnel did not come up"
+
+run_case "IPv4 UDP_SEGMENT burst, amt tx offload off (control)" 4 off 1
+run_case "IPv6 UDP_SEGMENT burst, amt tx offload off (control)" 6 off 1
+run_case "IPv4 UDP_SEGMENT burst, amt tx offload on" 4 on 1
+run_case "IPv6 UDP_SEGMENT burst, amt tx offload on" 6 on 1
+run_case "IPv4 plain datagrams, amt tx offload on" 4 on 0
+run_case "IPv6 plain datagrams, amt tx offload on" 6 on 0
+
+exit "$EXIT_STATUS"
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 737e7e6..8f23da4 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -117,6 +117,7 @@ CONFIG_NFT_COMPAT=m
 CONFIG_NFT_NAT=m
 CONFIG_NUMA=y
 CONFIG_OPENVSWITCH=m
+CONFIG_PACKET=y
 CONFIG_PAGE_POOL_STATS=y
 CONFIG_PSAMPLE=m
 CONFIG_RPS=y
-- 
2.50.1 (Apple Git-155)

