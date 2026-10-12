Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1D93B1014;
	Mon, 12 Oct 2026 21:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841293; cv=none; b=h1akOXLrymyW+w+ugswg4OzJdCpsNmI8oQbga7d2EX44G+BjMYxJLB6i1fxXOwHTJxkkuApiYAKWp6yoTTUqjkHCLANUJHP7W6hLhmxbgiyV5GIb0+c5lvtRC1H5BruFLktvwJU4zWEBq8VZX+IghPWxWFkHhpAL2V238wuXOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841293; c=relaxed/simple;
	bh=x9AQso71f3cMdClxIqAmkPOZSWhtrTIdME3BBnziNVo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MNADvYIlgnGo73JNWZZHjcFUbN9ef0ez+8UkZXAmBVGjs3rAGTQuB2f1DkKUCMK7EWhoOTIKliD59k08MmHjHwovtgRfQXfhj98JraAiBoFm3z5+Ikd0mT5x60KtJVOjVFoeDg4m6AemGEa0ptV1JesDELIO5g7xescXCdpZtk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=u4ZXXagY; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=qfALz9t1; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="u4ZXXagY";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="qfALz9t1"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69CLeh7F005040;
	Mon, 12 Oct 2026 23:40:49 +0200
Received: from lubuntu-18.04 (host-79-32-222-240.retail.telecomitalia.it [79.32.222.240])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 2AF841228B8;
	Mon, 12 Oct 2026 23:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791841240; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELEP74a+sacLcIQbxnKcWiKNFG4hCv7wPQu6W0+O0cM=;
	b=u4ZXXagYlcFpc72xo57QtAwIvkf2MgQTamRS+OLIJPW641zWWwHLyYUDBdObcIkl4C8CGt
	vtAdTjiyZt9VuoCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791841240; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELEP74a+sacLcIQbxnKcWiKNFG4hCv7wPQu6W0+O0cM=;
	b=qfALz9t1UpToAitMqvtN+G1RR7pewTmxSfN4+zIdv6tET/AOlZiaNp7SrazuNzfo14z1rG
	RtMCQqSolbTDn/jyqpz9TjyuvCWND9po/0Wn685psCEtaQeCVHjIiBBDZwx4pHe4+NWeTV
	G4S88EPaIbGgGlAzpf7KNWiWPxGR4WxiKMrgczA8IduMu/ma2VyIk+4jK16ymPJftInolR
	mAS66B/j1dUdd3/aorix89p/yT+oqm6/9vLmXurPTvOuOrSqnMeL7eCoXAAaWEpvvaP7dw
	TRJ6vMOej01VaNT3UJUIuaQR62bpVU+Z6QArBnQms+txMAh9WBsFDlE+QMUTFQ==
Date: Mon, 12 Oct 2026 23:40:39 +0200
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
 Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>, andrea@common-net.org
Subject: Re: [PATCH net-next 2/5] seg6: handle a consumed SRH in SRv6 End
 with the PSP flavor
Message-Id: <20261012234039.162d27bd311a5027a9beb641@uniroma2.it>
In-Reply-To: <asyoJvcaU14ip-d4@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
	<20261011192310.55-3-andrea.mayer@uniroma2.it>
	<asyoJvcaU14ip-d4@fedora>
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

On Mon, 12 Oct 2026 17:28:06 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> [snip]
> >  
> > +/* look up the SRH to be processed by the RFC8986 flavors. As End does, a
> > + * routing header with SL = 0 is skipped (e.g. an SRH already consumed).
> > + * This function returns NULL when no valid SRH is found.
> > + */
> > +static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
> > +{
> > +	struct ipv6_sr_hdr *srh;
> > +
> > +	srh = seg6_get_srh(skb, IP6_FH_F_SKIP_RH);
> > +	if (srh)
> > +		return srh;
> > +
> > +	/* we take the first routing header without skipping it. In this way,
> > +	 * seg6_get_srh_pktinfo() reports SL = 0 and not a missing SRH.
> > +	 */
> > +	return seg6_get_srh(skb, 0);
> > +}
> > +
> >  /* process the packet on the basis of the RFC8986 flavors set for the given
> >   * SRv6 End behavior instance.
> >   */
> > @@ -837,7 +858,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
> >  	__u32 flvmask;
> >  	int srhoff;
> >  
> > -	srh = seg6_get_srh(skb, 0);
> > +	srh = seg6_flv8986_get_srh(skb);
> 
> Hmm, here we always try skip the SL = 0 SRH when multi SRH exists. What if
> we want to add USP flavor support in future? Then we will not able to remove
> the first SRH which SL = 0, right? e.g.
> 
>    +------+----------------------+----------------------+---------+
>    | IPv6 | SRH, Segments Left 0 | SRH, Segments Left 2 | payload |
>    +------+----------------------+----------------------+---------+
> 
> Thanks
> Hangbin
> 

Hi Hangbin,
thanks for the review and for testing the series.

As it is now, seg6_flv8986_get_srh() skips that SRH, while with USP it
should be removed. USP is not supported today, and for PSP without USP,
skipping that SRH is correct.

When USP is implemented, that SRH can still be removed, for example by
extending seg6_flv8986_get_srh() to take the flavors into account. Its
comment would then be updated as well.

Does that sound reasonable to you?

Ciao,
Andrea
