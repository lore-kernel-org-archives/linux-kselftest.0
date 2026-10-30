Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347960;
	b=LY0+EKJ1qTyk4/gH88EM1Qz/zci+N42Ue4pnK6asAuDcrDMH/rwDG74GgcAowVYEi2mn
	 5k19NiaKXelSbz5TAfeXoVhup6JPiJXtkElMy2ieHaBtIyDMUG+nWqKGI82bY2w90T0eh
	 Sx8lvONKauwy/0hVFqloCnLdTjq8WANmoNRABSrGTgTt7cIK6cILIGo5Kw/xRMP6VIqL+
	 BN6i5n7u7cCM4xeKb9fk6PnsiP/2VcnRaEyPhlCnR9V7mZ3tw83JZt41hsXB7zpXpleYR
	 bFqYMoYP0mrXgaQlJAOi+M1WFb0Zr4QKaGzNQEGDHAPDNJTZ3Ios0X8UGWxx6k7F43A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347960;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1eOarHzAsENVZMHKn6FEU4kOA/5SkTXSfgR+jYQ2Wck=;
	b=Y+P7JFYv4hxYyiaGMbHnciav7WfeTq2DCUVeCmKwgi/3OHdBezwjkTFqVWuN1kaTYAuC
	 O/9WqUPQnHHCTX4ml8PIeZlEhHhPo2nWnrOllXt9g3OcCNQbLSP73D8dEWeMpb1/srsc0
	 xklftBbtjggaZBI1KlZHLzZCoT2xVzqScyxbN7gjIeB7bA/L6+DhZ3Mt5TgjolLJHPF/4
	 dz7aGKXVw/2hDOJLHflfbhks1yHw2ceuI3k2+Po8NhzpcxFmVQLerMqidRxquB9uM9ReG
	 QHKEDHuH3BiY6UR8yFWeUfmWAsqtWbfj9zfrwUSuLqGgwmtHrtxDZuhIsorzhSX2UBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CFU5B0tc;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B07606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CFU5B0tc
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6R09/GlFusOPFb6unSV/Xj0uyriwOdbAv2ijaqmAJX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793347956; v=1; x=1793952756;
 b=CFU5B0tcSto+raXKFA6eoXJPcFOBtRF4gllgF2A5Z9cUkrC+pPT7XSxUXBECD3BIA6ImP5Q7
 QS/k2yT/QThyaAa0jXzw/nvUjXIbdC9YNtrpcmvd2iVH02J4io74MiQpQm1lVuxVthsF35LbO5u
 yA8QN6GPYLKUtSvHj5a9Ijlg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 28f7219672ac7ce9;
	Fri, 30 Oct 2026 08:12:36 +0000
X-Mizu-Trace-ID: 28f7219672ac7ce9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 16:12:19 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH 0/3] net: ioam6: makes IOAM insertion transparent to IPv6
 ECMP
Message-ID: <auRRYzF8iExhcVZp@bogon>
References: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
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
In-Reply-To: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>

On Wed, Oct 28, 2026 at 01:45:28PM +0800, Hangbin Liu wrote:
> This series makes IOAM insertion transparent to IPv6 ECMP, as required
> by RFC 9486 (C2): a packet carrying IOAM options must be forwarded
> along the same path as the identical packet without them.
> 
> Patch 1 fixes the transit side: hash policy 0 hashed the raw IPv6
> nexthdr, which becomes NEXTHDR_HOP once an IOAM Hop-by-Hop header is
> inserted. The policy-0 key (and the ICMPv6-error flow selection) now
> uses the nexthdr the packet would have had if the Hop-by-Hop header
> carried only IOAM options and padding.
> 
> Patch 2 fixes the injecting node: the ioam6 output re-lookup on a
> destination-cache miss hashed the transformed packet's NEXTHDR_HOP
> instead of the original nexthdr (inline) or IPPROTO_IPV6 (encap), and
> rebuilt the flow keys from the outer header only.
> 
> Patch 3 adds selftests/net/ioam6_ecmp.sh, covering both places: a
> transit forwarder with a multipath route, and an encapsulating node
> compared against a plain ip6ip6 baseline.
> 
> The issue was found while reviewing RFC9486. It can be reproduced and
> verified by the newly added ioam6_ecmp.sh test.
> 
> Tested with:
> ecmp_rehash.sh
> fib_nexthops.sh
> ioam6_ecmp.sh
> tcp_ecmp_failover.sh
> forwarding/gre_inner_v4_multipath.sh
> forwarding/gre_inner_v6_multipath.sh
> forwarding/gre_multipath_nh_res.sh
> forwarding/gre_multipath_nh.sh
> forwarding/gre_multipath.sh
> forwarding/ip6gre_inner_v4_multipath.sh
> forwarding/ip6gre_inner_v6_multipath.sh
> forwarding/router_mpath_nh_res.sh
> forwarding/router_mpath_nh.sh
> forwarding/router_multipath.sh
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Hangbin Liu (3):
>       ipv6: route: consider IOAM options in ECMP hash policy 0
>       ipv6: ioam6: use transformed packet nexthdr for ECMP re-lookup
>       selftests: net: add ioam6 ECMP test (RFC 9486 C2)
> 
>  include/uapi/linux/in6.h                  |   1 +
>  net/ipv6/ioam6_iptunnel.c                 |   4 +-
>  net/ipv6/route.c                          |  67 +++++-
>  tools/testing/selftests/net/Makefile      |   1 +
>  tools/testing/selftests/net/ioam6_ecmp.sh | 349 ++++++++++++++++++++++++++++++
>  5 files changed, 419 insertions(+), 3 deletions(-)
> ---
> base-commit: 5d7f3375cd574fc83f0cd30839b21455c0e79ae2
> change-id: 20261020-ipv6_ioam_ecmp-ae4ef0a4bdae
> 
> Best regards,
> --  
> Hangbin Liu <liuhangbin@kylinos.cn>
> 

Sashiko found some issues. I will fix them and post new version.

pw-bot: cr
