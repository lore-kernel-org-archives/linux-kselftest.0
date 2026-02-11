Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35AB341678;
	Wed, 11 Feb 2026 03:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781696; cv=none; b=umRf81Cm+dVa7qL0nQ41ChIufzjFxqdl0q5A4tjyrFA7ObUPIY9DZtQlznnIj6ltNCGCOquFF6GHEzlJKRo38W+fz3d906wp0sZDnNzfnI5furyveVKebxtuN21/f4eoOFJc6UvQRAIEQX7xeI2yqdHr1ah/JnuoCaKIoaik5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781696; c=relaxed/simple;
	bh=dbNN5kGQb367tYcYfOLeutDVyRmccHYT9S6uEBQr86o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLuVimOj+xx3JbKRvdGCdDdwKoPevDtKXloXTvZh4q3QyP0jdk4aDKV7nl70yNzoGFfkNlWtnpy34sJDp5bs889BgCNnnKI61i6uCB326c0ll/Q7ARyvzhB7MSfkDO4eLbQ70+Eo6pCQi9eGZrrDCcEagYEmUh9vABhMLIdyr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHeybX1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHeybX1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2E0C4CEF7;
	Wed, 11 Feb 2026 03:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770781696;
	bh=dbNN5kGQb367tYcYfOLeutDVyRmccHYT9S6uEBQr86o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kHeybX1rvuQEXLehvcevYrQs8Ybgna1lWJM8ie2c/FaLmJzq7oeFpr63bDUaf7nCE
	 Emgsvzo5VTXRA0zToQTLgWkWjvor6OuRg8OzvATGl0VO+w42qRmafcYBS69oznPhWq
	 ymowh1NkFYY08F6gsf8zssrhmKpz6FsaAHq/7hLWO1jXFXILsIKrH6Cf9WrKKx+Hq1
	 J2X8V6zb6SBgDoner+PnM3d+AgRfTzFDtHog7yswXmRbF6GjQyDRVx95IxZndS7yFl
	 gz6N9fmyLVyj5JLpPRCVLQfDtDhdcYdpQVF5CkeOLrXfe+ZosqQPxDYjKZF2ptFusY
	 J34vx+XWiuvIg==
Date: Tue, 10 Feb 2026 19:48:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
 donald.hunter@gmail.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/9] selftests: drv-net: gro: use SO_TXTIME
 to schedule packets together
Message-ID: <20260210194814.21a0c403@kernel.org>
In-Reply-To: <willemdebruijn.kernel.503ed4ace7bf@gmail.com>
References: <20260207003509.3927744-1-kuba@kernel.org>
	<20260207003509.3927744-7-kuba@kernel.org>
	<willemdebruijn.kernel.743811e01cc@gmail.com>
	<20260210175638.123782b2@kernel.org>
	<willemdebruijn.kernel.503ed4ace7bf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Feb 2026 22:15:25 -0500 Willem de Bruijn wrote:
> > It's a bit of an opportunistic optimization.
> > 
> > I initially intended it for for the "long sequence of packets"
> > test. But I failed to get AF_PACKET+FQ to cooperate sufficiently
> > to queue all of the packets in the same bucket. Otherwise FQ "sorts"
> > the packets, and breaks what the test is trying to do :(  
> 
> I wonder what's going wrong here.
> 
> fq_classify should pick the queue based on skb->sk also for packet
> sockets.
> 
> And flow_queue_add should add the packets to the tail of the linear
> list if the delivery time is identical to that of the tail.

It works but requires that we either modify the qdisc config to set
a orphan_mask of 1, or somehow set the skb->hash on the AF_PACKET skbs.
The test sends out multiple flows (src ports) so if we let fq compute
the real hash we end up in different buckets.
