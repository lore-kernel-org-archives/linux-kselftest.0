Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499925393E;
	Sat, 11 Jul 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789444; cv=none; b=UWmvZOIr7o9U8sYfgwqVRMuw6XOIuKgtKwqknDkVPhXsq58gxOT5T4asu8akvD8iT9To3NcH/QRDzbZnOiQm5M77g9Cj3q1Abw0WvUCm6QwZj6sdmP5VnZVyua+aPc3U9vgisRZWZ93qXmGyyDB3jr3DDEO8LRxvFEYMxoMdHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789444; c=relaxed/simple;
	bh=ybgae/gH+ZP0HkwJ9AAcLVrwvoeGczv1UOPunmdsrCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjEHy7Jb9sI1O4RJSvceZpQG5aAeH3wnZYRoXagCdpcOlMAl2mJsEmXA7Ky4oUjwZmPrgF8H+dKEBgY8VmWM4TBYTmGUrSkb3xGXYoZgQM+X649Dw5MK9lZZBlkkvP8V3okbX4uogKypvU9lPQ13chJFmKqrPb1KIrn3Tp+mXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knJX/q5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knJX/q5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AD61F000E9;
	Sat, 11 Jul 2026 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789442;
	bh=xzw+xlHNCQ9SmW07QEcuc/GTImAERQRXK0SuRRyvM3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=knJX/q5ES+7tzA6Hn8KZMjfKpFrv4epw2huEpPjApNSF+1QJCyLd5m0Trg2m1URhb
	 6OdDHvSAUBd20Eb1MUldqRd5TwGVXvaBYxKk0HxR2D2z1whpo2N0Ig4unhl5M5pfQv
	 JjApOW+HNOisnJwT16Pm/tPyq+3HJR30n3JIfG4HoEAN74n6vLKvOmC1DWr8FYcj5/
	 LAurmpOIPSrQL3TtFTe8wtMdvFzzECVlDuPNkxAUNFYCOtd0djMHEuCbnfXmqybEx4
	 PBv4BN9nl93s2CQZL60l+JYZUSamk2a9L6OoeA3gkeJuy3C39Z2XH/JvsY1hF/MTDI
	 egyM2hOVliWaw==
Message-ID: <b1df9a9b-e419-4acd-9be0-90fbf4fa5945@kernel.org>
Date: Sat, 11 Jul 2026 11:04:01 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] seg6: add FIB table attribute for post-encap
 SID route lookup
Content-Language: en-US
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Justin Iurman <justin.iurman@6wind.com>,
 Anthony Doeraene <anthony.doeraene@uclouvain.be>,
 Stefano Salsano <stefano.salsano@uniroma2.it>,
 Ahmed Abdelsalam <ahabdels@cisco.com>,
 Paolo Lungaroni <paolo.lungaroni@uniroma2.it>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711162907.6521-1-andrea.mayer@uniroma2.it>
 <20260711162907.6521-2-andrea.mayer@uniroma2.it>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260711162907.6521-2-andrea.mayer@uniroma2.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 10:29 AM, Andrea Mayer wrote:
> After SRv6 encapsulation the kernel looks up the route for the first SID,
> that is the outer IPv6 destination of the encapsulated packet. This
> post-encap SID route lookup uses the FIB table of the current routing
> context. When the encap route is installed in a VRF, the VRF's table may
> not have a route matching the SID. In that case another table should
> handle it, e.g. one configured for underlay connectivity.
> 
> Add an optional SEG6_IPTUNNEL_TABLE attribute that selects the FIB table
> used for this lookup. When set by the user, the attribute is honored on
> both the input path (forwarded traffic) and the output path (locally
> originated traffic). SRv6 encap routes that do not set the attribute use
> the current routing context, as before.
> 
> For example:
> 
>   # SID route installed in the underlay table 500
>   ip -6 route add fc00::100/128 via fd00::1 dev veth0 table 500
> 
>   # encap route in vrf-100; the first SID is looked up in table 500
>   ip -6 route add cafe::1/128 vrf vrf-100 \
>       encap seg6 mode encap segs fc00::100 lookup 500 dev veth0
> 
>   # or look up the SID in the main table
>   ip -6 route add cafe::1/128 vrf vrf-100 \
>       encap seg6 mode encap segs fc00::100 lookup main dev veth0
> 
> Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
>  include/uapi/linux/seg6_iptunnel.h |   1 +
>  net/ipv6/seg6_iptunnel.c           | 132 +++++++++++++++++++++++++----
>  2 files changed, 117 insertions(+), 16 deletions(-)
> 

Acked-by: David Ahern <dsahern@kernel.org>


