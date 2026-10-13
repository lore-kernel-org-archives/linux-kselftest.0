Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF8374170
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 00:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791851354; cv=none; b=B/XqOAJcfJMtkhRuBjA+o2lsyz3FuJmmxzPyi7BdnnRi2Yjfz+sfeFfYq0A/PRXiu432z0WoSBbarb+Nj9w3gMCqE0k3EUWRGjkaw4CcFWx9N+RchIaOqKDszuggejg7A557BJjIOXMJqOz4RHIDqUVkoBFOI6t1gmulxV046So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791851354; c=relaxed/simple;
	bh=oEmlaBjKVlG4C1XGcvXM/O9n70zjoI3oODyN0BTBHtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtlNsizx8cim4rOaU+IHsWdETrOzPil7shbZPO+r5vBVav4d5l2fmE06ozR/3G1UlkR/1djhKutc2m03YlwPm3kZjzbyPOi0xFKyp+1/Hnkr4jm5vH2XbKQG/PHwMuK+beqVZ7pqLnKiyaaXqyYPE2rMdFbsg6xuR3vy6uRQ4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A0wHuhWj; arc=none smtp.client-ip=95.215.58.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A0wHuhWj"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oEmlaBjKVlG4C1XGcvXM/O9n70zjoI3oODyN0BTBHtc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791851350; v=1; x=1792456150;
 b=A0wHuhWjuh5OJcM9jeOBbbhUUPVRhEuk+TtgbjLwZ/8HUpBFtwz7mBSfH4ByMM9M0eibpHXP
 rI42vTKz7+Qdx9ab8koZXhRHuIEKuDH6Pj7BqIOuiLnbWJ3W2Cnh03+X8KrRz1ceXZh/gYL1/c3
 CBS1obNpMK6+gds1rOqq+hsw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a4fdbf7f3be1b2d9;
	Tue, 13 Oct 2026 00:29:09 +0000
X-Mizu-Trace-ID: a4fdbf7f3be1b2d9
X-Migadu-Flow: FLOW_OUT
Date: Tue, 13 Oct 2026 08:29:02 +0800
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
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	andrea@common-net.org
Subject: Re: [PATCH net-next 2/5] seg6: handle a consumed SRH in SRv6 End
 with the PSP flavor
Message-ID: <as17Tl9qMVEEA6vr@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
 <20261011192310.55-3-andrea.mayer@uniroma2.it>
 <asyoJvcaU14ip-d4@fedora>
 <20261012234039.162d27bd311a5027a9beb641@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012234039.162d27bd311a5027a9beb641@uniroma2.it>

On Mon, Oct 12, 2026 at 11:40:39PM +0200, Andrea Mayer wrote:
> On Mon, 12 Oct 2026 17:28:06 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > [snip]
> > >  
> > > +/* look up the SRH to be processed by the RFC8986 flavors. As End does, a
> > > + * routing header with SL = 0 is skipped (e.g. an SRH already consumed).
> > > + * This function returns NULL when no valid SRH is found.
> > > + */
> > > +static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
> > > +{
> > > +	struct ipv6_sr_hdr *srh;
> > > +
> > > +	srh = seg6_get_srh(skb, IP6_FH_F_SKIP_RH);
> > > +	if (srh)
> > > +		return srh;
> > > +
> > > +	/* we take the first routing header without skipping it. In this way,
> > > +	 * seg6_get_srh_pktinfo() reports SL = 0 and not a missing SRH.
> > > +	 */
> > > +	return seg6_get_srh(skb, 0);
> > > +}
> > > +
> > >  /* process the packet on the basis of the RFC8986 flavors set for the given
> > >   * SRv6 End behavior instance.
> > >   */
> > > @@ -837,7 +858,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
> > >  	__u32 flvmask;
> > >  	int srhoff;
> > >  
> > > -	srh = seg6_get_srh(skb, 0);
> > > +	srh = seg6_flv8986_get_srh(skb);
> > 
> > Hmm, here we always try skip the SL = 0 SRH when multi SRH exists. What if
> > we want to add USP flavor support in future? Then we will not able to remove
> > the first SRH which SL = 0, right? e.g.
> > 
> >    +------+----------------------+----------------------+---------+
> >    | IPv6 | SRH, Segments Left 0 | SRH, Segments Left 2 | payload |
> >    +------+----------------------+----------------------+---------+
> > 
> > Thanks
> > Hangbin
> > 
> 
> Hi Hangbin,
> thanks for the review and for testing the series.
> 
> As it is now, seg6_flv8986_get_srh() skips that SRH, while with USP it
> should be removed. USP is not supported today, and for PSP without USP,
> skipping that SRH is correct.
> 
> When USP is implemented, that SRH can still be removed, for example by
> extending seg6_flv8986_get_srh() to take the flavors into account. Its
> comment would then be updated as well.
> 
> Does that sound reasonable to you?

Yes, this looks good to me. Thanks for the explanation. With this extendable
interface:

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
