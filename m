Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522573451A7;
	Mon, 12 Oct 2026 00:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791766781; cv=none; b=cttGzCxGa4VxjIRHw0VHol6nkHWjui6tH9IHV1FYFEMXa49FUB28l+kmOiHzZ5tyfXScfh0jhdckYnkAEGAaYaKNN/zB3T/LF8sWh+mK9/h/DhEfZCh02JfX8N0G83vmUjNJYxrSHTqilwMizriyIb6+ig3XUV+X7UwJ/6xWYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791766781; c=relaxed/simple;
	bh=YSyZHAB6Vtxc17lVBX2ybA+plNkuA8JrLtQTp8bDBgE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=se+6sIvOBNuYX0OLm1QbOVQURdicIw0J1mYRpDaLU/aslI+bHMNV3lPRdgk+0PkJfSxM+wp8IOmxVjR/bPvZZ3BqB2n3PrZUfxxKZp5tSgjwIlhzG4FACCbFxKUTBbPdBhN1OH/8i35xt7LSFeOA6qm8oZfA9caDLHxXx2kz7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=XBUq+SEh; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=c6KDWHV+; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="XBUq+SEh";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="c6KDWHV+"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69C0x4p6020545;
	Mon, 12 Oct 2026 02:59:09 +0200
Received: from lubuntu-18.04 (host-79-32-222-240.retail.telecomitalia.it [79.32.222.240])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 16DEB12289F;
	Mon, 12 Oct 2026 02:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1791766741; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhHmgfXv1JVxKVN/OgXAPIowjeub0F9/DIzebdwQqM0=;
	b=XBUq+SEhqYcghbD7qdyo0maRVL7BbGREUMT/gdyTYMHv4U7TV4yTc03NrQMEfChU5g2oUh
	a6aeON6CkqLEhQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1791766741; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhHmgfXv1JVxKVN/OgXAPIowjeub0F9/DIzebdwQqM0=;
	b=c6KDWHV+exO5JQp+6M+3mEhExto4Uv2V9y5cMK1u8p9WkcUwf8J5PdEREJqMxKhwnHxFQU
	Wg553JMvACVFkDzwlXj8TvW5NDmdWWDlIt6UFfzxPl0QbZc8HAux9ZVKAY7x77GZQuZe7E
	1lP0bwfXXiNINAyD0tlPBkWyDOyJ1BuWk2KY+3PaU3OTRbc66CY4IxEJCeQ7erPE7lHUWd
	68/HfDJbAFUZqK/aA361YgJjLSsXJaaPKNG2p2hPcWNJPpKW7UkLOFbKQcYDNOPqDv1BFd
	3RugaG6ENhsHWWGMj8VFdE1+dP8wNToBg+vEHpDPWVRbF4+cUeKp8tZPlBLfrg==
Date: Mon, 12 Oct 2026 02:59:00 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Eric Dumazet
 <edumazet@kernel.org>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>,
        stefano.salsano@uniroma2.it, Andrea Mayer
 <andrea.mayer@uniroma2.it>,
        andrea@common-net.org
Subject: Re: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for
 End.X
Message-Id: <20261012025900.c2321bfa92c5863d21efdba3@uniroma2.it>
In-Reply-To: <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
	<20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
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

On Fri, 09 Oct 2026 17:58:38 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Previously End.X only supported NEXT-C-SID, with a plain fallback to
> input_action_end_x_core(). Add PSP End.X processing by reusing
> end_flv8986_core().
> 
> Add SEG6_LOCAL_FLV8986_SUPP_OPS to SEG6_LOCAL_END_X_FLV_SUPP_OPS so
> End.X advertises PSP flavor support.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> 
> For Sashiko:
> 
> With the SEG6_LOCAL_END_X_FLV_SUPP_OPS mask widened, parse_nla_flavors()
> now accept the combination next-csid plus psp for an End.X instance. And
> the current code is unable to handle this combination. The End instance
> also has this issue. Andrea is preparing a fix for this bug.

Hi Hangbin,

thanks for v2, and for your work.

The End fix is now posted, to net-next and not to net as I wrote on
v1, since the issues it fixes have been there since PSP was added:

  https://lore.kernel.org/netdev/20261011192310.55-1-andrea.mayer@uniroma2.it/

> ---
>  net/ipv6/seg6_local.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 4fcfcd48cfae..521a9b0c0929 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -121,7 +121,8 @@ struct bpf_lwt_prog {
>  
>  #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
>  					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> -#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
> +#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> +					 SEG6_LOCAL_FLV8986_SUPP_OPS)
>  
>  struct seg6_flavors_info {
>  	/* Flavor operations */
> [snip]
> @@ -923,12 +924,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  {
>  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
>  	__u32 fops = finfo->flv_ops;
> +	int ret;
> +
> +	if (!fops)
> +		return input_action_end_x_core(skb, slwt);
>  
>  	/* check for the presence of NEXT-C-SID since it applies first */
>  	if (seg6_next_csid_enabled(fops))
>  		return end_x_next_csid_core(skb, slwt);

Here End.X could do what End does in the fix: call
seg6_use_next_csid() instead of seg6_next_csid_enabled(), so that a
packet with a zero Argument is processed as End.X with PSP.

Does it work for you to rebase this series on top of the End fix,
once it is merged, and make that change in this patch? Then End.X
handles the combination from the beginning.

The selftests of the two series conflict in srv6_end_flavors_test.sh,
and they set up the test environment differently. If you want a hand
with that part, I am glad to help.

Side note: I received only part of this series. Could you please also
Cc andrea@common-net.org, in this thread and on the next versions?

Ciao,
Andrea
