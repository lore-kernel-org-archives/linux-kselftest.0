Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331773;
	b=a29xuYMZpam+LDI032VEavo0Mr8bfQag9YQy0r0zEE6t4MqYvxPDHW9OipLyNTCHyaj1
	 OvlDIomSjmjyMYDWHWcX2FK/wIJjCcigosVwMaK0tRxN6AobW0Mc6nSBN2a/Lrq/RG/CK
	 W59b+5o6lQBaOljO2HqTMqONtC28V0KWwNc+rxMshoTgiPtWnAVOw56B27V1jZjmh6AOi
	 lrLyQEp1OmJQQaLXoVSASIU0su46CgcZPM06aieT7uBqcolXYkcXKrZTcZCJIPiMs8sVi
	 PF6u/3HScwS79Dnyb2xHckC6flAi8TSInVUoXusRMQBmRPotW7BcrZSsuZSNBioupPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
	b=P657ZO8jK3Fjqe1Bbp1SLhvHmEentMZPYNHqr4lefKxiafyKh4zfKEN9ftG0q+oa8PfB
	 /dr6yhhB9mnO2mdzY2f1E/zn4f5irS2rR4UgqUjBBQouxpp1EA4EzStJEPxY8ocqwFHo6
	 07GxsatLxkk6/VrxpXTJQCNVFj8SkaHjNMFoOnX15f1LXwPZCy8E+62qB8L/UDDQR6VaL
	 sw8dfMDbaGIEYv/wzbWdIucEu4qwgPItMVPIItHV4t7tUiCiML1w9yTcNxES52dYWnARj
	 Vcnw9Xfk18GmMZNly/gpg+g700tG4w2jf8b0Pkjv5kSBDVPWFAyky47SIB4Mey6XbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K8svwTEZ;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6171606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6171606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K8svwTEZ
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a07078200fso989004b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794331772; x=1794936572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
        b=K8svwTEZd2HRzzn1CnYxhrOi/3XxGADM0ZIAURO93se/tbSpcD6bfCGozhZQvRZ960
         aVE+ONOLhxL236MdIchKlAyfSPNU5GFRD9DDWtl1tGMx100ZAN6lv9xuUa2h0oMrbB8M
         oisJBqykyqWQJoQLeJMTjRnvoXBMgV/aNAtqhlAirqAp/Ca76qJoSvC00Q0TScNeU2D6
         TfWB6W/FqyUu1ibul3a12P1+NWuRyb++I9CvfY+Vozo+HotPzXFBWiv4kQiSHGP75QXv
         QqjBthDU6OwsTcf4UWRvgMjod5srfOYtvt7SmpferJF2XQykWhLSah+08vIKIocpDdMf
         U1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331772; x=1794936572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
        b=eOZ5ltMGoZAbrB85KqvO9CJ84Jzhbs16BmEspeo/36r2Mod5gMdjqKmLwu+zsRWyL9
         Cywt+eGpH+lDtO0AJ8feWEpLObtNkSNgoQ/iMmsbjn0tz4jnk76yvDVc3rR9nttXsh3x
         nxlZuAHTmoTgzg99d3BT/8VR3zcboxgN20ub5Yce2XGDLo61CasGUmpYEOtPIR4WOt8V
         WebwnTA8ztmJWIAca8Df73oQTianlt64sMs6qHYbi1gsrWGI2WxhZVaZED7Nw+S7zyEQ
         ibGRb2IhOwtCIqjOdEkWlp4pyhbjGScio31uYhOdz3SCKBvCeVZByTQBNvdglCCG3gwS
         uVAQ==
X-Forwarded-Encrypted: i=1; AL+hErGy64u3mlDLI5vNgsKb7EZYmE3It6kv/dmiwrMs/sQihKVJO7LVjhY2D82F/c0ahExD+fdDLT/dBXh9mX9qfE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tiXXk+IHEzY+e8VeQYJtD8zAQ8m+Y9jiynzdrVp5Yz5EirrJm
	w9BYBxx0tUZSODr18iYEqg7qcuZLo4AtpXjunN8QW3oBdU3U9xwdIRaS5QN6nWmrtgo=
X-Gm-Gg: AYBFou1UsY5zFY3geaRXn1ww0rLOrMPqBbJ4c+pDX078uR3lMdQ+nh8leInwMy+Ne/f
	L6vKXK+TXqFIrS+IWgAYXjk485pYMCxcz35HnT+e7x++hGWKxd/q5/QRp0Q+W2mFAyyNx/+6rtA
	sZ9vIZM5JR6wxI4i5QGFuWJqxsamHnPEmSbozaNiQ2XakdylDH0HdLCdqnrCIAO1cDW/ncMQ67U
	0rMKeJ+MsY1Lee3qMZ+SFdW2H0sw290pY02GsREx+DWTTAihQkPRV8OJTKuKRyRWZeP8VX+X1I5
	uYgz9qa7CceDjosev4mv+bJ1zDO4pF/IaHzh4sQfNwqPQTN847lJYmbWWWfkqaYbKy6a8GKplJ7
	BqJcFjjLO+iC64p/80MWpXhZqLCyGX3GzSWbVybrAB9RCFxAf5m7sOTxcIK1gnKMWz+znSMuZDR
	GFeNtazuUfFVztgJyIWxzrAA+3H9URgRSUobJExUase1Rc1LgvQ2rAcrD0uWZnO9JRtJOcMQS9u
	1O4ujtkBambTDJhrH6LE+8U/4YkO7b2QVpP66ZxfoLi3ekt0IXJm3PKsZBPfLY0ObXS7+1ZoFVP
	pAm2AwRWyAoT2GbPMJcsjcQ0lKpVJ4BhoFKJNAavJPXfPKaeYOL+h1sgTK/GwetTcNRt7Q==
X-Received: by 2002:a05:6a00:908d:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8ba86b93834mr3122737b3a.26.1794331772149;
        Tue, 10 Nov 2026 09:29:32 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm1197939b3a.49.2026.11.10.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:29:31 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 3/3] selftests: net: netlink-dumps: test dump of route larger than skb
Date: Tue, 10 Nov 2026 09:26:18 -0800
Message-ID: <20261110172925.3293312-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110172925.3293312-1-stephen@networkplumber.org>
References: <20261110172925.3293312-1-stephen@networkplumber.org>
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

IPv6 nexthops cannot use lo, so create a dummy device and generalize
lo_set_up() to if_set_up(). Add the IPv4 routing options to config.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 tools/testing/selftests/net/config          |   3 +
 tools/testing/selftests/net/netlink-dumps.c | 271 +++++++++++++++++++-
 2 files changed, 270 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index d4416f8bdcfd..e2f136274e6d 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -29,6 +29,8 @@ CONFIG_IP6_NF_MATCH_RPFILTER=m
 CONFIG_IP6_NF_NAT=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_IPTABLES_LEGACY=m
@@ -38,6 +40,7 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_FOU=m
diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
index 4a94a25167e2..43f63f3f2289 100644
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
 
@@ -362,4 +362,267 @@ TEST(dump_with_queued_ntf)
 	close(inet_sock);
 }
 
+#define BIG_RT_TABLE	100
+#define BIG_RT_IFINDEX	100
+#define BIG_RT4_NH	1500
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
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+	struct nlattr dst_hdr;
+	__u8 dst[4];
+	struct nlattr table_hdr;
+	__u32 table;
+	struct nlattr mp_hdr;
+	struct rtnexthop nh[BIG_RT4_NH];
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
+		.rtm_scope	= RT_SCOPE_LINK,
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
+	ret = nl_request_ack(netlink_sock, &new_dummy, sizeof(new_dummy));
+	if (ret == -EOPNOTSUPP)
+		SKIP(return, "Needs CONFIG_DUMMY");
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "dummy0", true), 0);
+
+	for (i = 0; i < BIG_RT4_NH; i++) {
+		new_route4.nh[i].rtnh_len = sizeof(new_route4.nh[i]);
+		new_route4.nh[i].rtnh_ifindex = 1; // lo
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
+	// The ACK reads above used large buffers, which raise the dump
+	// skb size for this socket. Dump on fresh sockets instead.
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

