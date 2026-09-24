Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A24028E8
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237512; cv=none; b=SMC9hNBC92GxJ4vITwv9D7SqFKxGEaO8NnW0L0ApZPqZKtWXjBFXn6HrZIvDMGh9Rd/QnmGt/HxcA4Gqhsd4BbLcpJK6VKSChU59KMDhD+UbXZAq8LsOwnY14d5P9lP5/j/QoT9L1SrETWrduEg4Hdj23LrQx9JwK1gS9WkCFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237512; c=relaxed/simple;
	bh=DpbisNFop2DM9nFw1hD/w3CTU5u1md8DAi8kE2Bk3z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jb8K8UHQmxGB/lCdLJOXbRa9CwqRbHKylWSssyGJkPiYxn6DeJKvea/HA0vL60pQS/iYWnUuoX7SZpFqRvsvi8JtSREaNeYV4sPIFXLAkPM4Um5fM0tp4MwJuMvRqMFbWop7TRDxeTkRCJ6m8JfLEJjGnA+VeXegSJgRDveyDRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KrodUWpY; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KrodUWpY"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DpbisNFop2DM9nFw1hD/w3CTU5u1md8DAi8kE2Bk3z8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790237507; v=1; x=1790842307;
 b=KrodUWpYqx14daR0Ng2SfGa2ZnZup0wM1A5gp93hmmjfQcy6irEsnau9uZJjgeo/TMeaU8Ff
 BRajS1F0CE8oE1MkYApluxi6yjICwaCfc3fRf8OO0femu3u7+qQRBSmINL5MU849lDrIraAzkcE
 A2NDgYePvz9GYW/Becyh2QMo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id efc2c0001f259c1f;
	Thu, 24 Sep 2026 08:11:47 +0000
X-Mizu-Trace-ID: efc2c0001f259c1f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 24 Sep 2026 16:11:37 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>, stefano.salsano@uniroma2.it
Subject: Re: [PATCH net-next 1/5] seg6: split final End process out of flavor
 processing
Message-ID: <arTbOeYp-sj37vzh@fedora>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
 <20260922-srv6_flavors_endx-v1-1-4d01c05c47b7@kylinos.cn>
 <20260923134637.4e56d6c422e3f89dd17f4a63@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923134637.4e56d6c422e3f89dd17f4a63@uniroma2.it>

On Wed, Sep 23, 2026 at 01:46:37PM +0200, Andrea Mayer wrote:
> > @@ -829,7 +830,10 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
> >  	 * information extracted from the packet, e.g. presence/absence of SRH,
> >  	 * Segment Left = 0, etc.
> >  	 */
> > -	return end_flv8986_core(skb, slwt);
> > +	ret = end_flv8986_core(skb, slwt);
> > +	if (ret)
> > +		return ret;
> 
> A nit: a blank line before the final return would match the rest of
> the file.

OK
> 
> > +	return input_action_end_finish(skb, slwt);
> >  }
> 
> This changes the semantics of end_flv8986_core(): it no longer
> forwards the packet, it only processes it, and the caller does the
> finish step. Is it worth saying so in a comment above the function? A
> future caller that misses it would leak the skb.

I will add a comment for the function change.

> 
> A heads-up: reviewing this made me notice that a fix I have pending
> for net touches these same lines. It makes the skb data writable
> before advance_nextseg() modifies Segments Left and the IPv6
> destination address, since today a clone sees the change.
> It also turns the "kfree_skb(skb); return -EINVAL;" right below into
> kfree_skb_reason(). Since it goes through net, this hunk may need a
> rebase once net is merged back into net-next.

Sure, I will do rebase once it merged to net-next.

Thanks
Hangbin
