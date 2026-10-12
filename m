Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527E448CEC
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793073; cv=none; b=XyNHfTXrme45wzbW0Jx2npLG1mMzo1pYm9B7Bj2bOZlhuAz9HOmzPTYZDr9wX/MBK9mDQ3uyNDsSzlz9m9RsyP8gFHCyvxEH04mwBaBIojvn2IcOcxun3LwvNyPNJ+s7kfyiTU2HvbCNSUk1IafV78HOBKI4kKCn7o73SncPm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793073; c=relaxed/simple;
	bh=oiQs+XaAPXnhj3q2rBXJEJ5pvTTgbC4S2aepl5uzLe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCu8g1qPhdUFwWh7s5fmM03Sq7ZcWm1GI3giZzo4/BLgC85KCYDrlYhT1PCzlFCBe7H88mqK9dYTUbm1C39DYB+o0m1FnCMN1W8M94uEVOdDwonFxpgX0ZI9ajAxLI8Y0S10DhV5yhqZ40wBIYco1gQv2wRX6iwKhaqoHmMWF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r9Yw1yA4; arc=none smtp.client-ip=91.218.175.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r9Yw1yA4"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oiQs+XaAPXnhj3q2rBXJEJ5pvTTgbC4S2aepl5uzLe4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791793069; v=1; x=1792397869;
 b=r9Yw1yA480UQrT66imwaLswS7CZn4oX+fMt7jmieYKMuZU4LQfE6oIIP5C7UCcXkKcDfehT8
 eM10ev1x6JvfVP7/6/Jh8lDIFp3VxXpSVvFudxcXJc30IS+bKgxBOPdB7RHAXQ4xwDaPteHRUDn
 YO0wSWfo61PmlygbqCjc0ZCc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 108c7064bb8ec50c;
	Mon, 12 Oct 2026 08:17:49 +0000
X-Mizu-Trace-ID: 108c7064bb8ec50c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 16:17:41 +0800
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
Subject: Re: [PATCH net-next 3/5] seg6: apply the PSP flavor together with
 NEXT-C-SID in SRv6 End
Message-ID: <asyXpWXMeKnPw9U6@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
 <20261011192310.55-4-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011192310.55-4-andrea.mayer@uniroma2.it>

On Sun, Oct 11, 2026 at 09:23:08PM +0200, Andrea Mayer wrote:
> Since commit bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End
> behavior"), an SRv6 End route can be set up with both the NEXT-C-SID and
> the PSP flavors, e.g.:
> 
>   ip -6 route add fcbb:0:100::/48 encap seg6local action End \
>           flavors next-csid,psp lblen 32 nflen 16 dev dum0
> 
> In RFC 9800, the NEXT-C-SID flavor (NEXT-CSID in the RFC) changes the
> End processing only when the Argument is not zero [1]. With a zero
> Argument (i.e. when the IPv6 DA carries no further C-SID), End is
> processed as in RFC 8986, and the PSP flavor (when set) applies
> unchanged [2]. If the packet arrives with Segments Left 1, PSP must
> then remove the SRH.
> 
> However, on a route with both the NEXT-C-SID and PSP flavors,
> input_action_end() always uses the NEXT-C-SID processing. The
> NEXT-C-SID processing handles a packet with a zero Argument as End
> without flavors, ignoring PSP. Therefore, if this packet arrives with
> Segments Left 1, the SRH is not removed.
> 
> Fix this by using the NEXT-C-SID processing only when the Argument is
> not zero or the route has no RFC 8986 flavor. Otherwise, the packet is
> processed as End with its RFC 8986 flavors, in end_flv8986_core(). With
> a zero Argument and Segments Left 1, PSP now removes the SRH before the
> packet is forwarded. If seg6_pop_srh() cannot remove the SRH, the packet
> is dropped, as on a route with the PSP flavor alone.
> 
> Found by manual code inspection and reproduced in a VM without kernel
> changes or error injection. A following commit adds tests for this case
> to srv6_end_flavors_test.sh. The tests reproduce the issue: they fail
> without this change and pass with it.
> 
> [1] - https://datatracker.ietf.org/doc/html/rfc9800#section-4.1.1
> [2] - https://datatracker.ietf.org/doc/html/rfc9800#section-4.1.7
> 
> Fixes: bdf3c0b9c10b ("seg6: add PSP flavor support for SRv6 End behavior")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/seg6_local.c | 50 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 26cd4facbe36..427d12fedfc3 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -551,6 +551,47 @@ static bool seg6_next_csid_enabled(__u32 fops)
>  	return fops & SEG6_F_LOCAL_FLV_NEXT_CSID;
>  }
>  
> +static bool seg6_flv8986_enabled(__u32 fops)
> +{
> +	return fops & SEG6_LOCAL_FLV8986_SUPP_OPS;
> +}
> +
> +/* check whether the NEXT-C-SID processing has to be used for the packet,
> + * instead of the RFC8986 flavors set for the given SRv6 End* behavior
> + * instance.
> + *
> + * This function returns:
> + *  - true, when the packet has to go through the NEXT-C-SID processing;
> + *  - false, when NEXT-C-SID is not configured or the packet has to be
> + *    processed on the basis of the RFC8986 flavors.
> + */
> +static bool seg6_use_next_csid(struct sk_buff *skb,
> +			       const struct seg6_flavors_info *finfo)
> +{
> +	const struct in6_addr *addr;
> +	__u32 fops = finfo->flv_ops;
> +
> +	if (!seg6_next_csid_enabled(fops))
> +		return false;
> +
> +	addr = &ipv6_hdr(skb)->daddr;
> +
> +	/* NEXT-C-SID and the RFC8986 flavors combine according to the
> +	 * DA.Argument (see RFC9800, sections 4.1.1 and 4.1.7):
> +	 *
> +	 *       DA.Argument   RFC8986 flavors   processing
> +	 *   (1) != 0          any               NEXT-C-SID only, SL unchanged
> +	 *   (2) == 0          none              the behavior, e.g. End
> +	 *   (3) == 0          one or more       the behavior with its flavors,
> +	 *                                       e.g. End with PSP
> +	 *
> +	 * In (2), the packet still goes through the NEXT-C-SID processing,
> +	 * which runs the behavior (e.g. End) when the DA.Argument is zero.
> +	 */
> +	return !seg6_flv8986_enabled(fops) ||
> +	       !seg6_next_csid_is_arg_zero(addr, finfo);

nit: based on the comment, maybe we can change the order to

	return !seg6_next_csid_is_arg_zero(addr, finfo) ||
	       !seg6_flv8986_enabled(fops);

No need to change if there is no new version patch.

> +}
> +
>  /* Processing of SRv6 End, End.X, and End.T behaviors can be extended through
>   * the flavors framework. These behaviors must report the subset of (flavor)
>   * operations they currently implement. In this way, if a user specifies a
> @@ -865,7 +906,10 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  	if (srh && !seg6_hmac_validate_skb(skb, srh))
>  		goto drop;
>  #endif
> -	flvmask = finfo->flv_ops;
> +	/* NEXT-C-SID, when configured, has already been evaluated by the
> +	 * caller. Only the RFC8986 flavors are left here.
> +	 */
> +	flvmask = finfo->flv_ops & ~SEG6_F_LOCAL_FLV_NEXT_CSID;
>  	if (unlikely(flvmask & ~SEG6_LOCAL_FLV8986_SUPP_OPS)) {
>  		pr_warn_once("seg6local: invalid RFC8986 flavors\n");
>  		goto drop;
> @@ -919,8 +963,8 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  	if (!fops)
>  		return input_action_end_core(skb, slwt);
>  
> -	/* check for the presence of NEXT-C-SID since it applies first */
> -	if (seg6_next_csid_enabled(fops))
> +	/* NEXT-C-SID is evaluated first, when configured */
> +	if (seg6_use_next_csid(skb, finfo))
>  		return end_next_csid_core(skb, slwt);
>  
>  	/* the specific processing function to be performed on the packet
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

Thanks
Hangbin
