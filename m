Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3C46D547
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247372; cv=none; b=PRWSnb4bpgYDR4cKySLTm+fz8BJXNCHAkfo3YsVf2tkOdhM3BuTB5JZM5XyQKnVpBf/sd4wa8shRUSXRJiBl9wiKl3G+yh5KJjtdL3z+tYenJ9oGq+xcTX7ZDTJmdY8A+PNIYCTpFPcr9QB7SzjJY74vlrXsdYWe1mEQp1c/JeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247372; c=relaxed/simple;
	bh=dcK5al5HmV/jTPApENYaewuu3+KgbwSXT1ai4hOuv5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drUfUHOaPsxVOTEkZzk4brjKWRsirXfR0aO6tBdMRTvvv+AQ0z96WGyJqnoS50SMWfCH+QVZ2Rx+dLpbCl1MXCD5lXRft90KncRWKBrDAiTGA9FdkjnJufnn1zt7RhnyEqo/Go5iSolz1l3e+ulVhoAbmQXphC8EkkcxDDKq0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nwPT0YDg; arc=none smtp.client-ip=91.218.175.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nwPT0YDg"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dcK5al5HmV/jTPApENYaewuu3+KgbwSXT1ai4hOuv5c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790247352; v=1; x=1790852152;
 b=nwPT0YDgn8qD9E6fCABJUzBGLytUm2+Cw3sd3Dsr8TXI2Sy3ylhwY2GQF9S7gNERrgkc2Ctu
 CeVJij6yLN+Ro614OIgXDOpss02VcqGNJQ4OZa0YCxAfc82Ydy00hdklcOMvBCC2auBlL533pH/
 NgI9By1F9oS1aWWe68FWLcW4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 05a7b6ee68ec50a5;
	Thu, 24 Sep 2026 10:55:52 +0000
X-Mizu-Trace-ID: 05a7b6ee68ec50a5
X-Migadu-Flow: FLOW_OUT
Date: Thu, 24 Sep 2026 18:55:43 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>, stefano.salsano@uniroma2.it
Subject: Re: [PATCH net-next 2/5] seg6: add RFC8986 flavor support for End.X
Message-ID: <arUBr6L0qtgr8WoH@fedora>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
 <20260922-srv6_flavors_endx-v1-2-4d01c05c47b7@kylinos.cn>
 <20260923180506.4350920e5bf32d4910a192d3@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923180506.4350920e5bf32d4910a192d3@uniroma2.it>

Hi Andrea,
On Wed, Sep 23, 2026 at 06:05:06PM +0200, Andrea Mayer wrote:
> > diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> > index 584e6aca3893..7462da1da362 100644
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
> 
> This adds PSP to a mask that already had NEXT-C-SID. PSP alone then
> works through end_flv8986_core().
>  
> >  struct seg6_flavors_info {
> >  	/* Flavor operations */
> > @@ -841,12 +842,19 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
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
> >  
> > -	return input_action_end_x_core(skb, slwt);
> > +	ret = end_flv8986_core(skb, slwt);
> > +	if (ret)
> > +		return ret;
> > +	return input_action_end_x_finish(skb, slwt);
> >  }
> >
>   
> The problem is the combination with NEXT-C-SID: the NEXT-C-SID early
> return above is still taken, and neither branch of
> end_x_next_csid_core() applies PSP. So "End.X flavors next-csid,psp"
> becomes configurable and PSP is never applied.

Ah, right. The NEXT-C-SID could combine with other flavors.

> 
> The same mask and the same early return are already in End, where the
> combination is accepted and PSP is not applied either. I will send a
> fix for that to net.

OK
> 
> For this patch I would handle the combination.

Thanks
> 
> On the selftest side, the combination of next-csid and psp is not
> covered yet. I am going to add coverage for it in any case with the
> End fix, and I would be glad to do it with you if you are interested:
> the same coverage would serve End.X too, if you decide to handle the
> combination there.

Yes, I will add support for the End.X combination (and End.T in follow-up
patch) once you add the next-csid/psp selftest.

Thanks
Hangbin
