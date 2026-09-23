Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62E33ACA40;
	Wed, 23 Sep 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179557; cv=none; b=sdqpbE+7SxKO2XtxXgIaQJCoK219EIg3MO+rz0vAOJGmx+mTVmjFoz8qXBuVAdN4VwoaMfjHz/R5SZdgGEYVrjlj1KWlv2MW9xM7YFqVvO40bYWHpB5EDqY8m1SojDZjZLOy+dASwaX3KpUksPdL0/DEQKCnrTuaYzLkqAZpSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179557; c=relaxed/simple;
	bh=0enoxHy8o9j9aEe7NsVFhPcnA3cVT0jAt1dK+rrlFXk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PoCGgpsdFnroIVSXARHT2ihyqQBvBrKt+pVTicqAHpTdbpppZB8ICCqE0xgIwyLWETyTC8DapcJd+pLbimFF+zpCNlGSNkR7SmKa97qvdo/QA6ax8OshGthCDtljJ2HuIVUk3YD1G88W4BBSFWFDBmv6kIrgVEzyH8L7l6Vu0Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=YMvn66hh; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=JpyRE1nu; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="YMvn66hh";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="JpyRE1nu"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 68NG50bF006583;
	Wed, 23 Sep 2026 18:05:07 +0200
Received: from lubuntu-18.04 (host-95-239-0-205.retail.telecomitalia.it [95.239.0.205])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 278931227F6;
	Wed, 23 Sep 2026 18:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1790179507; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjbIKJLjCQTNwB9P7bcr0CnfwHpD056vx8od9Lztz3U=;
	b=YMvn66hhdYL1o6yyezFZh4FKeZwNGG9ulYG6kjtPkPRPkgzTYERzwEFIUi5lz/Qw5dct1I
	rHcKmmkNXzsvlxAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1790179507; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjbIKJLjCQTNwB9P7bcr0CnfwHpD056vx8od9Lztz3U=;
	b=JpyRE1nuh+R69khyCDbWfXZYRX0MYQFtJukLbcP6eZhf7tCBKE1Ej2d2VYO8PZY8l3W9UE
	Q4ibgUNq7ndx3YuKQ64/kFcjC6MJbO8lyN39c8xpfmOEjgPtNT94M+lhZD6wYaM9WAsmjR
	iaVubCebs6vtjf73QlaIOxyDx7WB0snDwLjwx4N6GcfKk+bJEqWw16tqbElieHh6rxZnwF
	bqVHY1BmeewwqmKShvmMAOj8yZ8Sdcm3YhJ5T8+tKMK5MxMP2fq/maRzvNZSsIh0agvI1g
	C9rlnFbaxfsDwK2BUpJwZ6T/fWcfz58ssRSDYJ5iBZ/HVTepglpCHbxNFfrh2A==
Date: Wed, 23 Sep 2026 18:05:06 +0200
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
Subject: Re: [PATCH net-next 2/5] seg6: add RFC8986 flavor support for End.X
Message-Id: <20260923180506.4350920e5bf32d4910a192d3@uniroma2.it>
In-Reply-To: <20260922-srv6_flavors_endx-v1-2-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
	<20260922-srv6_flavors_endx-v1-2-4d01c05c47b7@kylinos.cn>
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

On Tue, 22 Sep 2026 16:54:44 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

Hi Hangbin,
please see below.

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
>  net/ipv6/seg6_local.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 584e6aca3893..7462da1da362 100644
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

This adds PSP to a mask that already had NEXT-C-SID. PSP alone then
works through end_flv8986_core().
 
>  struct seg6_flavors_info {
>  	/* Flavor operations */
> @@ -841,12 +842,19 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
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
>  
> -	return input_action_end_x_core(skb, slwt);
> +	ret = end_flv8986_core(skb, slwt);
> +	if (ret)
> +		return ret;
> +	return input_action_end_x_finish(skb, slwt);
>  }
>
  
The problem is the combination with NEXT-C-SID: the NEXT-C-SID early
return above is still taken, and neither branch of
end_x_next_csid_core() applies PSP. So "End.X flavors next-csid,psp"
becomes configurable and PSP is never applied.

The same mask and the same early return are already in End, where the
combination is accepted and PSP is not applied either. I will send a
fix for that to net.

For this patch I would handle the combination.

On the selftest side, the combination of next-csid and psp is not
covered yet. I am going to add coverage for it in any case with the
End fix, and I would be glad to do it with you if you are interested:
the same coverage would serve End.X too, if you decide to handle the
combination there.

Thanks,
Andrea
