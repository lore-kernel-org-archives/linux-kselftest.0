Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953748;
	b=Mr+5Lzd1e7/4LP1j53I0le+kwPk4eVCt6IQfnuVIvXyAvKF/EZ6g07b0EbgMf0+VWujS
	 H8fAq8KG+f7xrYpgBX+FUyRwJF1Vl4lUrsoerlFUyA6+Bhr6NUoli9VoKUXOivPb99nzp
	 n3dG6ya8tBFG/FgcU6hWcU3wDPyfx/D/XyLgZVOIR5gIn0iMYY/oRxZk7el3YcxR9jV1Z
	 GDFBxYq76TMcoGYbGd+nNW36O2hG7971gDJSDKYcnLAJ99VsBGmGZWLXphSNkOF1lkVnu
	 2G7sEqEowkc+AoTmvBeOZbJPimv0yoptLXPppAVHKlF85V6+5XwOgwYK7BJMasSKafQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AZHXuTpvjL8YqhWEhQ1jqpW7IzsSqJlyudmwqHrXw4E=;
	b=bx72HIeD1jSaoXG/uNKp31RAv/CTte3gqPhHlWiEGnewaP3XUDcdyOCCrP9SBdRQBwB5
	 kxEZuWCbFq6BLSFVfZUkmDxkeN7Lt/KUWpiDz4pdWTto5ler0KJgJypioWB6d0mknvN8G
	 qpl5tvHjP14g5M03PcDZSkmouCnzQZqP4GbKyBTs3bVm6Jj+lEroLcCYfta57BPjjm4vz
	 /wCm0dxNzimpZeLGmcC+Zf5Pms3Bx7K0i3KWoitIwotg70qwLor+5qn3bvmGxD6zQCGmH
	 BqRvs4eS3hwEuu7O7LkEyjoZchPkKh+m7hsfk5JWv86ndAA74bb00wE1DPQqMkJBjoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fmv/Oo4T";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BD606A335
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975BD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fmv/Oo4T
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso199709a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953747; x=1795558547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZHXuTpvjL8YqhWEhQ1jqpW7IzsSqJlyudmwqHrXw4E=;
        b=fmv/Oo4TBW/XcKoqfWKKj1J4hyvG872LMmBWyqpkKrXdnhCCxdexUFiK9409hAwxL7
         X5HsJ3Edvf4zeYiAA+OriZEMrw5R0sQxzDl4FekSPn790JY75sRGSexKoswS5Iu/U6rg
         a0uVnhz+Hn1iod8wGI7Yh0bOXof+8gRL7fqG93VVvVJDWvcdSKH5A50BFGbhhWnhOvqR
         wQihR2JSkw4bbJRNRbFquFXfXCVl4yfHw7sO1/HqIRNsqsdFfsK804pt1n0OtKwP5AH8
         FV0BFIvcYIFyX1/o6sxezi7OHUD+qXbPGWkfd+xbX1l8LTTZ3QVizN0xH+rbXDvOydAA
         0S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953747; x=1795558547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZHXuTpvjL8YqhWEhQ1jqpW7IzsSqJlyudmwqHrXw4E=;
        b=MlyGKT6a6k2/v/luRop+h7r2ukZsp1Sn4XSbsocANsbVvpDwDWHV2GFcy3l2xR5Ibr
         d4mb5aS/isxvlvpMqcCPom1iVwOaBoMSelfyl9IVcBWRPcp14GeQvn3bfvLw0YJ/Z2yH
         QOHiRzPjfuf0rEB83TBK0t2Re3txZKJNwJooYt0MsHQIk83hgXB92aPs+z1EoKYh/EZx
         ST9CxZg4wsjBbjwRZRBq3zs8tvrNgicEEZ4K8stSA9pIYpe3QxXTUUgNZbMcjyO88qUC
         uUI5Sww0Q31e3+DmvcZXYVUuIcDKWJGeJvmQZI1q3jn0LgedFaYkvH/SFM+drEC9vEqY
         xTlw==
X-Forwarded-Encrypted: i=1; AL+hErHIViwsC+7hVEk9Rsft14ICUWpIiJMD5tD5KUk5FjxwXzNzYAAucBZSoQOzO3qhl9UkBMbqIhoDihUQLATHNe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z84ZyOt3qsGb8ApquoKqASyZ9EtAbqty2i5FS083P6OAnYZQOeO
	Gzx9mjhBqwyo67ep1yrypGGMlVdI2d5datdw7dHpIkNtePHRtDW8NND5Y6UP8OsV/7A=
X-Gm-Gg: AZFdTZd1rsINxlS4G9Sh38MlaSv4L0mfLAkZuBJ9Hfjs+3g1bnvBoxzY4cUg0XT7+9A
	901+3tsyXtpkDP2qhHt969W9QIZ/4oQdfZI1hH5p5MKnzMMWcgOh1Fo4uUsVN3vCkpFbFH/XNWo
	hp0u5hREi+/sAZErMay2sdYS9RjbMBTPbfDj+zEYWLTkJt0PIkz4WdGMCiyAR9eRn91AKIDRIg0
	6cc2/eJxvo6ZonN+uxOhYhDRQS1L/UaZv2M1xYMX7mBtnaaaiGe12DPQdcAGg+URBymJ5Fot2Pa
	1WMTrSGMtlsPE9up6j7nZP/JbFZWIYX8NGAfl5dPqzSdYDMJWzKmTHdxK9Fkzie3t/e7bRruAgb
	At1DdoVOp/ufdzQQE2+JHR4TMnMMi98Dlil7Z/KK43nvFNWk5feLf2wTFrk09lyhPLsmWvUc7ND
	fjomFUKwQd9VCmiCBZamMF/viOPX42R+rzlaQGVuXV+Z5xtM78K/kV8cGDXyMgeDX29zj5YD6DX
	L50JwOhkcw8YGKybfax67U5wmvl/LiW+1/6Z9iPPOb8PgoY08ybxd48ifQIx5ne3mPl6oSQmlGd
	b4m3EqZkczPM9shOjJJLlDWmhb5RitAXbM7IWz/Y7MBVH2YJwVu6OXrtNQ1JpbQfGiKlgA==
X-Received: by 2002:a17:90b:4b:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b3d0764a74mr657012a91.33.1794953746778;
        Tue, 17 Nov 2026 14:15:46 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:45 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 3/3] selftests: net: netlink-dumps: test dump of route larger than skb
Date: Tue, 17 Nov 2026 14:13:44 -0800
Message-ID: <20261117221538.184948-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117221538.184948-1-stephen@networkplumber.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
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

Add IPv4 and IPv6 multipath routes that do not fit in the first dump
skb of a fresh socket. The dump must return the route or fail with
-EMSGSIZE, not end with status 0.

Each nexthop carries a gateway so the dumped route grows faster than
the kernel side fib_info. A gateway-less IPv4 nexthop only adds 8 bytes
to the dump, which would need enough nexthops to make fib_create_info()
attempt a high order allocation.

IPv6 nexthops cannot use lo, so create a dummy device and generalize
lo_set_up() to if_set_up(). Add the IPv4 routing options to config.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/config          |   3 +
 tools/testing/selftests/net/netlink-dumps.c | 297 +++++++++++++++++++-
 2 files changed, 296 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index dab62cdfa27b..e1049830d34a 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -33,6 +33,8 @@ CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_TARGET_REJECT=m
 CONFIG_IP_MROUTE=y
 CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_IPTABLES_LEGACY=m
@@ -42,6 +44,7 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_FOU=m
diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
index 4a94a25167e2..391ce59fcc30 100644
--- a/tools/testing/selftests/net/netlink-dumps.c
+++ b/tools/testing/selftests/net/netlink-dumps.c
@@ -263,11 +263,11 @@ TEST(close_with_ref)
 	usleep(100 * 1000);
 }
 
-static int lo_set_up(int sock, bool up)
+static int if_set_up(int sock, const char *name, bool up)
 {
 	struct ifreq ifr = {};
 
-	strcpy(ifr.ifr_name, "lo");
+	strcpy(ifr.ifr_name, name);
 	if (ioctl(sock, SIOCGIFFLAGS, &ifr))
 		return -1;
 	if (up)
@@ -321,12 +321,12 @@ TEST(dump_with_queued_ntf)
 		       sizeof(addr)), 0);
 
 	// A large read makes the kernel attempt large dump skbs
-	ASSERT_EQ(lo_set_up(inet_sock, true), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
 	n = recv(netlink_sock, buf, sizeof(buf), 0);
 	ASSERT_GE(n, (ssize_t)sizeof(struct nlmsghdr));
 
 	// Leave one notification queued, then start the dump
-	ASSERT_EQ(lo_set_up(inet_sock, false), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", false), 0);
 	n = send(netlink_sock, &dump_links, sizeof(dump_links), 0);
 	ASSERT_EQ(n, sizeof(dump_links));
 
@@ -362,4 +362,293 @@ TEST(dump_with_queued_ntf)
 	close(inet_sock);
 }
 
+#define BIG_RT_TABLE	100
+#define BIG_RT_IFINDEX	100
+#define BIG_RT4_NH	400
+#define BIG_RT6_NH	500
+
+static const struct {
+	struct nlmsghdr nlhdr;
+	struct ifinfomsg ifm;
+	struct nlattr name_hdr;
+	char name[8];
+	struct nlattr linkinfo_hdr;
+	struct nlattr kind_hdr;
+	char kind[8];
+} new_dummy = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_dummy),
+		.nlmsg_type	= RTM_NEWLINK,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.ifm = {
+		.ifi_family	= AF_UNSPEC,
+		.ifi_index	= BIG_RT_IFINDEX,
+	},
+	.name_hdr = {
+		.nla_len	= 4 + sizeof("dummy0"),
+		.nla_type	= IFLA_IFNAME,
+	},
+	.name = "dummy0",
+	.linkinfo_hdr = {
+		.nla_len	= 4 + 4 + 8,
+		.nla_type	= IFLA_LINKINFO,
+	},
+	.kind_hdr = {
+		.nla_len	= 4 + sizeof("dummy"),
+		.nla_type	= IFLA_INFO_KIND,
+	},
+	.kind = "dummy",
+};
+
+struct rtnexthop4 {
+	struct rtnexthop rtnh;
+	struct nlattr gw_hdr;
+	__u8 gw[4];
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+	struct nlattr dst_hdr;
+	__u8 dst[4];
+	struct nlattr table_hdr;
+	__u32 table;
+	struct nlattr mp_hdr;
+	struct rtnexthop4 nh[BIG_RT4_NH];
+} new_route4 = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_route4),
+		.nlmsg_type	= RTM_NEWROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.rtm = {
+		.rtm_family	= AF_INET,
+		.rtm_dst_len	= 24,
+		.rtm_protocol	= RTPROT_STATIC,
+		.rtm_scope	= RT_SCOPE_UNIVERSE,
+		.rtm_type	= RTN_UNICAST,
+	},
+	.dst_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_DST,
+	},
+	.dst = { 198, 51, 100, 0 },
+	.table_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_TABLE,
+	},
+	.table = BIG_RT_TABLE,
+	.mp_hdr = {
+		.nla_len	= 4 + sizeof(new_route4.nh),
+		.nla_type	= RTA_MULTIPATH,
+	},
+};
+
+struct rtnexthop6 {
+	struct rtnexthop rtnh;
+	struct nlattr gw_hdr;
+	__u8 gw[16];
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+	struct nlattr dst_hdr;
+	__u8 dst[16];
+	struct nlattr table_hdr;
+	__u32 table;
+	struct nlattr mp_hdr;
+	struct rtnexthop6 nh[BIG_RT6_NH];
+} new_route6 = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_route6),
+		.nlmsg_type	= RTM_NEWROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.rtm = {
+		.rtm_family	= AF_INET6,
+		.rtm_dst_len	= 64,
+		.rtm_protocol	= RTPROT_STATIC,
+		.rtm_scope	= RT_SCOPE_UNIVERSE,
+		.rtm_type	= RTN_UNICAST,
+	},
+	.dst_hdr = {
+		.nla_len	= 4 + 16,
+		.nla_type	= RTA_DST,
+	},
+	.dst = { 0x20, 0x01, 0x0d, 0xb8 }, // 2001:db8::/64
+	.table_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_TABLE,
+	},
+	.table = BIG_RT_TABLE,
+	.mp_hdr = {
+		.nla_len	= 4 + sizeof(new_route6.nh),
+		.nla_type	= RTA_MULTIPATH,
+	},
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+} dump_routes = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(dump_routes),
+		.nlmsg_type	= RTM_GETROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_DUMP,
+		.nlmsg_seq	= 2,
+	},
+	.rtm = {
+		.rtm_table	= BIG_RT_TABLE,
+	},
+};
+
+static int nl_request_ack(int sock, const void *req, size_t len)
+{
+	struct nlmsghdr *nlh;
+	char buf[4096];
+	ssize_t n;
+
+	if (send(sock, req, len, 0) != (ssize_t)len)
+		return -errno;
+	n = recv(sock, buf, sizeof(buf), 0);
+	if (n < 0)
+		return -errno;
+	nlh = (struct nlmsghdr *)buf;
+	if (!NLMSG_OK(nlh, n) || nlh->nlmsg_type != NLMSG_ERROR)
+		return -EPROTO;
+	return *(int *)NLMSG_DATA(nlh);
+}
+
+// Dump table BIG_RT_TABLE on a fresh socket, so the first dump skb is
+// small, and count routes. The table holds only one route, too large for
+// that skb. Returns the status from NLMSG_DONE or NLMSG_ERROR.
+static int dump_big_table(struct __test_metadata *_metadata, int family,
+			  int *routes)
+{
+	int netlink_sock, i, ret = 1;
+	char buf[32768];
+	int one = 1;
+	ssize_t n;
+
+	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	ASSERT_GE(netlink_sock, 0);
+	ASSERT_EQ(setsockopt(netlink_sock, SOL_NETLINK, NETLINK_GET_STRICT_CHK,
+			     &one, sizeof(one)), 0);
+
+	dump_routes.rtm.rtm_family = family;
+	n = send(netlink_sock, &dump_routes, sizeof(dump_routes), 0);
+	ASSERT_EQ(n, sizeof(dump_routes));
+
+	*routes = 0;
+	for (i = 0; i < 100 && ret > 0; i++) {
+		struct nlmsghdr *nlh;
+
+		n = recv(netlink_sock, buf, sizeof(buf), 0);
+		ASSERT_GE(n, 0);
+
+		for (nlh = (struct nlmsghdr *)buf; NLMSG_OK(nlh, n);
+		     nlh = NLMSG_NEXT(nlh, n)) {
+			if (nlh->nlmsg_type == RTM_NEWROUTE)
+				(*routes)++;
+			if (nlh->nlmsg_type == NLMSG_DONE ||
+			    nlh->nlmsg_type == NLMSG_ERROR) {
+				ret = *(int *)NLMSG_DATA(nlh);
+				break;
+			}
+		}
+	}
+	EXPECT_LE(ret, 0);
+
+	close(netlink_sock);
+	return ret;
+}
+
+// A route that doesn't fit in the first dump skb must either be dumped or
+// end the dump with EMSGSIZE. It must not end the dump as if complete.
+TEST(dump_large_route)
+{
+	int netlink_sock, inet_sock, i, ret, routes;
+	int one = 1;
+
+	ret = unshare(CLONE_NEWNET);
+	if (ret && errno == EPERM)
+		SKIP(return, "Needs CAP_SYS_ADMIN for a netns");
+	ASSERT_EQ(ret, 0);
+
+	inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
+	ASSERT_GE(inet_sock, 0);
+	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	ASSERT_GE(netlink_sock, 0);
+
+	// Without this an error ACK echoes the whole request back, which
+	// does not fit in the buffer in nl_request_ack(), hiding the errno.
+	ASSERT_EQ(setsockopt(netlink_sock, SOL_NETLINK, NETLINK_CAP_ACK,
+			     &one, sizeof(one)), 0);
+
+	ret = nl_request_ack(netlink_sock, &new_dummy, sizeof(new_dummy));
+	if (ret == -EOPNOTSUPP)
+		SKIP(return, "Needs CONFIG_DUMMY");
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "dummy0", true), 0);
+
+	for (i = 0; i < BIG_RT4_NH; i++) {
+		struct rtnexthop4 *nh = &new_route4.nh[i];
+
+		// Gateways make each dumped nexthop larger, so fewer
+		// kernel side fib_nh entries are needed to overflow the
+		// first dump skb. RTNH_F_ONLINK avoids needing a route
+		// to reach them.
+		nh->rtnh.rtnh_len = sizeof(*nh);
+		nh->rtnh.rtnh_flags = RTNH_F_ONLINK;
+		nh->rtnh.rtnh_ifindex = BIG_RT_IFINDEX;
+		nh->gw_hdr.nla_len = sizeof(nh->gw_hdr) + sizeof(nh->gw);
+		nh->gw_hdr.nla_type = RTA_GATEWAY;
+		nh->gw[0] = 198; // 198.18.x.x, unique per nexthop
+		nh->gw[1] = 18;
+		nh->gw[2] = (i + 1) >> 8;
+		nh->gw[3] = (i + 1) & 0xff;
+	}
+	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route4,
+				 sizeof(new_route4)), 0);
+
+	for (i = 0; i < BIG_RT6_NH; i++) {
+		struct rtnexthop6 *nh = &new_route6.nh[i];
+
+		nh->rtnh.rtnh_len = sizeof(*nh);
+		nh->rtnh.rtnh_ifindex = BIG_RT_IFINDEX;
+		nh->gw_hdr.nla_len = sizeof(nh->gw_hdr) + sizeof(nh->gw);
+		nh->gw_hdr.nla_type = RTA_GATEWAY;
+		nh->gw[0] = 0xfe; // fe80::<i + 1>
+		nh->gw[1] = 0x80;
+		nh->gw[14] = (i + 1) >> 8;
+		nh->gw[15] = (i + 1) & 0xff;
+	}
+	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route6,
+				 sizeof(new_route6)), 0);
+
+	// A socket remembers the largest read done on it and uses that
+	// for later dump skbs, so dump on fresh sockets to keep the
+	// first dump skb at NLMSG_GOODSIZE.
+	close(netlink_sock);
+
+	ret = dump_big_table(_metadata, AF_INET, &routes);
+	if (ret != -EMSGSIZE)
+		EXPECT_EQ(routes, 1);
+
+	ret = dump_big_table(_metadata, AF_INET6, &routes);
+	if (ret != -EMSGSIZE)
+		EXPECT_EQ(routes, 1);
+
+	close(inet_sock);
+}
+
 TEST_HARNESS_MAIN
-- 
2.53.0

