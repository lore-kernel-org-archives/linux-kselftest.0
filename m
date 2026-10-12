Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979FD361675
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791962; cv=none; b=gOtKD+h3qJhWHldlX2Uu1TfKc3TxkdMuk/A1rX/tAYdqPEocdJpA0sMTsC4doXaZiYObHXwhYmN29k4SYQYYqgl/1an28jvIEuHNkaAoYRos2wHGvT2MTOo+GJi//UkVQFf5GihUuW5x1J/BKKciRAl9KRT8iUBkra4jJPlj2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791962; c=relaxed/simple;
	bh=56McHLpkjbEcfgo3ET0BWRpRsj/vdI3JWjyVwnemna0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AN08qeduMZ2A8ExJOoXFBqS0fu0sUudAUkeJJ4AK4YkU9/ZyoKGz+5kt8df5J8lgB+1Jfm4XL0WJWztycC2I/cEmdwIK5NJDSYwiJOufcLertmIKxn4kLX/qpSqwwAKh1egsQ01A9O+/CEXAwIo7B0cRIMjZCWjvMtcyHF2BfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pj/btZnL; arc=none smtp.client-ip=95.215.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pj/btZnL"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=56McHLpkjbEcfgo3ET0BWRpRsj/vdI3JWjyVwnemna0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791791957; v=1; x=1792396757;
 b=Pj/btZnLyrKTvemqk0Widq6ALB5WUmpF8p1x6BmbzwaXiDAFU2a4zPVP8QvoznbLX1LR6ZPj
 5N9sLp8Y+HG+C/Klzzxu/bxZhiy7tb2IHzd49kNOuZF8UW+2suDqPdZNp+g48obqkRT6eoL7OmL
 N23mIKLTbHjd+/Vc+qSP1UaY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0f422274027c2e95;
	Mon, 12 Oct 2026 07:59:16 +0000
X-Mizu-Trace-ID: 0f422274027c2e95
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 15:59:08 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Ahmed Abdelsalam <ahabdels@cisco.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>
Subject: Re: [PATCH net-next 1/5] seg6: handle a Fragment or AH header before
 the SRH consistently in PSP
Message-ID: <asyTTOcu2MRufGJ-@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
 <20261011192310.55-2-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011192310.55-2-andrea.mayer@uniroma2.it>

On Sun, Oct 11, 2026 at 09:23:06PM +0200, Andrea Mayer wrote:
> seg6_pop_srh() already fails when a Fragment or AH header comes before
> the SRH with other headers in between, and the packet is dropped ("we
> expect SRH before FRAG and AUTH" in the code). But when the SRH directly
> follows the Fragment or AH header, it is removed:
> 
>   (a) IPv6 | FRAG/AH | DOPT | SRH | ...   the packet is dropped
>   (b) IPv6 | FRAG/AH | SRH | ...          the SRH is removed
> 
> In both packets the Fragment or AH header comes before the SRH.
> 
> Align the two cases: check first whether a header is a Fragment or AH
> header, and only then look at its Next Header field. In this way, the
> packet is dropped also when the Fragment or AH header comes directly
> before the SRH. A Fragment or AH header before the SRH, with or without
> other headers in between, does not follow RFC 8200 and RFC 4302: a
> Fragment header must not come before the Routing header, as the
> Per-Fragment headers must include the Routing header [1], and AH should
> not come before the routing and fragmentation headers [2].
> 
> At the penultimate segment, End with the PSP flavor alone today drops
> (a) and forwards (b) with the SRH removed. Packets with the Fragment or
> AH header after the SRH are not affected: seg6_pop_srh() does not look
> at the headers after the SRH.
> 
> Found by manual code inspection and reproduced in a VM without kernel
> changes or error injection, by sending to End with PSP the packets
> shown in the diagram, both with a Fragment header and with AH. With this
> change, the packets are dropped in both cases, all tests in
> srv6_end_flavors_test.sh pass, and KASAN reports no error. With the
> whole series, all the srv6_*.sh selftests pass.
> 
> [1] - https://datatracker.ietf.org/doc/html/rfc8200#section-4.5
> [2] - https://datatracker.ietf.org/doc/html/rfc4302#section-3.1.1
> 
> Fixes: bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End behavior")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/seg6_local.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 0c3d1be7f129..da8225591fe3 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -796,11 +796,6 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
>  			if (unlikely(!hp))
>  				return false;
>  
> -			if (hp->nexthdr == NEXTHDR_ROUTING) {
> -				hp->nexthdr = srh_nexthdr;
> -				break;
> -			}
> -
>  			switch (nexthdr) {
>  			case NEXTHDR_FRAGMENT:
>  				fallthrough;
> @@ -812,6 +807,11 @@ static bool seg6_pop_srh(struct sk_buff *skb, int srhoff)
>  				break;
>  			}
>  
> +			if (hp->nexthdr == NEXTHDR_ROUTING) {
> +				hp->nexthdr = srh_nexthdr;
> +				break;
> +			}
> +
>  			nexthdr = hp->nexthdr;
>  		}
>  	}
> -- 
> 2.43.0
> 

After changing the order, we can check the FRAG/AH header first and
return false and drop the pkt.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
