Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D888D4A012F;
	Wed, 23 Sep 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164107; cv=none; b=iikVIIUyHT8fpx6bHtEVwNYm78b4WnXaAUv3tVHa7+5bbgqXs6RQyIy+PiBsCVIQX3UVpP+2PLgZkNC3rBy4BHfMr3wvXOuZvZ98cSYuLm3E6zkiy0gGvU5CNwxqPfz6BAsH93MBvEUxAbJuklCt508Sptup5SujX2i2xDSfPHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164107; c=relaxed/simple;
	bh=lPRV1lLPflWQiqC8fVOhei4uQVXrOAjATAOBrda8jXY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bHZeD9WIsVikYOFLM4PDAx7G6OUxzDLrHZ6n60T65uHwqYmxB7TP0jl20JkD39/tq1BLV+DwPCFtXsjl9JR1s5gDb0XOVHQ4D1Ds4fVt+q4LYy+VE9fJSxtCNBVX9cvGMERgnGRYoXN1duHCLuGDqgKzZYjPUoUboM0GerweB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=SbLpb4IH; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=PQpLpM9P; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="SbLpb4IH";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="PQpLpM9P"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 68NBkfAK014041;
	Wed, 23 Sep 2026 13:46:48 +0200
Received: from lubuntu-18.04 (host-95-239-0-205.retail.telecomitalia.it [95.239.0.205])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 61BD41227F6;
	Wed, 23 Sep 2026 13:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1790163998; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFY2r47u5EcmpGwlHaxce4GTpUYJBPfFR1y0sLk2LNQ=;
	b=SbLpb4IHHZuX2qdAIdB0WyY/3ut34bFmPPG4Uc5nKiQ0S0QI+Y6oggbYmef2/F2hArXb/B
	JhJRmRcrR23db6Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1790163998; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFY2r47u5EcmpGwlHaxce4GTpUYJBPfFR1y0sLk2LNQ=;
	b=PQpLpM9P2PVkTCBSOKccaoXuZ5yc2dLEiqge2V22PfQ+4iF/WcXaZhSaA0r2cDNcmIvG82
	ttQKSmGDaaRft/OE+7JFv6hRxOuEmqStXLhmmVO5zvd35LtcsTlKkma7DpGe+sdnjTRGNf
	boDvQ5EZ5DHT8FvpSjtV/Gdsi+tZ7MHxeALx6VuW26d8Y3wlPhCNx7MZy77rcw3mxxh0tB
	UoQ8kJIWcWdK7BrW8ru4rndv5zUfUnFNSpiDnGq//JPirRfOsNd8316WY8QGqNVv6QlcAG
	EDt2bLa/I/HHyyCxwD8LKjUXSk0hbT3W/NBDoTFMbmWyiTKFHM2bNKS5hu7+vA==
Date: Wed, 23 Sep 2026 13:46:37 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>, stefano.salsano@uniroma2.it,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next 1/5] seg6: split final End process out of
 flavor processing
Message-Id: <20260923134637.4e56d6c422e3f89dd17f4a63@uniroma2.it>
In-Reply-To: <20260922-srv6_flavors_endx-v1-1-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
	<20260922-srv6_flavors_endx-v1-1-4d01c05c47b7@kylinos.cn>
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

On Tue, 22 Sep 2026 16:54:43 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

Hi Hangbin,
thanks for the patch.

> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Move the final End forwarding step out of end_flv8986_core() and return
> success to the caller instead.
> 
> Currently end_flv8986_core() performs both RFC8986 flavor processing and
> final End forwarding by calling input_action_end_finish(). That couples
> flavor handling with the End-specific forwarding path, which makes it
> hard to reuse the same flavor logic for other End variants.
> 
> Split the two steps so input_action_end() does:
>   1) end_flv8986_core() for flavor processing
>   2) input_action_end_finish() for final forwarding
> 
> This keeps end_flv8986_core() focused on RFC8986/PSP flavor semantics
> and makes it easier to plug the same flavor core into End.X/T later.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
>  net/ipv6/seg6_local.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index d1070aec7b72..584e6aca3893 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -804,7 +804,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  		goto drop;
>  	}
>  
> -	return input_action_end_finish(skb, slwt);
> +	return 0;
>  
>  drop:
>  	kfree_skb(skb);
> @@ -816,6 +816,7 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  {
>  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
>  	__u32 fops = finfo->flv_ops;
> +	int ret;
>  
>  	if (!fops)
>  		return input_action_end_core(skb, slwt);
> @@ -829,7 +830,10 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  	 * information extracted from the packet, e.g. presence/absence of SRH,
>  	 * Segment Left = 0, etc.
>  	 */
> -	return end_flv8986_core(skb, slwt);
> +	ret = end_flv8986_core(skb, slwt);
> +	if (ret)
> +		return ret;

A nit: a blank line before the final return would match the rest of
the file.

> +	return input_action_end_finish(skb, slwt);
>  }

This changes the semantics of end_flv8986_core(): it no longer
forwards the packet, it only processes it, and the caller does the
finish step. Is it worth saying so in a comment above the function? A
future caller that misses it would leak the skb.

A heads-up: reviewing this made me notice that a fix I have pending
for net touches these same lines. It makes the skb data writable
before advance_nextseg() modifies Segments Left and the IPv6
destination address, since today a clone sees the change.
It also turns the "kfree_skb(skb); return -EINVAL;" right below into
kfree_skb_reason(). Since it goes through net, this hunk may need a
rebase once net is merged back into net-next.

Ciao,
Andrea
