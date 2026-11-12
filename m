Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452861;
	b=Df2rZ4ZPWDwaZgO6aqmlFpgH67x6hsjZNiqo4NY/N36zpkILyFgqH0yfVZNNrwPnDc8l
	 XQJ55IIjnbmGFqorzuWMDAW8Zrmde8VvVA3MK7xv4OvNUyYdo9t6iybYLmqv51exy07NQ
	 SBxFmMfVgDydSP0XEo60cIuRaYh7TNq0EWy3JFlrXR8ZnOQ36KTw/dMnJHYroFp3d/Ync
	 bl4SEHmKUvDETUmo4PaALS9BfYMgZZvyy4EbkvJwS7Ukj6ZpZzFbflHJmglrqwgnH4DbV
	 1ADjuzqrIs9dPn0fhMVXnsAcdD25JNmcbFAPNtCwoMQ33+bM3w18ObLO07ZEnrFh0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452861;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ZmnLfxYwe4poyiIBa66gftbZFHVTpxGNl3PmmLe5ze0=;
	b=Jb0OosjRAH8Kxtsz62ZZ1L4PdVJfcqpsMXdnixB+mJlSA9/8S/fMUjBrV5+Yp/XVg4JA
	 xJvk5aGxIrO/NyQoVwU+JE8etxCywFCu8wOYkqaKQlU3J7ONGlUfEI/L4inA9xzwOfs2H
	 6O4N4lS7xY+54WR2Odv/sqTPdU5Sbam+PPauoBSqaZExESSxGdi5P76SXbFloUk055Ze9
	 /6p7aBb27S0YKb+WLT1cWZEl3KEL0ByspwibQPtGTBurDXqDbMQYeYZKnUWL76C/erFJx
	 BovDuPV5mFQ9SPh3yovQcLDbVcZw9ThsnyDSlKho5Isun29WRmKRv805TeWmuAs7byA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fryer.io;
	spf=pass smtp.mailfrom=fryer.io;
	dkim=pass header.d=fryer.io header.i=@fryer.io header.a=rsa-sha256 header.s=fm2 header.b=hRpcKaR3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yt3zpwnR;
	arc=none smtp.remote-ip=103.168.172.137
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF2606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 03:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fryer.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fryer.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fryer.io header.i=@fryer.io header.a=rsa-sha256 header.s=fm2 header.b=hRpcKaR3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yt3zpwnR
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 913931381075
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:07:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 11 Nov 2026 22:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fryer.io; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1794452860; x=
	1794460060; bh=ZmnLfxYwe4poyiIBa66gftbZFHVTpxGNl3PmmLe5ze0=; b=h
	RpcKaR3acxj70rXRcnFzeHZAl0UPVPN4hWCnH2MtVbwxnacRfjy/jDXfRuQXA6nD
	oxy2JKwynTvdaDNx5+xBqIao3L8dDqpuVn6/Xy3Qr0Qg0ObYy1Ofrq5G3omKRfRM
	fjtTHq2Y3p2rJaNLOliuG6cxghXErRkYjt6alTCkQ5g/vlsI4ukrhxltFEJBJYql
	gVFzhmuMZss3xSVhXsFCNCu+7RZw4LxSwLnzgQj590P+DtQzdpEvCqfeyjXuN/IY
	hMNmRKBO+QeTCMvsp12C2MRd1K6r04W41fw7W5msxuqcwdJ7rwQ6XO6yY4Lq6+0R
	W1m4nkLwiB9P+VqDX5DSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794452860; x=1794460060; bh=Z
	mnLfxYwe4poyiIBa66gftbZFHVTpxGNl3PmmLe5ze0=; b=yt3zpwnRwWRZw+lhH
	mBEdxTpFqXZJ4RIEh4H4yx51DWAytgI9XuHg4VsfNz+OaBflBQoYs6XthIU8zvjc
	NnchYhYZiCV37DsAZ6HcPBcJO4mAhzeUxrhh6u8JJbBKLI3uZHgGNPnF7FE//DO0
	6cMXckC3hlPGwDMOI9PdDalLFFHlr/DgihhB90MKO2cb+Vbu5xfUUvuZwUQK4xv3
	RrN+NpuWODEYr1UXSZbSvFtK91aMpBeFIcUYKllG1leIROyK9LyFJluJIWyCHG/l
	A9g2I9z0O/NXtQdyf0Q5oR75kYSVTwPzRSS2D+0ccgs62JoMhOten9yiOnuB5x6F
	fCptg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fryer.io a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794452860; d=fryer.io;
	mf=PGJyeW9uQGZyeWVyLmlvPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Suul8QfJoVslDgE+ex/Fv9xkZwZoWqkTjpKzCOBXsAbDecz
	zfB4M7grL08FFgjNIOpWVOBSVvcIAIdwCIOcIf6ntKIUWmQ62z7kV6ik7cJVq2jL
	6bGBn9jk65mXvYPjoptAMEzDzgCKUNpGCL23k/7mYbnQvrV+yMBgN0BwDR+ZcqiI
	v7kuG+kDjuCZcNVXtSILC72D9TMPE/Ttlw6cNse2MIpOWY9vrWN0tUG2HnIWA5F9
	ux+Lz98VqJZRYMdD+KkJ8XkZeT8pcJA92H5RpNismHgGRCVT58Y1ZgLiiEdk7Crm
	3hGkDVyy6rQkmJUzM0O9ycSevf4TZG6SZ6rEHiQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SeR/UWS0DyJq+sdp54yqv88lNJq7nsg39fyZZecbCJQ=:mwCubyUoXH9/ErBmxCjWJ0BV4nNf2T3k9IXYARicktY=;
X-ME-Sender: <xms:fC31apXtbykA0ZehQcnEMF4v9i88Fp4bQgSuq4trptG5KBWsmk0_jQ>
    <xme:fC31alfZXGbXlfII_4sXbdbOixAymdchtFAG9DMFuREFXl8jNinL69RpZR0o_njCa
    6auAHvk4WM5-XM4LC58mJCKNTNpPP66Rg8s5KIhA1hHy4osGnZwfHqnjg>
X-ME-Received: <xmr:fC31aibPy56EsmZjtZVsHFoeFZ_eNkVq8eI99hI3FC0ZzGrpzL_MlnxE4nq7GQoJgL0YAF6_uyW-2of8fwmxnS59OA7wz83_gONnGhwwpt756Q>
X-ME-Proxy-Cause: dmFkZTGNqxnAQGo+67LQj2GXGr75Ygk0nC0tJY/emBpSYptZYpDuY6dRlclSjM8m6pm6/r
    sW14kWHXAaTsbZO/1hrKMTQKzUKvmwlouGnavFg7uoUP+8ztbm7fceF7bVebTCuYgVpbW/
    NYl77M7LcKVDFv5yAuLC4kl7LfDVbkgqACXWYm7M3O/HOwhk4IZIrABQCnGy4tafxmPOcA
    FEYgmdAM6p5zC1x0gb1PgVbIlnluDx0mqUXyOiymo+gT/n/nWhLeqOjxpMMs40q4b1pb22
    Cranq6fsp7Sy/eSSjt8cyDRcL65I80gYy7rNmLzlfhyhZG96XIr0uxRZqLOAy6T5hQY1Pr
    2clreLsHoexnDsnXyoM5ccHHR88bCiLtAHUaJIW0wtbI6er/39IGmC6GY0kGuIbAL9Rmia
    6RNmHvGwyuDPwkmANLgwMp/X+pjtM7cJW3vi47Wu1HXzXhLo/gNWjdUfu6z2lelPj2ydPJ
    u1ZICzI/km/dTiox64Z7ZTRMFwCUs9ANiqD9fQfjGWZIEJZsydR9dCxj+u4XTQgxbCuEFW
    Y6Q3POoNwVJsHwtozNHXCyOdkyWFBu5Ko4rws3jZC+aqVrmvwbNKsn6Yq6ryAENJpsTojH
    xgLzCx+mVTosAGFj1OFyPgJkfS5YwHkdPgLtCLAmQkrj1jLlZyF3h+WOFVcA
X-ME-Proxy: <xmx:fC31ahPCHGEFw_UAV77lQj9HLXKK7I7srprUPT2qrciolxbSwNnKJQ>
    <xmx:fC31aoXtcFuJqjsvb30BiTAFt_N4W7KpTnbGZMbM6AP_OlMeBHjsyg>
    <xmx:fC31auLcxOMg53Y9XCRx0gD0L0JwgstQOdcMd1mDIZymUGbt1eiCUA>
    <xmx:fC31arquJ7zjl4YzodsOd1pi4bRgmGJo-vzB_5dTE5bjDrLn4zCHKg>
    <xmx:fC31ar5ONmgUVq-Oc2nes_qUDPlaHBbzNHvFnwtFAK55qxGADTMRpXHG>
Feedback-ID: if1c946a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 22:07:40 -0500 (EST)
From: Bryon Fryer <bryon@fryer.io>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jasowangio@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Subject: [PATCH net 2/2] selftests: net: check UDP tunnel GRO virtio offsets
Date: Wed, 11 Nov 2026 22:07:08 -0500
Message-ID: <20261112030708.1915665-3-bryon@fryer.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112030708.1915665-1-bryon@fryer.io>
References: <20261112030708.1915665-1-bryon@fryer.io>
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

Feed ordinary Geneve/TCP packets through a NAPI TAP and bridge into a
virtio-header TAP. Require a multi-segment GRO aggregate and compare its
exported transport and checksum offsets with parsed wire headers. Include
a GRO-off packet-integrity control. No output or no merge is not a pass.

Signed-off-by: Bryon Fryer <bryon@fryer.io>
---
 tools/testing/selftests/net/tun.c | 292 ++++++++++++++++++++++++++++++
 1 file changed, 292 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 34de2580e3..192b3e0c0d 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -2,17 +2,23 @@
 
 #define _GNU_SOURCE
 
+#include <endian.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <poll.h>
 #include <sched.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <time.h>
 #include <unistd.h>
+#include <linux/ethtool.h>
+#include <linux/sockios.h>
 #include <linux/if_tun.h>
 #include <netinet/tcp.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
+#include <sys/mount.h>
 
 #include "kselftest_harness.h"
 #include "tuntap_helpers.h"
@@ -1130,4 +1136,290 @@ XFAIL_ADD(tun_vnet_udptnl, 6in4_over_maxbytes, recv_gso_packet);
 XFAIL_ADD(tun_vnet_udptnl, 4in6_over_maxbytes, recv_gso_packet);
 XFAIL_ADD(tun_vnet_udptnl, 6in6_over_maxbytes, recv_gso_packet);
 
+/*
+ * Forward ordinary Geneve/TCP frames through a NAPI TAP and bridge to a
+ * second TAP, which exports the still-encapsulated packet with virtio headers.
+ * GRO must retain the outer UDP offset.
+ */
+#define GRO_PACKETS 8
+#define GRO_PAYLOAD 200
+#define GRO_SEQ 0x12345678
+#define GRO_BUFFER_SIZE 4096
+#define GRO_RECEIVE_TIMEOUT_MS 3000
+
+FIXTURE(tun_vnet_gro)
+{
+	char ifname[2][IFNAMSIZ];
+	int fd[2];
+};
+
+FIXTURE_VARIANT(tun_vnet_gro)
+{
+	bool gro;
+};
+
+FIXTURE_VARIANT_ADD(tun_vnet_gro, gro_off)
+{
+	.gro = false,
+};
+
+FIXTURE_VARIANT_ADD(tun_vnet_gro, gro_on)
+{
+	.gro = true,
+};
+
+static int gro_sysfs(const char *dev, const char *attribute, const char *value)
+{
+	char path[128];
+	int fd, ret;
+
+	snprintf(path, sizeof(path), "/sys/class/net/%s/%s", dev, attribute);
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	ret = write(fd, value, strlen(value)) == strlen(value) ? 0 : -1;
+	close(fd);
+	return ret;
+}
+
+FIXTURE_SETUP(tun_vnet_gro)
+{
+	int flags = IFF_TAP | IFF_NO_PI | IFF_VNET_HDR | IFF_NAPI;
+	int features = TUN_F_CSUM | TUN_F_TSO4 | TUN_F_UDP_TUNNEL_GSO |
+		       TUN_F_UDP_TUNNEL_GSO_CSUM;
+	struct ethtool_value value = { .cmd = ETHTOOL_SGRO };
+	struct ifreq ifr = {};
+	int i, sk, little_endian = 1;
+
+	self->fd[0] = -1;
+	self->fd[1] = -1;
+	if (unshare(CLONE_NEWNET | CLONE_NEWNS))
+		SKIP(return, "Cannot create network/mount namespaces: %s",
+		     strerror(errno));
+	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
+	ASSERT_EQ(mount("sysfs", "/sys", "sysfs", 0, NULL), 0);
+	for (i = 0; i < 2; i++) {
+		self->fd[i] = tun_open(self->ifname[i], flags, TUN_VNET_TNL_SIZE,
+				       features, NULL);
+		ASSERT_GE(self->fd[i], 0);
+		ASSERT_EQ(ioctl(self->fd[i], TUNSETVNETLE, &little_endian), 0);
+		ASSERT_EQ(fcntl(self->fd[i], F_SETFL, O_NONBLOCK), 0);
+	}
+	sk = socket(AF_INET, SOCK_DGRAM, 0);
+	ASSERT_GE(sk, 0);
+	ASSERT_EQ(ioctl(sk, SIOCBRADDBR, "gro-br"), 0);
+	strcpy(ifr.ifr_name, "gro-br");
+	for (i = 0; i < 2; i++) {
+		ifr.ifr_ifindex = if_nametoindex(self->ifname[i]);
+		ASSERT_GT(ifr.ifr_ifindex, 0);
+		ASSERT_EQ(ioctl(sk, SIOCBRADDIF, &ifr), 0);
+	}
+	ifr.ifr_flags = IFF_UP;
+	ASSERT_EQ(ioctl(sk, SIOCSIFFLAGS, &ifr), 0);
+	strcpy(ifr.ifr_name, self->ifname[0]);
+	value.data = variant->gro;
+	ifr.ifr_data = (void *)&value;
+	ASSERT_EQ(ioctl(sk, SIOCETHTOOL, &ifr), 0);
+	close(sk);
+	/* Register the Geneve UDP GRO handler in this network namespace. */
+	ASSERT_EQ(geneve_create(param_dev_geneve_name, AF_INET,
+				&param_ipaddr4_outer_dst, param_hwaddr_inner_src), 0);
+	/* Defer NAPI flushing for 20 ms so ordinary writes can aggregate. */
+	ASSERT_EQ(gro_sysfs(self->ifname[0], "gro_flush_timeout", "20000000"), 0);
+	ASSERT_EQ(gro_sysfs(self->ifname[0], "napi_defer_hard_irqs", "1"), 0);
+}
+
+FIXTURE_TEARDOWN(tun_vnet_gro)
+{
+	int i;
+
+	for (i = 0; i < 2; i++)
+		if (self->fd[i] >= 0)
+			close(self->fd[i]);
+}
+
+static int gro_build_packet(uint8_t *buf, unsigned int index)
+{
+	uint8_t *cur = buf + TUN_VNET_TNL_SIZE;
+	struct iphdr *outer, *inner;
+	struct udphdr *udp;
+	struct tcphdr *tcp;
+	unsigned int i, len;
+	uint32_t sum;
+
+	memset(buf, 0, GRO_BUFFER_SIZE);
+	cur += build_eth(cur, ETH_P_IP, param_hwaddr_outer_src,
+			 param_hwaddr_outer_dst);
+	outer = (void *)cur;
+	cur += sizeof(*outer);
+	udp = (void *)cur;
+	cur += sizeof(*udp);
+	cur += build_geneve_header(cur, VN_ID);
+	cur += build_eth(cur, ETH_P_IP, param_hwaddr_inner_src,
+			 param_hwaddr_inner_dst);
+	inner = (void *)cur;
+	cur += sizeof(*inner);
+	tcp = (void *)cur;
+	tcp->source = htons(49152);
+	tcp->dest = htons(5201);
+	tcp->seq = htonl(GRO_SEQ + index * GRO_PAYLOAD);
+	tcp->ack_seq = htonl(1);
+	tcp->doff = sizeof(*tcp) / 4;
+	tcp->ack = 1;
+	tcp->psh = index == GRO_PACKETS - 1;
+	tcp->window = htons(32768);
+	cur += sizeof(*tcp);
+	for (i = 0; i < GRO_PAYLOAD; i++)
+		*cur++ = (index * GRO_PAYLOAD + i) & 0xff;
+	len = cur - (uint8_t *)tcp;
+	build_ipv4_header((void *)inner, IPPROTO_TCP, len,
+			  &param_ipaddr4_inner_src, &param_ipaddr4_inner_dst);
+	inner->id = htons(index + 1);
+	inner->check = 0;
+	inner->check = build_ip_csum((void *)inner, sizeof(*inner), 0);
+	sum = add_csum((void *)&inner->saddr, 2 * sizeof(inner->saddr));
+	sum += htons(IPPROTO_TCP) + htons(len);
+	tcp->check = build_ip_csum((void *)tcp, len, sum);
+	len = cur - (uint8_t *)udp;
+	build_udp_header((void *)udp, 49152, VN_PORT, len - sizeof(*udp));
+	build_ipv4_header((void *)outer, IPPROTO_UDP, len,
+			  &param_ipaddr4_outer_src, &param_ipaddr4_outer_dst);
+	outer->id = htons(index + 1);
+	outer->check = 0;
+	outer->check = build_ip_csum((void *)outer, sizeof(*outer), 0);
+	sum = add_csum((void *)&outer->saddr, 2 * sizeof(outer->saddr));
+	sum += htons(IPPROTO_UDP) + htons(len);
+	udp->check = build_ip_csum((void *)udp, len, sum);
+	if (!udp->check)
+		udp->check = 0xffff;
+	return cur - buf;
+}
+
+static int64_t gro_milliseconds(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return ts.tv_sec * 1000LL + ts.tv_nsec / 1000000;
+}
+
+TEST_F(tun_vnet_gro, outer_transport_header)
+{
+	uint8_t input[GRO_BUFFER_SIZE], output[GRO_BUFFER_SIZE];
+	unsigned int seen = 0, aggregates = 0, records = 0;
+	/* Bound the wait even if forwarding fails or packets are lost. */
+	int64_t deadline = gro_milliseconds() + GRO_RECEIVE_TIMEOUT_MS;
+	struct pollfd pfd = { .fd = self->fd[1], .events = POLLIN };
+	int i, len, frame_len, ready;
+
+	/* Input virtio headers are zero: only ordinary packets enter GRO. */
+	for (i = 0; i < GRO_PACKETS; i++) {
+		len = gro_build_packet(input, i);
+		ASSERT_EQ(write(self->fd[0], input, len), len);
+	}
+	while (gro_milliseconds() < deadline) {
+		struct virtio_net_hdr_v1_hash_tunnel *tunnel = (void *)output;
+		struct virtio_net_hdr_v1 *vh = &tunnel->hash_hdr.hdr;
+		uint8_t *frame = output + TUN_VNET_TNL_SIZE;
+		struct iphdr outer, inner;
+		struct tcphdr tcp;
+		struct udphdr udp;
+		unsigned int outer_th, inner_nh, inner_th, header_len;
+		unsigned int offset, payload, first, segments, bit;
+
+		ready = poll(&pfd, 1, 50);
+		ASSERT_GE(ready, 0);
+		if (!ready) {
+			if (seen == (1U << GRO_PACKETS) - 1)
+				break;
+			continue;
+		}
+		ASSERT_NE(pfd.revents & POLLIN, 0);
+		ASSERT_LT(records++, 128);
+		len = read(self->fd[1], output, sizeof(output));
+		ASSERT_GE(len, TUN_VNET_TNL_SIZE + ETH_HLEN);
+		frame_len = len - TUN_VNET_TNL_SIZE;
+		if (memcmp(frame, param_hwaddr_outer_dst, ETH_ALEN) ||
+		    memcmp(frame + ETH_ALEN, param_hwaddr_outer_src, ETH_ALEN))
+			continue;
+		ASSERT_EQ(((struct ethhdr *)frame)->h_proto, htons(ETH_P_IP));
+		ASSERT_GE(frame_len, ETH_HLEN + sizeof(outer));
+		memcpy(&outer, frame + ETH_HLEN, sizeof(outer));
+		ASSERT_EQ((int)outer.version, 4);
+		ASSERT_GE(outer.ihl * 4, sizeof(outer));
+		ASSERT_EQ(outer.protocol, IPPROTO_UDP);
+		outer_th = ETH_HLEN + outer.ihl * 4;
+		ASSERT_GE(frame_len, outer_th + sizeof(udp) + GENEVE_HLEN);
+		memcpy(&udp, frame + outer_th, sizeof(udp));
+		ASSERT_EQ(udp.dest, htons(VN_PORT));
+		ASSERT_EQ(ntohs(outer.tot_len), frame_len - ETH_HLEN);
+		ASSERT_EQ(build_ip_csum(frame + ETH_HLEN, outer.ihl * 4, 0), 0);
+		ASSERT_EQ(ntohs(udp.len), frame_len - outer_th);
+		offset = outer_th + sizeof(udp);
+		ASSERT_EQ(frame[offset] >> 6, 0);
+		ASSERT_EQ(frame[offset + 2], ETH_P_TEB >> 8);
+		ASSERT_EQ(frame[offset + 3], ETH_P_TEB & 0xff);
+		offset += GENEVE_HLEN + (frame[offset] & 0x3f) * 4;
+		inner_nh = offset + ETH_HLEN;
+		ASSERT_GE(frame_len, inner_nh + sizeof(inner));
+		ASSERT_EQ(((struct ethhdr *)(frame + offset))->h_proto,
+			  htons(ETH_P_IP));
+		memcpy(&inner, frame + inner_nh, sizeof(inner));
+		ASSERT_EQ((int)inner.version, 4);
+		ASSERT_GE(inner.ihl * 4, sizeof(inner));
+		ASSERT_EQ(inner.protocol, IPPROTO_TCP);
+		ASSERT_EQ(ntohs(inner.tot_len), frame_len - inner_nh);
+		inner_th = inner_nh + inner.ihl * 4;
+		ASSERT_GE(frame_len, inner_th + sizeof(tcp));
+		ASSERT_EQ(build_ip_csum(frame + inner_nh, inner.ihl * 4, 0), 0);
+		memcpy(&tcp, frame + inner_th, sizeof(tcp));
+		ASSERT_GE(tcp.doff * 4, sizeof(tcp));
+		header_len = inner_th + tcp.doff * 4;
+		ASSERT_GE(frame_len, header_len);
+		payload = frame_len - header_len;
+		ASSERT_GT(payload, 0);
+		ASSERT_EQ(payload % GRO_PAYLOAD, 0);
+		offset = ntohl(tcp.seq) - GRO_SEQ;
+		ASSERT_EQ(offset % GRO_PAYLOAD, 0);
+		ASSERT_LT(offset, GRO_PACKETS * GRO_PAYLOAD);
+		ASSERT_LE(offset + payload, GRO_PACKETS * GRO_PAYLOAD);
+		for (i = 0; i < payload; i++)
+			ASSERT_EQ(frame[header_len + i], (offset + i) & 0xff);
+		first = offset / GRO_PAYLOAD;
+		segments = payload / GRO_PAYLOAD;
+		for (bit = first; bit < first + segments; bit++) {
+			ASSERT_EQ(seen & (1U << bit), 0);
+			seen |= 1U << bit;
+		}
+		if (!variant->gro || vh->gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+			ASSERT_EQ(vh->gso_type, VIRTIO_NET_HDR_GSO_NONE);
+			ASSERT_EQ(segments, 1);
+			ASSERT_EQ(le16toh(vh->gso_size), 0);
+			ASSERT_EQ(gro_build_packet(input, first), len);
+			ASSERT_EQ(memcmp(frame, input + TUN_VNET_TNL_SIZE, frame_len), 0);
+			continue;
+		}
+		ASSERT_EQ(vh->gso_type, VIRTIO_NET_HDR_GSO_TCPV4 |
+			  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4);
+		ASSERT_EQ(le16toh(vh->gso_size), GRO_PAYLOAD);
+		if (segments > 1)
+			aggregates++;
+		TH_LOG("segments=%u outer_th=%u expected=%u inner_nh=%u",
+		       segments, le16toh(tunnel->outer_th_offset), outer_th,
+		       le16toh(tunnel->inner_nh_offset));
+		EXPECT_EQ(le16toh(tunnel->outer_th_offset), outer_th);
+		EXPECT_EQ(le16toh(tunnel->inner_nh_offset), inner_nh);
+		EXPECT_EQ(le16toh(vh->csum_start), inner_th);
+		EXPECT_EQ(le16toh(vh->csum_offset), offsetof(struct tcphdr, check));
+		/* hdr_len may include the payload kept in the linear head. */
+		EXPECT_GE(le16toh(vh->hdr_len), header_len);
+		EXPECT_LE(le16toh(vh->hdr_len), frame_len);
+		EXPECT_EQ(vh->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM,
+			  VIRTIO_NET_HDR_F_NEEDS_CSUM);
+	}
+	ASSERT_EQ(seen, (1U << GRO_PACKETS) - 1);
+	if (variant->gro && !aggregates && _metadata->exit_code != KSFT_FAIL)
+		SKIP(return, "No multi-segment GRO aggregate observed");
+}
+
 TEST_HARNESS_MAIN
-- 
2.47.3

