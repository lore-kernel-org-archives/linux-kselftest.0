Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187283;
	b=OFSB+ihiFGrxtqkTNXZCSGNoehUEmMR0/DrHmsLvUEWOHQbbcy8hy3/VIjrj+RK+Ev7h
	 G7/S6uLzoe9McCBjTNJ65NLEdGTiK7BNtU+3anQbFnLZUjdCzHxm7HsPOVdyM1Bv9sV4O
	 43I8EMaJFxzsoItUAt7ZVUr4jaDgvpWYmYVjPIl38+Pc3jQB48zD5xWNVR9f4OzU+11/x
	 tHPQNuJ8jF8R4LI0CL+Y/l1WP8tUQnIArPOiFKD4oDBOdPVEJ96XMh+KDjE0VHqYqkby5
	 vmc2lDXCE4iezzavjX2w04jhDxGLe4Bo/IbjNJqKpLEO3eGza/HS/aplG7sOXxTM3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Z17mWdlObRHExXZCL6A/eytm6yqI/SONEQ1qiNL+yY=;
	b=QI2VDi9K+0YHq47wL/ww2Igp4CAeKLm6ROB9vaAWHKUuyB11kfA+JOizHOtnQzuErDBd
	 FoGG5ZSBC9Yuuj4/6gXlH3PrEpXAVHVOypZspl8WVrbdvS8dzRzB82X5OwGl7NXo+ckVu
	 uix+swwFn8BJYfovqJEVwhxEj6js/FUmC530jolt8Y/U2iCxqUQ9fTurSOEYLsYpUt3Vu
	 g9ncBj5osCFyoFv349Vz3M/ie9OQ+WFSE2F2TBx+qrliCQWnEFqR9/oE9QyGhzY+LGk3r
	 gv0tvkT+L+sgpktbMl6Xe4tSRv8XOTdkunzaYoAr99wELiI9h1G0nXMf/iwfqlO0jbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OKEGSm3w;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8C7606D83D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8C7606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OKEGSm3w
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b14b96448eso140861a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 17:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794187282; x=1794792082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Z17mWdlObRHExXZCL6A/eytm6yqI/SONEQ1qiNL+yY=;
        b=OKEGSm3w4MAnap14tM2oUrid8Tww6hSauoTRrzABho3H/h1kA6j/G8+PZ+9SJSSj3u
         0fDtlJVx1q3GDvwNTXIyEQH5m2NLU15e2AMby4zsSOTqLYQ26kgmJPX9Vydr9fOQJikI
         D36vpUBRDhUzkCyjZudlKLa42fGo3NfnnMQKCWn2DogmKKY2rU/Xewvx9vMUulfOe4Sd
         4HAsQGUKzfOiOFBO0wKD1iU3wJzIxPuLXJmOfw1BcR9aO1d7lH+4t3qTIKbFd5/6Vy75
         Y9mZUg7YoKLfwnVtlklDpG/VhI59WUsvygIn4+9lCHGd2GqT1R0skg3GU1kGiwEMSUfg
         6qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187282; x=1794792082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Z17mWdlObRHExXZCL6A/eytm6yqI/SONEQ1qiNL+yY=;
        b=sWU7cwnKcIX0zn1zJzMIlZcs9YwcVI3gac8qVXkYp3tg2RqfYd2i9cDJGJesdPmK/T
         Jmc5dB7LAziCKSdpRw2moAypcANnEyBN0HItD+oXHF3AEnQ68xi6nzg6o4XTKZJH1aSa
         th2rtwpBgJ8qvzMvib0JruKIEjmVqRXrVZvbwoveFWs0afBy43r6pXsEDS6mub5H4woK
         FY1EIX6cQafq16I5lL5jsYnBpWt6lKlrirtlAS80aZLSU3FVpZu0zBHNMFr7asP/Eofv
         yQHRDomA4shHVEsRdIb/wRx9GDTkF6wxQBnIfR59iDtN5ZmVNlEz8q6Z1iAIaV8XPPhD
         IHDw==
X-Forwarded-Encrypted: i=1; AL+hErF1bnHLC/MDHdwJj5AUxT3by/WEsm8XFXvkJMDnHaQkCSZLv/zHWtQfQxRPHXzg1+KZ8ja0aEBBszDlUq3q140=@vger.kernel.org
X-Gm-Message-State: APuU4Z89SXClhwnL7hc5n8qeDSU9+BSCTiG/j86xbn0JOF2VP+w7Qrck
	4TOaNneEK0EhXL6+Kizq+vGNTJB6AArSa7OpbwU8vUMoeOHkalmiOIOzMD00DvjcJMM=
X-Gm-Gg: AYBFou0uoNxlm4iwCf3Jtna+fn55W69+m9UuT6GVKa1hdqCpCJoJwwe5TnQEVmzPP16
	UM6eIIfBbf4yhISJBwNnqHklw54ncTFY7wai/MumUqK39NHJMde2b8eg4v+83i/Xlmx9dshleM0
	gz1jyYP6j70zrnPf2PmBjZe6JUmALrwZgpjbuRNyXBIaUMBZMXDMl/ZiuKxKP27R13ZiR5NIsHY
	8gxLZSspQyfvZpqTkNTG2cA+PGhkRy4sslE6IhIQlJeoUZqSsx22YOdbQ29G/EONakbMH9rlPP5
	ChG9j8BZqahfJsvePwkVsjTxDj0ScJJv88jy2W5WX/nXJZPLAUNJvn5tVgZqGqp/2JoBGjkwVU0
	IsW0AorMHCGe1vTp5PgE2d7uYEvHnO8ZUgxTTHEgz5C7Mza9LREE5KwNJpDNh+jtzszzFPaV4wG
	jNpEGCF6sYua+PaGq/Nvnt6VDTwmdj+qZ0ONJWdOytmlG2tzhB1EKzzsOOk+cjjaRueiJzLYhcY
	qMRY9N1Q7cDmcN716RH+njxxaHNMt4Qp1I3mRw1K/ayhEaUXc5lg+4Gymwd0hX+nD+AHqlkUAOQ
	PuvgnR9uv2TTl6ZHHwaxI288VOlTkzSWNGxBPMZbC0ptZjl/uWVV7phVfnNF8st82bcXDU4=
X-Received: by 2002:a17:90b:54c4:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b12d5813c1mr2577245a91.53.1794187282446;
        Sun, 08 Nov 2026 17:21:22 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103432e26sm4883217a91.3.2026.11.08.17.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:21:22 -0800 (PST)
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
Subject: [PATCH 3/3] selftests: net: netlink-dumps: test dump of route larger than skb
Date: Sun,  8 Nov 2026 17:13:14 -0800
Message-ID: <20261109012115.11898-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109012115.11898-1-stephen@networkplumber.org>
References: <20261109012115.11898-1-stephen@networkplumber.org>
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

Assisted-by: Claude:claude-opus-5-5
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

