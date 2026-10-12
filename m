Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42601282F17
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769096; cv=none; b=l/Q51SmH2iGFkBK7kEe/z1KfHhtapIBs0Z2zdX3/jFXQO8SG+3eFR0Bm51UQf5FBmmJRY+eqkH6/DDcX/B1oRW/zELvRfniTOxLzgZxy449Z2d/6YtGwOGOoQeG+j4A3lId22gAoztGWwP09vCclKg3ZsGz7OkY2JSqDzosFFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769096; c=relaxed/simple;
	bh=DwPAqyo+kbHR4QZnsyXrErGHTcNhB6rs1BCvftMQZjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEqPybjvZz1qQ2Hb+6X2gdx37T0/v/+EmCf5Na1Qs2c00EtibrsazCq4numy9brafAufz5qN5CU9zqtluiPYfdjYdhf3xdAnBjpNeubZpNVVlGsRuosmU7KvW2aOV5U+kwERSmkfGDD9MWVFsIzsQwJp+GEagOLCcqhVyohH1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JXM8zNSI; arc=none smtp.client-ip=95.215.58.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JXM8zNSI"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DwPAqyo+kbHR4QZnsyXrErGHTcNhB6rs1BCvftMQZjw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791769093; v=1; x=1792373893;
 b=JXM8zNSI7eQgQQGm5PphOuaxKoQrEX4Kxkovv9MMM5okDUB2kEBdXpDrAhK8+qjnBZ131aMi
 m6HvJ6YEq+W7YqfzqU2OybwlUA1e8fbDqql8y4Miv83DyHovkEwFUe3xYCs07SewXAhVM8pHOjh
 hCKjg6zEW2lrhk03p3JRlU0Y=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a7f938bb652c49cd;
	Mon, 12 Oct 2026 01:38:12 +0000
X-Mizu-Trace-ID: a7f938bb652c49cd
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 09:38:05 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>, stefano.salsano@uniroma2.it,
	andrea@common-net.org
Subject: Re: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for
 End.X
Message-ID: <asw5_RwRV5JKLg3l@fedora>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
 <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
 <20261012025900.c2321bfa92c5863d21efdba3@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012025900.c2321bfa92c5863d21efdba3@uniroma2.it>

Hi Andrea,
On Mon, Oct 12, 2026 at 02:59:00AM +0200, Andrea Mayer wrote:
> On Fri, 09 Oct 2026 17:58:38 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > From: Hangbin Liu <liuhangbin@kylinos.cn>
> > 
> > Previously End.X only supported NEXT-C-SID, with a plain fallback to
> > input_action_end_x_core(). Add PSP End.X processing by reusing
> > end_flv8986_core().
> > 
> > Add SEG6_LOCAL_FLV8986_SUPP_OPS to SEG6_LOCAL_END_X_FLV_SUPP_OPS so
> > End.X advertises PSP flavor support.
> > 
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> > ---
> > 
> > For Sashiko:
> > 
> > With the SEG6_LOCAL_END_X_FLV_SUPP_OPS mask widened, parse_nla_flavors()
> > now accept the combination next-csid plus psp for an End.X instance. And
> > the current code is unable to handle this combination. The End instance
> > also has this issue. Andrea is preparing a fix for this bug.
> 
> Hi Hangbin,
> 
> thanks for v2, and for your work.
> 
> The End fix is now posted, to net-next and not to net as I wrote on
> v1, since the issues it fixes have been there since PSP was added:
> 
>   https://lore.kernel.org/netdev/20261011192310.55-1-andrea.mayer@uniroma2.it/

Yes, I saw it.

> 
> > ---
> >  net/ipv6/seg6_local.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> > index 4fcfcd48cfae..521a9b0c0929 100644
> > --- a/net/ipv6/seg6_local.c
> > +++ b/net/ipv6/seg6_local.c
> > @@ -121,7 +121,8 @@ struct bpf_lwt_prog {
> >  
> >  #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> >  					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> > -#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
> > +#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> > +					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> >  
> >  struct seg6_flavors_info {
> >  	/* Flavor operations */
> > [snip]
> > @@ -923,12 +924,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
> >  {
> >  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
> >  	__u32 fops = finfo->flv_ops;
> > +	int ret;
> > +
> > +	if (!fops)
> > +		return input_action_end_x_core(skb, slwt);
> >  
> >  	/* check for the presence of NEXT-C-SID since it applies first */
> >  	if (seg6_next_csid_enabled(fops))
> >  		return end_x_next_csid_core(skb, slwt);
> 
> Here End.X could do what End does in the fix: call
> seg6_use_next_csid() instead of seg6_next_csid_enabled(), so that a
> packet with a zero Argument is processed as End.X with PSP.
> 
> Does it work for you to rebase this series on top of the End fix,
> once it is merged, and make that change in this patch? Then End.X
> handles the combination from the beginning.

OK, hope it doesn't take too long time.

> 
> The selftests of the two series conflict in srv6_end_flavors_test.sh,
> and they set up the test environment differently. If you want a hand
> with that part, I am glad to help.

I will review the selftest update and try rebase my test on yours.
If there is a need, I will ask for your help.

> 
> Side note: I received only part of this series. Could you please also
> Cc andrea@common-net.org, in this thread and on the next versions?

Sure, I will.

Thanks
Hangbin
