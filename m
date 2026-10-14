Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8070F480356;
	Wed, 14 Oct 2026 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015293; cv=none; b=eNuM0V1u94NeMP0aug5T9LCHMxL2UF93BIj148W245cW1EzV3byYOA1BabMMaJWCTTx5TmXThWxQXAAfpGV52sgvizdRMwDNS9qBVmJ2AYSBK9CY/f0QAKzsOlQJp7rB6UNpS/TfG9TzrTWO4ebCByyHpI6HiL9UHVKzGeLqG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015293; c=relaxed/simple;
	bh=K7ErMmg4iIXxElL/loaoTPxck/WbvlAZVoaymLW7RZg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=H92F1f2GdFx0AphHOOxhgIP12UggrtdmKxR/ToCegpCTNHbi3VFrNPBa1+4fmZqFvfd4x4eaf9J8nOJ75c51nbvgmuDPiETvuByqb6utL8GH+QvnNCvOO7LOwaeDpV20csi8SaQ+gFSU477DHBZSjXFm6ciSaJFCiRfakMNfkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=b2+43mxV; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=Qu00wAxp; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="b2+43mxV";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="Qu00wAxp"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69EM0vkA020946;
	Thu, 15 Oct 2026 00:01:02 +0200
Received: from lubuntu-18.04 (host-79-32-222-240.retail.telecomitalia.it [79.32.222.240])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id BD9BF1228C9;
	Thu, 15 Oct 2026 00:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1792015253; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOqHPjPb+UnLTKnHvYlBvBRtCF+sTWDYKSjDVaWimnQ=;
	b=b2+43mxVu/maB9IzEf+zp3XEE/OEvg5XWqTkaf/78I1ImhbIjk/suI/cC13SuUxqmPsLdq
	RVVZttCdB9+gXuBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1792015253; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOqHPjPb+UnLTKnHvYlBvBRtCF+sTWDYKSjDVaWimnQ=;
	b=Qu00wAxptWN8f0RLV6wObqeRdugAEogGCu9WpCbKQQeGW9/0XfxF/eLpJ3rgXz2xvwLZ3h
	QF2/axD7GNVRgzn8jj/Zreopgs27EOJadCQbeLyybyLKgkPpZE5k+fGu7T4w9xUcKxo1z/
	ApwGN/PTi+0jN2vAEcqlJyGfFL17dXtFYOuo3kXx/yzv8wJspZ8ARlTUCahNs3Nx0Sg2vA
	qVRmTafr3XSwyJgo5ovaPW2BXTSG8K7T1ydC2gKJWlHHlSL5yqkHBPgqzZeBUospg4zYcD
	3gjCAaxcnfcLmiMmKQdkkEyNKC0XjlHHsvAtk2Fbc4Bf5CXGL1zjpbCm3yjU2g==
Date: Thu, 15 Oct 2026 00:00:52 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
        Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Justin
 Iurman <justin.iurman@gmail.com>,
        Nicolas Dichtel
 <nicolas.dichtel@6wind.com>,
        Ahmed Abdelsalam <ahabdels@cisco.com>,
        Stefano
 Salsano <stefano.salsano@uniroma2.it>, andrea@common-net.org,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next 3/5] seg6: apply the PSP flavor together with
 NEXT-C-SID in SRv6 End
Message-Id: <20261015000052.7731f972b28eb12ab57dd93c@uniroma2.it>
In-Reply-To: <asyXpWXMeKnPw9U6@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
	<20261011192310.55-4-andrea.mayer@uniroma2.it>
	<asyXpWXMeKnPw9U6@fedora>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Mon, 12 Oct 2026 16:17:41 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> [snip]
> > +static bool seg6_flv8986_enabled(__u32 fops)
> > +{
> > +	return fops & SEG6_LOCAL_FLV8986_SUPP_OPS;
> > +}
> > +
> > +/* check whether the NEXT-C-SID processing has to be used for the packet,
> > + * instead of the RFC8986 flavors set for the given SRv6 End* behavior
> > + * instance.
> > + *
> > + * This function returns:
> > + *  - true, when the packet has to go through the NEXT-C-SID processing;
> > + *  - false, when NEXT-C-SID is not configured or the packet has to be
> > + *    processed on the basis of the RFC8986 flavors.
> > + */
> > +static bool seg6_use_next_csid(struct sk_buff *skb,
> > +			       const struct seg6_flavors_info *finfo)
> > +{
> > +	const struct in6_addr *addr;
> > +	__u32 fops = finfo->flv_ops;
> > +
> > +	if (!seg6_next_csid_enabled(fops))
> > +		return false;
> > +
> > +	addr = &ipv6_hdr(skb)->daddr;
> > +
> > +	/* NEXT-C-SID and the RFC8986 flavors combine according to the
> > +	 * DA.Argument (see RFC9800, sections 4.1.1 and 4.1.7):
> > +	 *
> > +	 *       DA.Argument   RFC8986 flavors   processing
> > +	 *   (1) != 0          any               NEXT-C-SID only, SL unchanged
> > +	 *   (2) == 0          none              the behavior, e.g. End
> > +	 *   (3) == 0          one or more       the behavior with its flavors,
> > +	 *                                       e.g. End with PSP
> > +	 *
> > +	 * In (2), the packet still goes through the NEXT-C-SID processing,
> > +	 * which runs the behavior (e.g. End) when the DA.Argument is zero.
> > +	 */
> > +	return !seg6_flv8986_enabled(fops) ||
> > +	       !seg6_next_csid_is_arg_zero(addr, finfo);
> 
> nit: based on the comment, maybe we can change the order to
> 
> 	return !seg6_next_csid_is_arg_zero(addr, finfo) ||
> 	       !seg6_flv8986_enabled(fops);
> 
> No need to change if there is no new version patch.
> 
> > +}
> 
> [snip]

Hi Hangbin,

thanks for the review and for the suggestion. I would prefer to keep
this order. The table in the comment is meant to describe the cases
rather than the order of the checks. Since testing the 32-bit flavor
mask can be cheaper than checking the DA.Argument, I just put the mask
test first.

Let me know if you see it differently.

Ciao,
Andrea
