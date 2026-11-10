Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302696;
	b=tpavTpkuUmlf7xnpz7RoYCEfzTa7QbfJayI+NQHWSlSw5e5B6ynLk0z+sS2/6L2dybA/
	 9wd1v+/rmJ8X3KLJrbOn1gJfXHgtlC9NBB00wa4TjXIw/fFC2IsEe1CPImFmTqGwFP1Cx
	 gq6cE+2FqLcMQPbftPPD2R5tDBn8bEyKYs/j4agopIDIckCSntcaBqdbnDQT/NdA+4kiO
	 wTNDgwJTYPNSDK5xtPojEZBYpNIz/tAGM/ckJ8OK1TRst2rPiRa8zwLALrP1lD6Y/wcOj
	 lzfXNQYkmyHwhDHzUoQm0/Rf4VrNZVOd302V9VO6z2Qt5Y4QWe4GfifWXnz0UUlI7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302696;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g59WXbMEVAC+rwbfPbusgYn9rCMYzsS/Ea1X6BmPoQk=;
	b=fwQ59J1vWSgmFh4TcYsCAjXw1FZlDSDwepnN7Mm/4EpbRhy1ZL7by9N2VliRspkazdyU
	 FunyJjcUijCjgvvvFBfbC5mkU1LHmICvwMYSmYT9lSKmK9m2H/dTBsTXTun6Ptx+7sxpT
	 Yau91KINbI/2zRK2QVgSUBaBb1oL2mQ2pLA/uJ5c1c5gJNsocXMDk4+TSzGdrdBj9pwz7
	 cPLPG5Ecm5aD8sa2U9tKLfkoSIk2cTPXwpx3/S9wKRoWkfcYGAbihUH1ota8MMoTouXXJ
	 E4iHRXUNQq92qQprl/rua8nknAhNoo80+BKDhAnz6NV3UZog8LrB800DjBFep35x4pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jsjkEliL;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C86070FE6
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7C86070FE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jsjkEliL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NrDs8IswZxyvOKP1XWG0B7QQ4QtrBkDyBDj9/5w4lmc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794302693; v=1; x=1794907493;
 b=jsjkEliLZ/+yssR9wR9O/Lh9syF0w9ilKzRDQ5vPbWVYAWBOdZ+G3T6Qfc8chLQrangeWieq
 30du1DjzhNlX++VixVcv2j7Ywd0tph/Y+PoVDz0n+z7kgCx/cYcW2Pv544dHzbVSvfGon63eIdY
 LOiAAoL6HgjOZoCKHUf9URdE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1ee9f6a1fae2868a;
	Tue, 10 Nov 2026 09:24:52 +0000
X-Mizu-Trace-ID: 1ee9f6a1fae2868a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 17:24:33 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] selftests: net: netlink-dumps: test dump of route
 larger than skb
Message-ID: <avLi0W-uqKJvJeCR@fedora>
References: <20261109012115.11898-1-stephen@networkplumber.org>
 <20261109012115.11898-4-stephen@networkplumber.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109012115.11898-4-stephen@networkplumber.org>

On Sun, Nov 08, 2026 at 05:13:14PM -0800, Stephen Hemminger wrote:
> Add IPv4 and IPv6 multipath routes that do not fit in the first dump
> skb of a fresh socket. The dump must return the route or fail with
> -EMSGSIZE, not end with status 0.
> 
> IPv6 nexthops cannot use lo, so create a dummy device and generalize
> lo_set_up() to if_set_up(). Add the IPv4 routing options to config.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> ---
>  tools/testing/selftests/net/config          |   3 +
>  tools/testing/selftests/net/netlink-dumps.c | 271 +++++++++++++++++++-
>  2 files changed, 270 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index d4416f8bdcfd..e2f136274e6d 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -29,6 +29,8 @@ CONFIG_IP6_NF_MATCH_RPFILTER=m
>  CONFIG_IP6_NF_NAT=m
>  CONFIG_IP6_NF_RAW=m
>  CONFIG_IP6_NF_TARGET_REJECT=m
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_IP_MULTIPLE_TABLES=y
>  CONFIG_IP_NF_FILTER=m
>  CONFIG_IP_NF_IPTABLES=m
>  CONFIG_IP_NF_IPTABLES_LEGACY=m
> @@ -38,6 +40,7 @@ CONFIG_IP_NF_NAT=m
>  CONFIG_IP_NF_RAW=m
>  CONFIG_IP_NF_TARGET_REJECT=m
>  CONFIG_IP_NF_TARGET_TTL=m
> +CONFIG_IP_ROUTE_MULTIPATH=y
>  CONFIG_IP_SCTP=m
>  CONFIG_IPV6=y
>  CONFIG_IPV6_FOU=m
> diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
> index 4a94a25167e2..43f63f3f2289 100644
> --- a/tools/testing/selftests/net/netlink-dumps.c
> +++ b/tools/testing/selftests/net/netlink-dumps.c
> @@ -263,11 +263,11 @@ TEST(close_with_ref)
>  	usleep(100 * 1000);
>  }
>  
> -static int lo_set_up(int sock, bool up)
> +static int if_set_up(int sock, const char *name, bool up)
>  {
>  	struct ifreq ifr = {};
>  
> -	strcpy(ifr.ifr_name, "lo");
> +	strcpy(ifr.ifr_name, name);
>  	if (ioctl(sock, SIOCGIFFLAGS, &ifr))
>  		return -1;
>  	if (up)
> @@ -321,12 +321,12 @@ TEST(dump_with_queued_ntf)
>  		       sizeof(addr)), 0);
>  
>  	// A large read makes the kernel attempt large dump skbs
> -	ASSERT_EQ(lo_set_up(inet_sock, true), 0);
> +	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
>  	n = recv(netlink_sock, buf, sizeof(buf), 0);
>  	ASSERT_GE(n, (ssize_t)sizeof(struct nlmsghdr));
>  
>  	// Leave one notification queued, then start the dump
> -	ASSERT_EQ(lo_set_up(inet_sock, false), 0);
> +	ASSERT_EQ(if_set_up(inet_sock, "lo", false), 0);
>  	n = send(netlink_sock, &dump_links, sizeof(dump_links), 0);
>  	ASSERT_EQ(n, sizeof(dump_links));
>  
> @@ -362,4 +362,267 @@ TEST(dump_with_queued_ntf)
>  	close(inet_sock);
>  }
>  
> +#define BIG_RT_TABLE	100
> +#define BIG_RT_IFINDEX	100
> +#define BIG_RT4_NH	1500
> +#define BIG_RT6_NH	500
> +
> +static const struct {
> +	struct nlmsghdr nlhdr;
> +	struct ifinfomsg ifm;
> +	struct nlattr name_hdr;
> +	char name[8];
> +	struct nlattr linkinfo_hdr;
> +	struct nlattr kind_hdr;
> +	char kind[8];
> +} new_dummy = {
> +	.nlhdr = {
> +		.nlmsg_len	= sizeof(new_dummy),
> +		.nlmsg_type	= RTM_NEWLINK,
> +		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
> +				  NLM_F_EXCL,
> +		.nlmsg_seq	= 1,
> +	},
> +	.ifm = {
> +		.ifi_family	= AF_UNSPEC,
> +		.ifi_index	= BIG_RT_IFINDEX,
> +	},
> +	.name_hdr = {
> +		.nla_len	= 4 + sizeof("dummy0"),
> +		.nla_type	= IFLA_IFNAME,
> +	},
> +	.name = "dummy0",
> +	.linkinfo_hdr = {
> +		.nla_len	= 4 + 4 + 8,
> +		.nla_type	= IFLA_LINKINFO,
> +	},
> +	.kind_hdr = {
> +		.nla_len	= 4 + sizeof("dummy"),
> +		.nla_type	= IFLA_INFO_KIND,
> +	},
> +	.kind = "dummy",
> +};
> +
> +static struct {
> +	struct nlmsghdr nlhdr;
> +	struct rtmsg rtm;
> +	struct nlattr dst_hdr;
> +	__u8 dst[4];
> +	struct nlattr table_hdr;
> +	__u32 table;
> +	struct nlattr mp_hdr;
> +	struct rtnexthop nh[BIG_RT4_NH];
> +} new_route4 = {
> +	.nlhdr = {
> +		.nlmsg_len	= sizeof(new_route4),
> +		.nlmsg_type	= RTM_NEWROUTE,
> +		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
> +				  NLM_F_EXCL,
> +		.nlmsg_seq	= 1,
> +	},
> +	.rtm = {
> +		.rtm_family	= AF_INET,
> +		.rtm_dst_len	= 24,
> +		.rtm_protocol	= RTPROT_STATIC,
> +		.rtm_scope	= RT_SCOPE_LINK,
> +		.rtm_type	= RTN_UNICAST,
> +	},
> +	.dst_hdr = {
> +		.nla_len	= 4 + 4,
> +		.nla_type	= RTA_DST,
> +	},
> +	.dst = { 198, 51, 100, 0 },
> +	.table_hdr = {
> +		.nla_len	= 4 + 4,
> +		.nla_type	= RTA_TABLE,
> +	},
> +	.table = BIG_RT_TABLE,
> +	.mp_hdr = {
> +		.nla_len	= 4 + sizeof(new_route4.nh),
> +		.nla_type	= RTA_MULTIPATH,
> +	},
> +};
> +
> +struct rtnexthop6 {
> +	struct rtnexthop rtnh;
> +	struct nlattr gw_hdr;
> +	__u8 gw[16];
> +};
> +
> +static struct {
> +	struct nlmsghdr nlhdr;
> +	struct rtmsg rtm;
> +	struct nlattr dst_hdr;
> +	__u8 dst[16];
> +	struct nlattr table_hdr;
> +	__u32 table;
> +	struct nlattr mp_hdr;
> +	struct rtnexthop6 nh[BIG_RT6_NH];
> +} new_route6 = {
> +	.nlhdr = {
> +		.nlmsg_len	= sizeof(new_route6),
> +		.nlmsg_type	= RTM_NEWROUTE,
> +		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
> +				  NLM_F_EXCL,
> +		.nlmsg_seq	= 1,
> +	},
> +	.rtm = {
> +		.rtm_family	= AF_INET6,
> +		.rtm_dst_len	= 64,
> +		.rtm_protocol	= RTPROT_STATIC,
> +		.rtm_scope	= RT_SCOPE_UNIVERSE,
> +		.rtm_type	= RTN_UNICAST,
> +	},
> +	.dst_hdr = {
> +		.nla_len	= 4 + 16,
> +		.nla_type	= RTA_DST,
> +	},
> +	.dst = { 0x20, 0x01, 0x0d, 0xb8 }, // 2001:db8::/64
> +	.table_hdr = {
> +		.nla_len	= 4 + 4,
> +		.nla_type	= RTA_TABLE,
> +	},
> +	.table = BIG_RT_TABLE,
> +	.mp_hdr = {
> +		.nla_len	= 4 + sizeof(new_route6.nh),
> +		.nla_type	= RTA_MULTIPATH,
> +	},
> +};
> +
> +static struct {
> +	struct nlmsghdr nlhdr;
> +	struct rtmsg rtm;
> +} dump_routes = {
> +	.nlhdr = {
> +		.nlmsg_len	= sizeof(dump_routes),
> +		.nlmsg_type	= RTM_GETROUTE,
> +		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_DUMP,
> +		.nlmsg_seq	= 2,
> +	},
> +	.rtm = {
> +		.rtm_table	= BIG_RT_TABLE,
> +	},
> +};
> +
> +static int nl_request_ack(int sock, const void *req, size_t len)
> +{
> +	struct nlmsghdr *nlh;
> +	char buf[4096];
> +	ssize_t n;
> +
> +	if (send(sock, req, len, 0) != (ssize_t)len)
> +		return -errno;
> +	n = recv(sock, buf, sizeof(buf), 0);
> +	if (n < 0)
> +		return -errno;
> +	nlh = (struct nlmsghdr *)buf;
> +	if (!NLMSG_OK(nlh, n) || nlh->nlmsg_type != NLMSG_ERROR)
> +		return -EPROTO;
> +	return *(int *)NLMSG_DATA(nlh);
> +}
> +
> +// Dump table BIG_RT_TABLE on a fresh socket, so the first dump skb is
> +// small, and count routes. The table holds only one route, too large for
> +// that skb. Returns the status from NLMSG_DONE or NLMSG_ERROR.
> +static int dump_big_table(struct __test_metadata *_metadata, int family,
> +			  int *routes)
> +{
> +	int netlink_sock, i, ret = 1;
> +	char buf[32768];
> +	int one = 1;
> +	ssize_t n;
> +
> +	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
> +	ASSERT_GE(netlink_sock, 0);
> +	ASSERT_EQ(setsockopt(netlink_sock, SOL_NETLINK, NETLINK_GET_STRICT_CHK,
> +			     &one, sizeof(one)), 0);
> +
> +	dump_routes.rtm.rtm_family = family;
> +	n = send(netlink_sock, &dump_routes, sizeof(dump_routes), 0);
> +	ASSERT_EQ(n, sizeof(dump_routes));
> +
> +	*routes = 0;
> +	for (i = 0; i < 100 && ret > 0; i++) {
> +		struct nlmsghdr *nlh;
> +
> +		n = recv(netlink_sock, buf, sizeof(buf), 0);
> +		ASSERT_GE(n, 0);
> +
> +		for (nlh = (struct nlmsghdr *)buf; NLMSG_OK(nlh, n);
> +		     nlh = NLMSG_NEXT(nlh, n)) {
> +			if (nlh->nlmsg_type == RTM_NEWROUTE)
> +				(*routes)++;
> +			if (nlh->nlmsg_type == NLMSG_DONE ||
> +			    nlh->nlmsg_type == NLMSG_ERROR) {
> +				ret = *(int *)NLMSG_DATA(nlh);
> +				break;
> +			}
> +		}
> +	}
> +	EXPECT_LE(ret, 0);
> +
> +	close(netlink_sock);
> +	return ret;
> +}
> +
> +// A route that doesn't fit in the first dump skb must either be dumped or
> +// end the dump with EMSGSIZE. It must not end the dump as if complete.
> +TEST(dump_large_route)
> +{
> +	int netlink_sock, inet_sock, i, ret, routes;
> +
> +	ret = unshare(CLONE_NEWNET);
> +	if (ret && errno == EPERM)
> +		SKIP(return, "Needs CAP_SYS_ADMIN for a netns");
> +	ASSERT_EQ(ret, 0);
> +
> +	inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
> +	ASSERT_GE(inet_sock, 0);
> +	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
> +	ASSERT_GE(netlink_sock, 0);
> +
> +	ret = nl_request_ack(netlink_sock, &new_dummy, sizeof(new_dummy));
> +	if (ret == -EOPNOTSUPP)
> +		SKIP(return, "Needs CONFIG_DUMMY");
> +	ASSERT_EQ(ret, 0);
> +	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
> +	ASSERT_EQ(if_set_up(inet_sock, "dummy0", true), 0);
> +
> +	for (i = 0; i < BIG_RT4_NH; i++) {
> +		new_route4.nh[i].rtnh_len = sizeof(new_route4.nh[i]);
> +		new_route4.nh[i].rtnh_ifindex = 1; // lo
> +	}
> +	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route4,
> +				 sizeof(new_route4)), 0);
> +
> +	for (i = 0; i < BIG_RT6_NH; i++) {
> +		struct rtnexthop6 *nh = &new_route6.nh[i];
> +
> +		nh->rtnh.rtnh_len = sizeof(*nh);
> +		nh->rtnh.rtnh_ifindex = BIG_RT_IFINDEX;
> +		nh->gw_hdr.nla_len = sizeof(nh->gw_hdr) + sizeof(nh->gw);
> +		nh->gw_hdr.nla_type = RTA_GATEWAY;
> +		nh->gw[0] = 0xfe; // fe80::<i + 1>
> +		nh->gw[1] = 0x80;
> +		nh->gw[14] = (i + 1) >> 8;
> +		nh->gw[15] = (i + 1) & 0xff;
> +	}
> +	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route6,
> +				 sizeof(new_route6)), 0);
> +
> +	// The ACK reads above used large buffers, which raise the dump
> +	// skb size for this socket. Dump on fresh sockets instead.
> +	close(netlink_sock);
> +
> +	ret = dump_big_table(_metadata, AF_INET, &routes);
> +	if (ret != -EMSGSIZE)
> +		EXPECT_EQ(routes, 1);
> +
> +	ret = dump_big_table(_metadata, AF_INET6, &routes);
> +	if (ret != -EMSGSIZE)
> +		EXPECT_EQ(routes, 1);
> +
> +	close(inet_sock);
> +}
> +
>  TEST_HARNESS_MAIN
> -- 
> 2.53.0
> 

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
