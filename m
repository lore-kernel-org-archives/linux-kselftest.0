Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983979;
	b=1qzGfCXUW3ZTOtYDnaUJj8v/KTGTMa4kaXSB+ANwGsouEvdxYuzbpiGM1bEcj650FpCL
	 U5G0O+cue8Pu+JL0DrQJBbIn546nBiAaSd8SExCS/RFUF+SPN3MfVPYhLn5E1fySIswJv
	 u0UwIEVbVohTqdZ/EJEvSh+mcrRCQwko9+qahquVD5DOll9UsoG7y7n1ADpOcrv6tZfU+
	 xrPrQ4dMVzmkZCarCW/35oXWbf0fYAnXn3E1tJk0ad+NCQnZGAq9ESE7RjJ5ZO4us/lSD
	 sTEBt9Gg1GiuBz9gm7fFNdsIk3pix+RL7z5Oz8AtTJEWED0gSp8aXFuRPl/kr8ZzRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+hfYLfF1sqEj1++0abJ8h5Rbccp1+H1WdLqSrymE34I=;
	b=3dXjCenG1qyECVYz/biU1Asznx+Ily1n4i2L7UBiM5210zkaU3/USgeEuro2XDdxd3j2
	 lRfNGa5wgF1wdySQw7Wdx5XIHRGh+ssJdMey6OGBqUvpB0kFoDyz9DyYfin/WEeFGGS+B
	 FEpHyFJrU8q2lcbJgSMNc6BfkVqjLt8txmiLwX+4fHCnntNznCLH8fw4xm8YCm+hJc7z1
	 CYvIE15QPTIjb6cKUNLqKQ4MVipi8Z1Rt2pk8ZO07hyrulpky8yBoP8NdFjM5yBW9aHZs
	 0Ui+Jm3mT+2OvHv4OlcFtEBxaQ5jNd3Yr1bcufTqhnEigHnwkOTkrLuXr21XAZ6Bsew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXgVIKtD;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FA606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXgVIKtD
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb684859cbso433572a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983978; x=1795588778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hfYLfF1sqEj1++0abJ8h5Rbccp1+H1WdLqSrymE34I=;
        b=CXgVIKtDMsvQvxV0CHP5wTmAFFaocxyvACMGDqqk2cOBwm4MwX/CdyAwq+VYBNb4fR
         lpE+o90zrinxUZbEhMCRRbxdwfvu/duc9vRSikT5AohDp+600LRo+/49nGzC8ENkic++
         IyanGeZjGHSo927oVr327tzz9HAtu8cKNNCjYpuvme0mOoILi9xqg9LeZbGOqNcigHAr
         miWBwHVj/d3WsSZgyMpG/fjVStJ3KnA3nxwzY5HN9H1904ADsHIDRZrPDZ7+iqFpnpt9
         X/abqZZeIOGsxzJLm78WgFKIqhM3jhm7Ln12cgASSJF3Kf2hmFEeNY/3ez5OJ8VnPdgv
         4+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983978; x=1795588778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hfYLfF1sqEj1++0abJ8h5Rbccp1+H1WdLqSrymE34I=;
        b=rVFj9mTf7CgirOJeFzdbfT4f+M3RTwEltct2CQVMoeAS1EXxRtVeE1B/7Z6dL1jPuP
         ig9Hijvi7utb5ziDij/7jZaAs+f+csnyovadQcJ8T8E0KwBUS2/c4yHkyq4r1u+kNP6e
         5zjfSafxSkRA/4JheXxG9TwV1E/CzP1KbSOCKjmwhGZD/yiH10Lx/OFazQp4NogjF0ah
         9TUaAa2FefsjcheKiKxK+ThzSzV9/8yVUTY7dbAgo+bTajWI/LKRBu1E+wS6L1bVCZz6
         NCKBWnbCTE4OmY3BvOK6UdkI6Ht8o2Lw5RI7bfoxJvthclEeVnIbJhat1o4ayTSPOB1F
         Kzag==
X-Forwarded-Encrypted: i=1; AL+hErHz5lNZ1fdYRmekU4sTj+q9VZ9TvLneOH0kUKfiwbbm6okU+C3MM6hZEOquw4h+fDEYzKFRL7gbABIBAnuPuWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m64ZELJMQMrneB57DjuBWM8kpM/TLckXcsNus+czpuEmuLabb
	JBnXTR7ee0Ruwoc1CYI6r+EX7IcdmxdsynngX+355NhOkTm/yaPKeWZZ
X-Gm-Gg: AZFdTZdC1iJUzinWaZDOh3CB/Py+VXHI7HFJrZ7x9OQDSNMbezebF4LSdwTadqdTQTY
	kFx2Ud5Tpqt3ZL9pDZSEME7flz7qb52MCSVeS6H/tvoJWqEkMjLeE5LmABguAigffHPtzKmz7w5
	ggtf/0YVUfL/1dAktHmjWxwlfjSD0ipReoBvet57HQBsdJYHYX053xk4Jv2y3g3AgnHHL+wD/ya
	sQXzrVeHk4Vim2ucpg5EwTELubbNDl9yimw+pux0+FReHf4qUqi3rosra7ZiySkDDxTj74K6FNV
	XwKDOz2Y/7dHSScdLp9GxLmN10PaxQ5DCrKPCqgYkGrSB5H2IajS86vRKzQ/Sqw3teHiDCDoT+W
	7ftOqeZX1DAtgUo7PhGqdUoLngLiAdhnUMDqUjGwNu8ZHX5HI+l2CuURbnU28TpSlcj5A2DOvb4
	vTYxXKjtiBEPdw3Isq3Vh4jeLGP6TGmwXnbph/GB91uiLZJ3eS8xkwGNWOKA6Nh1c/E86sm9WRJ
	lzZCWSm4/c/QAthE+3mEvxLuBJFY5Q38zlcu1WYzV+VVXU4gIR64+Mtf25O8oFcqsThXSla8iM2
	miOaUGXiS6shuDmIul+P6+x1MwcGocVTfYwLwn6TGGaBicIGbdJfYoaeSDIZZepP8kCYiCxVDPM
	shOEWmMSPmaCNmtQb/SrQsZd4RRyQ0HWAfzt2EBU1j9T02/lrA7W0YA==
X-Received: by 2002:a17:90b:1b0e:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b3d07c9e3dmr2047240a91.53.1794983977826;
        Tue, 17 Nov 2026 22:39:37 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:37 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: check DualPI2 head timestamps after trimming
Date: Wed, 18 Nov 2026 14:39:22 +0800
Message-ID: <20261118143500.dualpi2.2.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
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

Add regression checks for the queue-head timestamps cached by DualPI2
when a configuration change trims packets. Exercise complete and partial
memory-limit trimming and partial packet-limit trimming for C and L,
mixed queues, and a change which drains C while retaining L. Also check
normal dequeue and a configuration change that does not trim packets.

Use an isolated namespace and a dummy interface shaped by HFSC ls/ul
curves. This holds ordinary AF_PACKET frames without peeking into the
child qdisc. A small helper sends frames and obtains DualPI2 statistics
through RTM_GETQDISC. Monotonic send and sampling bounds identify the
retained queue head, including when its enqueue time differs from the
removed head.

Build the helper through TEST_GEN_FILES using the kernel UAPI headers,
use the shared net selftest helpers, and include the required scheduler
config options. Associate the new files with the TC maintainers.

I developed and tested these regression checks with OpenAI Codex
assisting with the initial test code and this changelog. I reviewed the
contribution. Codex also ran the archived automated before/after
validation described in the cover letter.

Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 MAINTAINERS                                 |   1 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/config          |   2 +
 tools/testing/selftests/net/dualpi2_head.c  | 304 +++++++++++++++++
 tools/testing/selftests/net/dualpi2_head.sh | 350 ++++++++++++++++++++
 5 files changed, 659 insertions(+)
 create mode 100644 tools/testing/selftests/net/dualpi2_head.c
 create mode 100755 tools/testing/selftests/net/dualpi2_head.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 66e609de66..fc869d0ec6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27407,6 +27407,7 @@ F:	include/uapi/linux/pkt_sched.h
 F:	include/uapi/linux/tc_act/
 F:	include/uapi/linux/tc_ematch/
 F:	net/sched/
+F:	tools/testing/selftests/net/dualpi2_head.*
 F:	tools/testing/selftests/tc-testing
 
 TC90522 MEDIA DRIVER
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0f..b54dcaf47b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -28,6 +28,7 @@ TEST_PROGS := \
 	cork_fragsize.py \
 	double_udp_encap.sh \
 	drop_monitor_tests.sh \
+	dualpi2_head.sh \
 	ecmp_rehash.sh \
 	exception_cache.sh \
 	fcnal-ipv4.sh \
@@ -148,6 +149,7 @@ TEST_PROGS_EXTENDED := \
 TEST_GEN_FILES := \
 	bind_bhash \
 	cmsg_sender \
+	dualpi2_head \
 	fin_ack_lat \
 	hwtstamp_config \
 	io_uring_zerocopy_tx \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 3e7ce41bd6..54e4adc218 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -101,9 +101,11 @@ CONFIG_NET_L3_MASTER_DEV=y
 CONFIG_NET_NS=y
 CONFIG_NET_NSH=m
 CONFIG_NET_PKTGEN=m
+CONFIG_NET_SCH_DUALPI2=m
 CONFIG_NET_SCH_ETF=m
 CONFIG_NET_SCH_FQ=m
 CONFIG_NET_SCH_FQ_CODEL=m
+CONFIG_NET_SCH_HFSC=m
 CONFIG_NET_SCH_HTB=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_SCH_NETEM=y
diff --git a/tools/testing/selftests/net/dualpi2_head.c b/tools/testing/selftests/net/dualpi2_head.c
new file mode 100644
index 0000000000..aafe0c95ff
--- /dev/null
+++ b/tools/testing/selftests/net/dualpi2_head.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Send frames through DualPI2 and sample its queue statistics. */
+#define _POSIX_C_SOURCE 200809L
+#include <arpa/inet.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <linux/if_ether.h>
+#include <linux/if_packet.h>
+#include <linux/pkt_sched.h>
+#include <linux/rtnetlink.h>
+#include <net/if.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/time.h>
+#include <time.h>
+#include <unistd.h>
+
+static uint64_t now_us(void)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_MONOTONIC, &ts)) {
+		perror("clock_gettime");
+		exit(1);
+	}
+	return (uint64_t)ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
+}
+
+static unsigned long parse_ulong(const char *s, unsigned long min, unsigned long max)
+{
+	unsigned long n;
+	char *end;
+
+	errno = 0;
+	n = strtoul(s, &end, 10);
+	if (errno || !*s || *end || n < min || n > max) {
+		fprintf(stderr, "invalid number: %s\n", s);
+		exit(2);
+	}
+	return n;
+}
+
+static void put_be16(unsigned char *p, unsigned int value)
+{
+	p[0] = value >> 8;
+	p[1] = value & 255;
+}
+
+static void ip_checksum(unsigned char *ip)
+{
+	unsigned int sum = 0;
+	unsigned int i;
+
+	ip[10] = 0;
+	ip[11] = 0;
+	for (i = 0; i < 20; i += 2)
+		sum += ((unsigned int)ip[i] << 8) | ip[i + 1];
+	while (sum >> 16)
+		sum = (sum & 65535) + (sum >> 16);
+	put_be16(ip + 10, ~sum & 65535);
+}
+
+static int read_stats(const char *dev)
+{
+	struct {
+		struct nlmsghdr n;
+		struct tcmsg t;
+	} req = {
+		.n.nlmsg_len = NLMSG_LENGTH(sizeof(struct tcmsg)),
+		.n.nlmsg_type = RTM_GETQDISC,
+		.n.nlmsg_flags = NLM_F_REQUEST | NLM_F_DUMP,
+		.n.nlmsg_seq = 1,
+		.t.tcm_family = AF_UNSPEC,
+	};
+	struct sockaddr_nl kernel = { .nl_family = AF_NETLINK };
+	struct timeval timeout = { .tv_sec = 5 };
+	union {
+		struct nlmsghdr align;
+		unsigned char data[16384];
+	} buf;
+	struct tc_dualpi2_xstats app;
+	struct tc_stats stats;
+	uint64_t start, end;
+	struct sockaddr_nl peer;
+	struct iovec iov;
+	struct msghdr msg;
+	struct nlmsghdr *n;
+	struct rtattr *a;
+	struct tcmsg *t;
+	bool have_app, have_stats, is_dualpi2;
+	ssize_t received;
+	unsigned int len;
+	int fd, alen;
+
+	req.t.tcm_ifindex = if_nametoindex(dev);
+	if (!req.t.tcm_ifindex) {
+		perror("if_nametoindex");
+		return 1;
+	}
+	fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	if (fd < 0) {
+		perror("socket(NETLINK_ROUTE)");
+		return 1;
+	}
+	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)))
+		goto error;
+	start = now_us();
+	if (sendto(fd, &req, req.n.nlmsg_len, 0,
+		   (struct sockaddr *)&kernel, sizeof(kernel)) < 0)
+		goto error;
+	for (;;) {
+		iov = (struct iovec) { .iov_base = buf.data, .iov_len = sizeof(buf.data) };
+		msg = (struct msghdr) {
+			.msg_name = &peer,
+			.msg_namelen = sizeof(peer),
+			.msg_iov = &iov,
+			.msg_iovlen = 1,
+		};
+		received = recvmsg(fd, &msg, 0);
+		end = now_us();
+		if (received < 0) {
+			if (errno == EINTR)
+				continue;
+			goto error;
+		}
+		if (!received || msg.msg_flags & MSG_TRUNC) {
+			errno = EMSGSIZE;
+			goto error;
+		}
+		if (peer.nl_pid)
+			continue;
+		len = received;
+		for (n = (struct nlmsghdr *)buf.data; NLMSG_OK(n, len);
+		     n = NLMSG_NEXT(n, len)) {
+			if (n->nlmsg_seq != req.n.nlmsg_seq)
+				continue;
+			if (n->nlmsg_flags & NLM_F_DUMP_INTR) {
+				errno = EAGAIN;
+				goto error;
+			}
+			if (n->nlmsg_type == NLMSG_DONE) {
+				errno = ENOENT;
+				goto error;
+			}
+			if (n->nlmsg_type == NLMSG_ERROR) {
+				struct nlmsgerr *err;
+
+				if (n->nlmsg_len < NLMSG_LENGTH(sizeof(*err))) {
+					errno = EPROTO;
+					goto error;
+				}
+				err = NLMSG_DATA(n);
+				if (!err->error)
+					continue;
+				errno = -err->error;
+				goto error;
+			}
+			if (n->nlmsg_type != RTM_NEWQDISC ||
+			    n->nlmsg_len < NLMSG_LENGTH(sizeof(*t)))
+				continue;
+			t = NLMSG_DATA(n);
+			if (t->tcm_ifindex != req.t.tcm_ifindex ||
+			    t->tcm_handle != TC_H_MAKE(0x10 << 16, 0))
+				continue;
+			have_app = false;
+			have_stats = false;
+			is_dualpi2 = false;
+			alen = n->nlmsg_len - NLMSG_LENGTH(sizeof(*t));
+			for (a = TCA_RTA(t); RTA_OK(a, alen); a = RTA_NEXT(a, alen)) {
+				if ((a->rta_type & NLA_TYPE_MASK) == TCA_KIND &&
+				    RTA_PAYLOAD(a) == sizeof("dualpi2") &&
+				    !memcmp(RTA_DATA(a), "dualpi2", sizeof("dualpi2")))
+					is_dualpi2 = true;
+				if ((a->rta_type & NLA_TYPE_MASK) == TCA_STATS &&
+				    RTA_PAYLOAD(a) >= sizeof(stats)) {
+					memcpy(&stats, RTA_DATA(a), sizeof(stats));
+					have_stats = true;
+				}
+				if ((a->rta_type & NLA_TYPE_MASK) == TCA_XSTATS &&
+				    RTA_PAYLOAD(a) >= sizeof(app)) {
+					memcpy(&app, RTA_DATA(a), sizeof(app));
+					have_app = true;
+				}
+			}
+			if (!is_dualpi2 || !have_stats || !have_app) {
+				errno = EPROTO;
+				goto error;
+			}
+			printf("%u %u %u %u %u %u %u %" PRIu64 " %" PRIu64 "\n",
+			       stats.qlen, app.memory_used, app.delay_c, app.delay_l,
+			       app.packets_in_c, app.packets_in_l, app.prob, start, end);
+			close(fd);
+			return 0;
+		}
+		if (len) {
+			errno = EPROTO;
+			goto error;
+		}
+	}
+error:
+	perror("RTM_GETQDISC");
+	close(fd);
+	return 1;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned char frame[ETH_FRAME_LEN];
+	struct sockaddr_ll addr = { 0 };
+	unsigned char *ip = frame + ETH_HLEN;
+	unsigned char *udp = ip + 20;
+	uint64_t first, last;
+	unsigned int index;
+	unsigned long ecn, count, len, i;
+	int fd, saved_errno;
+	ssize_t ret;
+
+	if (argc == 3 && !strcmp(argv[1], "--stats"))
+		return read_stats(argv[2]);
+	if (argc == 2 && !strcmp(argv[1], "--now")) {
+		printf("%" PRIu64 "\n", now_us());
+		return 0;
+	}
+	if (argc != 4 && argc != 5) {
+		fprintf(stderr, "usage: %s DEVICE ECN COUNT [FRAME_BYTES]\n",
+			argv[0]);
+		fprintf(stderr, "       %s --now\n", argv[0]);
+		fprintf(stderr, "       %s --stats DEVICE\n", argv[0]);
+		return 2;
+	}
+	ecn = parse_ulong(argv[2], 0, 3);
+	count = parse_ulong(argv[3], 1, 10000);
+	len = argc == 5 ? parse_ulong(argv[4], 64, ETH_FRAME_LEN) : 1024;
+	index = if_nametoindex(argv[1]);
+	if (!index) {
+		perror("if_nametoindex");
+		return 1;
+	}
+	fd = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_IP));
+	if (fd < 0) {
+		saved_errno = errno;
+		perror("socket(AF_PACKET)");
+		return saved_errno == EPERM || saved_errno == EACCES ? 4 : 1;
+	}
+	addr.sll_family = AF_PACKET;
+	addr.sll_protocol = htons(ETH_P_IP);
+	addr.sll_ifindex = index;
+	addr.sll_halen = ETH_ALEN;
+	addr.sll_addr[0] = 2;
+	addr.sll_addr[5] = 2;
+	if (bind(fd, (struct sockaddr *)&addr, sizeof(addr))) {
+		perror("bind(AF_PACKET)");
+		close(fd);
+		return 1;
+	}
+	memset(frame, 0, sizeof(frame));
+	frame[0] = 2;
+	frame[5] = 2;
+	frame[6] = 2;
+	frame[11] = 1;
+	put_be16(frame + 12, ETH_P_IP);
+	ip[0] = 0x45;
+	ip[1] = ecn;
+	put_be16(ip + 2, len - ETH_HLEN);
+	ip[8] = 64;
+	ip[9] = IPPROTO_UDP;
+	ip[12] = 192;
+	ip[14] = 2;
+	ip[15] = 1;
+	ip[16] = 192;
+	ip[18] = 2;
+	ip[19] = 2;
+	put_be16(udp, 4242);
+	put_be16(udp + 2, 4243);
+	put_be16(udp + 4, len - ETH_HLEN - 20);
+	memset(udp + 8, 0x5a, len - ETH_HLEN - 28);
+
+	/* Kernel enqueue timestamps lie between these userspace bounds. */
+	first = now_us();
+	for (i = 0; i < count; i++) {
+		put_be16(ip + 4, i);
+		ip_checksum(ip);
+		do {
+			ret = sendto(fd, frame, len, 0,
+				     (struct sockaddr *)&addr, sizeof(addr));
+		} while (ret < 0 && errno == EINTR);
+		if (ret != (ssize_t)len) {
+			if (ret < 0)
+				perror("sendto(AF_PACKET)");
+			else
+				fprintf(stderr, "short packet send: %zd\n", ret);
+			close(fd);
+			return 1;
+		}
+	}
+	last = now_us();
+	close(fd);
+	printf("%" PRIu64 " %" PRIu64 "\n", first, last);
+	return 0;
+}
diff --git a/tools/testing/selftests/net/dualpi2_head.sh b/tools/testing/selftests/net/dualpi2_head.sh
new file mode 100755
index 0000000000..7dc6c70513
--- /dev/null
+++ b/tools/testing/selftests/net/dualpi2_head.sh
@@ -0,0 +1,350 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+# Check DualPI2 head timestamps after changing queue limits.
+# HFSC with only ls/ul curves holds packets without peeking into DualPI2.
+# This avoids exercising the separate peeked-packet memory accounting path.
+
+source "$(dirname "$(readlink -e "$0")")/lib.sh"
+
+ALL_TESTS="
+	c_dequeue
+	l_dequeue
+	c_empty_trim
+	l_empty_trim
+	c_memory_trim
+	l_memory_trim
+	c_packet_trim
+	l_packet_trim
+	mixed_empty_trim
+	mixed_partial_trim
+	no_trim_change
+"
+
+TC=$(printenv TC || echo tc)
+SENDER="$net_dir/dualpi2_head"
+ns=
+FAIL_REASON=
+
+skip()
+{
+	echo "SKIP: $*"
+	exit "$ksft_skip"
+}
+
+cleanup()
+{
+	cleanup_all_ns
+}
+
+in_ns()
+{
+	ip netns exec "$ns" "$@"
+}
+
+tc_ns()
+{
+	in_ns "$TC" "$@"
+}
+
+fail()
+{
+	FAIL_REASON="$*"
+	return 1
+}
+
+setup_queue()
+{
+	local mode=$1
+
+	tc_ns qdisc del dev dummy0 root >/dev/null 2>&1 || true
+	if [[ $mode == slow ]]; then
+		tc_ns qdisc add dev dummy0 root handle 1: hfsc default 1 || return 1
+		tc_ns class add dev dummy0 parent 1: classid 1:1 \
+			hfsc ls m2 8bit ul m2 8bit || return 1
+		tc_ns qdisc add dev dummy0 parent 1:1 handle 10: dualpi2 \
+			limit 1000 memlimit 1048576 target 60s no_split_gso || return 1
+	else
+		tc_ns qdisc add dev dummy0 root handle 10: dualpi2 \
+			limit 1000 memlimit 1048576 target 60s no_split_gso || return 1
+	fi
+}
+
+send_frames()
+{
+	local bounds
+
+	bounds=$(in_ns "$SENDER" dummy0 "$1" "$2" 1024) ||
+		{ fail "packet sender failed"; return 1; }
+	read -r SEND_START SEND_END <<< "$bounds"
+	[[ $SEND_START =~ ^[0-9]+$ && $SEND_END =~ ^[0-9]+$ ]] ||
+		{ fail "invalid sender timestamps"; return 1; }
+}
+
+snapshot()
+{
+	local stats value
+
+	stats=$(in_ns "$SENDER" --stats dummy0) ||
+		{ fail "cannot read DualPI2 statistics"; return 1; }
+	read -r QLEN MEMORY DELAY_C DELAY_L PKTS_C PKTS_L PROB \
+		READ_START READ_END <<< "$stats"
+	for value in $stats; do
+		[[ $value =~ ^[0-9]+$ ]] ||
+			{ fail "invalid numeric statistics"; return 1; }
+	done
+	[[ -n $READ_END ]] || { fail "incomplete statistics"; return 1; }
+	echo "# qlen=$QLEN memory=$MEMORY delays=$DELAY_C/$DELAY_L prob=$PROB"
+}
+
+check_counts()
+{
+	local ecn=$1 expected=$2
+
+	if (( ecn == 0 )); then
+		(( PKTS_C == expected && PKTS_L == 0 )) ||
+			{ fail "expected C/L counts $expected/0, got $PKTS_C/$PKTS_L"; return 1; }
+	else
+		(( PKTS_C == 0 && PKTS_L == expected )) ||
+			{ fail "expected C/L counts 0/$expected, got $PKTS_C/$PKTS_L"; return 1; }
+	fi
+}
+
+check_empty()
+{
+	(( QLEN == 0 && MEMORY == 0 && DELAY_C == 0 && DELAY_L == 0 )) ||
+		{ fail "empty queue: qlen=$QLEN memory=$MEMORY delays=$DELAY_C/$DELAY_L"
+		  return 1; }
+}
+
+wait_empty()
+{
+	local deadline now
+
+	deadline=$(( $("$SENDER" --now) + 1000000 ))
+	while :; do
+		snapshot || return 1
+		if (( QLEN == 0 )); then
+			check_empty
+			return $?
+		fi
+		now=$("$SENDER" --now) || return 1
+		(( now < deadline )) || { fail "queue did not drain within 1s"; return 1; }
+		sleep 0.01
+	done
+}
+
+prime_slow_queue()
+{
+	local ecn=$1
+
+	setup_queue slow || { fail "HFSC fixture setup failed"; return 1; }
+	# The first frame transmits; the ul curve holds the next for about 1000s.
+	send_frames "$ecn" 1 || return 1
+	wait_empty || return 1
+	check_counts "$ecn" 1 || return 1
+}
+
+normal_dequeue()
+{
+	local ecn=$1
+
+	setup_queue normal || { fail "DualPI2 setup failed"; return 1; }
+	send_frames "$ecn" 4 || return 1
+	wait_empty || return 1
+	check_counts "$ecn" 4 || return 1
+}
+
+full_trim()
+{
+	local ecn=$1 delay immediate_ok=1 immediate_reason
+
+	prime_slow_queue "$ecn" || return 1
+	send_frames "$ecn" 8 || return 1
+	sleep 0.2
+	snapshot || return 1
+	check_counts "$ecn" 9 || return 1
+	delay=$DELAY_C
+	(( ecn != 0 )) && delay=$DELAY_L
+	(( QLEN == 8 && MEMORY > 0 && delay >= 150000 )) ||
+		{ fail "fixture did not retain eight aged packets"; return 1; }
+	tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 memlimit 1 ||
+		{ fail "memory limit change failed"; return 1; }
+	snapshot || return 1
+	if ! check_empty; then
+		immediate_ok=0
+		immediate_reason=$FAIL_REASON
+	fi
+	sleep 0.2
+	snapshot || return 1
+	check_empty || return 1
+	check_counts "$ecn" 9 || return 1
+	(( immediate_ok )) || { fail "$immediate_reason"; return 1; }
+}
+
+check_head_delay()
+{
+	local ecn=$1 start=$2 end=$3 low high delay
+
+	(( READ_END >= READ_START && READ_END - READ_START < 100000 )) ||
+		{ fail "statistics observation exceeded 100ms"; return 1; }
+	# Both kernel enqueue and xstats sampling use CLOCK_MONOTONIC.
+	# Allow 2ms around the userspace bounds. Callers age retained packets
+	# for at least 20ms, so resetting a nonempty queue timestamp cannot pass.
+	low=$(( READ_START - end - 2000 ))
+	high=$(( READ_END - start + 2000 ))
+	(( low > 0 )) || { fail "retained packets were not aged enough"; return 1; }
+	delay=$DELAY_C
+	(( ecn != 0 )) && delay=$DELAY_L
+	echo "# expected head delay $low..$high us; observed $delay us"
+	(( delay >= low && delay <= high )) ||
+		{ fail "head delay $delay outside enqueue bounds $low..$high"; return 1; }
+}
+
+partial_trim()
+{
+	local ecn=$1 trim_kind=$2 start end budget
+
+	prime_slow_queue "$ecn" || return 1
+	send_frames "$ecn" 6 || return 1
+	sleep 0.2
+	send_frames "$ecn" 4 || return 1
+	start=$SEND_START
+	end=$SEND_END
+	snapshot || return 1
+	check_counts "$ecn" 11 || return 1
+	(( QLEN == 10 && MEMORY > 0 && MEMORY % 10 == 0 )) ||
+		{ fail "fixture did not retain ten equal-sized packets"; return 1; }
+	budget=$(( MEMORY / 10 * 4 ))
+	if [[ $trim_kind == memory ]]; then
+		tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 \
+			memlimit "$budget" || { fail "memory trim failed"; return 1; }
+	else
+		# Explicit memlimit avoids the automatic cap derived from limit.
+		tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 \
+			limit 4 memlimit 1048576 || { fail "packet trim failed"; return 1; }
+	fi
+	sleep 0.02
+	snapshot || return 1
+	(( QLEN == 4 && MEMORY == budget )) ||
+		{ fail "trim: qlen=$QLEN memory=$MEMORY expected memory=$budget"; return 1; }
+	check_head_delay "$ecn" "$start" "$end" || return 1
+	if (( ecn == 0 )); then
+		(( DELAY_L == 0 )) || { fail "unused L queue has delay"; return 1; }
+	else
+		(( DELAY_C == 0 )) || { fail "unused C queue has delay"; return 1; }
+	fi
+	check_counts "$ecn" 11 || return 1
+}
+
+mixed_trim()
+{
+	prime_slow_queue 0 || return 1
+	send_frames 0 4 || return 1
+	send_frames 1 4 || return 1
+	sleep 0.2
+	snapshot || return 1
+	(( QLEN == 8 && MEMORY > 0 && PKTS_C == 5 && PKTS_L == 4 &&
+	   DELAY_C >= 150000 && DELAY_L >= 150000 )) ||
+		{ fail "fixture did not retain mixed C/L packets"; return 1; }
+	tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 memlimit 1 ||
+		{ fail "mixed memory trim failed"; return 1; }
+	snapshot || return 1
+	check_empty || return 1
+	(( PKTS_C == 5 && PKTS_L == 4 )) || { fail "mixed counts changed"; return 1; }
+}
+
+mixed_partial()
+{
+	local start end budget
+
+	prime_slow_queue 0 || return 1
+	send_frames 0 4 || return 1
+	send_frames 1 4 || return 1
+	start=$SEND_START
+	end=$SEND_END
+	sleep 0.2
+	snapshot || return 1
+	(( QLEN == 8 && MEMORY > 0 && PKTS_C == 5 && PKTS_L == 4 )) ||
+		{ fail "fixture did not retain mixed C/L packets"; return 1; }
+	budget=$(( MEMORY / 2 ))
+	# The change path drains C first, retaining all four L packets.
+	tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 \
+		limit 4 memlimit 1048576 || { fail "mixed packet trim failed"; return 1; }
+	sleep 0.02
+	snapshot || return 1
+	(( QLEN == 4 && MEMORY == budget && DELAY_C == 0 &&
+	   PKTS_C == 5 && PKTS_L == 4 )) ||
+		{ fail "mixed trim did not drain C and retain L"; return 1; }
+	check_head_delay 1 "$start" "$end"
+}
+
+change_without_trim()
+{
+	local c_start c_end l_start l_end memory
+
+	prime_slow_queue 0 || return 1
+	send_frames 0 4 || return 1
+	c_start=$SEND_START
+	c_end=$SEND_END
+	send_frames 1 4 || return 1
+	l_start=$SEND_START
+	l_end=$SEND_END
+	snapshot || return 1
+	(( QLEN == 8 && MEMORY > 0 && PKTS_C == 5 && PKTS_L == 4 )) ||
+		{ fail "fixture did not retain mixed C/L packets"; return 1; }
+	memory=$MEMORY
+	tc_ns qdisc change dev dummy0 parent 1:1 handle 10: dualpi2 target 120s ||
+		{ fail "target change failed"; return 1; }
+	sleep 0.02
+	snapshot || return 1
+	(( QLEN == 8 && MEMORY == memory && PKTS_C == 5 && PKTS_L == 4 )) ||
+		{ fail "non-trimming change altered queue contents"; return 1; }
+	check_head_delay 0 "$c_start" "$c_end" || return 1
+	check_head_delay 1 "$l_start" "$l_end" || return 1
+}
+
+run_case()
+{
+	local label=$1
+	shift
+
+	RET=0
+	retmsg=
+	FAIL_REASON=
+	if ! "$@"; then
+		check_err 1 "$FAIL_REASON"
+	fi
+	log_test "$label"
+}
+
+c_dequeue() { run_case "C normal dequeue" normal_dequeue 0; }
+l_dequeue() { run_case "L normal dequeue" normal_dequeue 1; }
+c_empty_trim() { run_case "C trim to empty" full_trim 0; }
+l_empty_trim() { run_case "L trim to empty" full_trim 1; }
+c_memory_trim() { run_case "C partial memory trim" partial_trim 0 memory; }
+l_memory_trim() { run_case "L partial memory trim" partial_trim 1 memory; }
+c_packet_trim() { run_case "C partial packet trim" partial_trim 0 packets; }
+l_packet_trim() { run_case "L partial packet trim" partial_trim 1 packets; }
+mixed_empty_trim() { run_case "Mixed C/L trim to empty" mixed_trim; }
+mixed_partial_trim() { run_case "Mixed trim drains C and retains L" mixed_partial; }
+no_trim_change() { run_case "Change without trimming" change_without_trim; }
+
+[[ $(id -u) == 0 ]] || skip "requires root"
+require_command ip
+require_command "$TC"
+require_command "$SENDER"
+
+trap cleanup EXIT
+setup_ns ns || exit "$ksft_skip"
+
+# Prevent unsolicited IPv6 traffic when dummy0 is brought up. IPv6 is optional.
+in_ns sh -c '
+	p=/proc/sys/net/ipv6/conf/default/disable_ipv6
+	[ ! -e "$p" ] || echo 1 > "$p"
+' || exit "$ksft_fail"
+ip -n "$ns" link add dummy0 type dummy || skip "requires dummy interface support"
+ip -n "$ns" link set dummy0 up || exit "$ksft_fail"
+setup_queue slow || skip "requires HFSC, DualPI2 and tc DualPI2 support"
+
+tests_run
+exit "$EXIT_STATUS"
-- 
2.54.0 (Apple Git-157)

