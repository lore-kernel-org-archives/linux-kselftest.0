Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4315346A07;
	Thu, 10 Sep 2026 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027144; cv=none; b=dP1YEK0qYxLX1nzRxOLRLWgt2l7+S8STUJmCrBbDd/o1FuG4r/YeQg8PTBzDPufLN8T1u+ngOx4eHS2RcV1v0J+FdfO6vQiSwnuNO4fyLKXcTLUanyoemCErkQ46PRYMXSlDoS1viNq1OPd8mDNg9VxjdXHMsrfx5341NEj7nHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027144; c=relaxed/simple;
	bh=YN/RJCBh2aKaPe4XRDyXXuL8DMUj6Wq2cWl6F9VwlBE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSrrs4C2cF7q+Aq9ii6Bn+8tzr5/A544/HX2x54mJMocWgiVQboC8Y7Pie/0QmRlL5DPL7q1KwolaWoGiWRuHQeTqmGphOoSTt1UxzB1lvcFWA6bSQjpkWdrec4mVEA3l+2Ob0hGqfTiXHxHM5gbqZxrDiUfFrf1F/KP0iqAm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIFdyj2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIFdyj2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59AD1F000FF;
	Thu, 10 Sep 2026 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027142;
	bh=TzpxlQ/Q3h5cs9QnDSu/xDBV//zRwzKq5lxcSq+xP2s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gIFdyj2yF/qMjHvYRrSPg0Ed31UviF2mzNLdjsffD3H43dMgFBeV0OX2aK78I4Un0
	 NHWfUNFj8dQHtRlJXVZF+AbfEzOeucUjOlthGFAzcihTuNGra+Xzb93u0xElFxXlki
	 11/Ah4SwhrZvjMstgk2VNB/pIpwAcdwVggIn4OfFQY5zXemlvC7U8iP94wxTvTOMIy
	 7xnjWXO4LqcW/StHG6LSQNRJggNCjHOhym9TN39GJPi4SDCYiX3rJad8Gq+Fn/+mMN
	 wzcbWR6G3aV9pnKUr1HIpClDCOTGETq4fsDJgX5Xu79Zhd3+iyTtfu4LDdHhTa6S3z
	 BpH8/GHDA2qXg==
Subject: Re: [PATCH net v2 1/2] tcp: exclude old ACKs from tcp fast path
From: netdev-bot+sashiko@kernel.org
To: inbal.lipshtat@mail.huji.ac.il
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 07:59:01 +0000
Message-ID: <178902714117.219967.14735865272246328849@kernel.org>
In-Reply-To: <20260909075644.1408171-2-inbal.lipshtat@mail.huji.ac.il>
References: <20260909075644.1408171-2-inbal.lipshtat@mail.huji.ac.il>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] The patch fixes a live, security-relevant input-validation defect
  (three Reported-by tags, RFC5961 reference) but carries no Fixes: tag,…
- [Low] The kerneldoc-style block comment above tcp_rcv_established()
  (net/ipv4/tcp_input.c:6477-6499) enumerates the conditions that…

--

tcp: exclude old ACKs from tcp fast path

This changes the header prediction test in tcp_rcv_established() so that
segments whose ack_seq is below SND.UNA no longer enter the fast path, in
addition to the existing rejection of ack_seq above SND.NXT.  Such segments
now fall through to the slow path where tcp_ack() applies the RFC5961
validation and challenge ACK handling.

No Link: tags are present in the commit header.

Two notes below.

[Severity: Low]
The changelog refers to the validation added by commit 3d501dd326fb1c7
("tcp: do not accept ACK of bytes we never sent") in prose:

    Such ACKs will fall through to the slow path, where tcp_ack()
    performs the appropriate validation and challenge ACK handling
    according to RFC5961 and Commit 3d501dd326fb1c7 ("tcp: do not
    accept ACK of bytes we never sent").

Should this carry a Fixes: tag as well, so stable tooling can pick it up?

git blame on the replaced predicate in tcp_rcv_established() points at
31770e34e43d6 ("tcp: Revert \"tcp: remove header prediction\""), and
3d501dd326fb is the commit that added the too-old-ACK check the fast path
was bypassing, so either looks like a concrete candidate.

There are three Reported-by tags but no Link: to the report, and the
changelog does not state the user-visible impact.  Could both be added?

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 0f60a1dbf927..89f9f3913b52 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6539,7 +6539,7 @@ void tcp_rcv_established(struct sock *sk, struct sk_buff *skb)
>  
>  	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
>  	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
> -	    !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> +	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {

[Severity: Low]
Should the block comment above tcp_rcv_established() be updated for this
new rejection class?  It enumerates the cases that disable the fast path
and then claims the enumeration is complete:

 *	- Unexpected TCP flags/window values/header lengths are received
 *	  (detected by checking the TCP header against pred_flags)
 *	- Data is sent in both directions. Fast path only supports pure senders
 *	  or pure receivers (this means either the sequence number or the ack
 *	  value must stay constant)
 *	- Unexpected TCP option.
 *
 *	When these conditions are not satisfied it drops into a standard
 *	receive procedure patterned after RFC793 to handle all cases.
 *	The first three cases are guaranteed by proper pred_flags setting,
 *	the rest is checked inline. Fast processing is turned on in
 *	tcp_data_queue when everything is OK.

Nothing in that list mentions ACK sequence validity.  After this change, a
reordered or duplicated pure ACK with ack_seq strictly below SND.UNA takes
the slow path on a plain pure-sender/pure-receiver connection with matching
pred_flags, which the list above says would be fast-pathed.  A bullet for
ack_seq outside [SND.UNA, SND.NXT] would keep the comment in agreement with
the predicate.

>  		int tcp_header_len = tp->tcp_header_len;
>  		s32 delta = 0;
>  		int flag = 0;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909075644.1408171-1-inbal.lipshtat%40mail.huji.ac.il
