Received: from mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DE54706B
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 00:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025682; cv=none; b=pPIAcIX99Geq+RMnLL+Ay+fHSxR3MxHrnPTiLGKWWfJ8NNBCOF9M3wVjZTamQEnSynqVF45BEkbVI03Ue/7HMoQBqy6oKApGffKbXdyw8weLrTtmHCUmC7UGmDn0Y+DTC2w6KtjTxiYRLdobEIGOWcSLOpn2kPYy5d9L5CQRWaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025682; c=relaxed/simple;
	bh=r247dczbk+8j7HVrazYqB4jq4GEyWT/BBF98AxWtuB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEJcrUioOFRU3NGDIjnAveMPlMi6rvAas3LFgkmDqJqe42soyARryj4vkp/6fZecKmNdOlM8YV97J1BJGC7dQFe41m8v8lISHMupoDN0YMTiMIuxz467+Yze6I/0K7ckdjs67bvc9hF12qjwFj8F7aYkEBU0hpf0U0EruTvu+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SE4RzuVO; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SE4RzuVO"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r247dczbk+8j7HVrazYqB4jq4GEyWT/BBF98AxWtuB8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792025678; v=1; x=1792630478;
 b=SE4RzuVOWBfqDbbWmdLh+Oxecw401ihk60GUM7rm7cXZyltp45UG3LSkJ3Ju3W8/aF6xrw9l
 jEBYhbzYoACrrOHpXccNirXLrIsOQqOSazOQLXlrJu2mmiKwjT5CvutLfDA7ytOxK7vVwmWaJwD
 uVSFpBAh+9MA8QRZqrwokSmE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 57c161504278a604;
	Thu, 15 Oct 2026 00:54:37 +0000
X-Mizu-Trace-ID: 57c161504278a604
X-Migadu-Flow: FLOW_OUT
Date: Thu, 15 Oct 2026 08:54:30 +0800
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
Subject: Re: [PATCH net-next 3/5] seg6: apply the PSP flavor together with
 NEXT-C-SID in SRv6 End
Message-ID: <atAkRpVssWDpyx9-@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
 <20261011192310.55-4-andrea.mayer@uniroma2.it>
 <asyXpWXMeKnPw9U6@fedora>
 <20261015000052.7731f972b28eb12ab57dd93c@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015000052.7731f972b28eb12ab57dd93c@uniroma2.it>

On Thu, Oct 15, 2026 at 12:00:52AM +0200, Andrea Mayer wrote:
> On Mon, 12 Oct 2026 16:17:41 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > [snip]
> > > +static bool seg6_flv8986_enabled(__u32 fops)
> > > +{
> > > +	return fops & SEG6_LOCAL_FLV8986_SUPP_OPS;
> > > +}
> > > +
> > > +/* check whether the NEXT-C-SID processing has to be used for the packet,
> > > + * instead of the RFC8986 flavors set for the given SRv6 End* behavior
> > > + * instance.
> > > + *
> > > + * This function returns:
> > > + *  - true, when the packet has to go through the NEXT-C-SID processing;
> > > + *  - false, when NEXT-C-SID is not configured or the packet has to be
> > > + *    processed on the basis of the RFC8986 flavors.
> > > + */
> > > +static bool seg6_use_next_csid(struct sk_buff *skb,
> > > +			       const struct seg6_flavors_info *finfo)
> > > +{
> > > +	const struct in6_addr *addr;
> > > +	__u32 fops = finfo->flv_ops;
> > > +
> > > +	if (!seg6_next_csid_enabled(fops))
> > > +		return false;
> > > +
> > > +	addr = &ipv6_hdr(skb)->daddr;
> > > +
> > > +	/* NEXT-C-SID and the RFC8986 flavors combine according to the
> > > +	 * DA.Argument (see RFC9800, sections 4.1.1 and 4.1.7):
> > > +	 *
> > > +	 *       DA.Argument   RFC8986 flavors   processing
> > > +	 *   (1) != 0          any               NEXT-C-SID only, SL unchanged
> > > +	 *   (2) == 0          none              the behavior, e.g. End
> > > +	 *   (3) == 0          one or more       the behavior with its flavors,
> > > +	 *                                       e.g. End with PSP
> > > +	 *
> > > +	 * In (2), the packet still goes through the NEXT-C-SID processing,
> > > +	 * which runs the behavior (e.g. End) when the DA.Argument is zero.
> > > +	 */
> > > +	return !seg6_flv8986_enabled(fops) ||
> > > +	       !seg6_next_csid_is_arg_zero(addr, finfo);
> > 
> > nit: based on the comment, maybe we can change the order to
> > 
> > 	return !seg6_next_csid_is_arg_zero(addr, finfo) ||
> > 	       !seg6_flv8986_enabled(fops);
> > 
> > No need to change if there is no new version patch.
> > 
> > > +}
> > 
> > [snip]
> 
> Hi Hangbin,
> 
> thanks for the review and for the suggestion. I would prefer to keep
> this order. The table in the comment is meant to describe the cases
> rather than the order of the checks. Since testing the 32-bit flavor
> mask can be cheaper than checking the DA.Argument, I just put the mask
> test first.
> 
> Let me know if you see it differently.

Yes, putting the mask test first makes sense to me.

Thanks
Hangbin
