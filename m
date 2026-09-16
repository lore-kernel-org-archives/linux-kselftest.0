Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB44E2F23;
	Wed, 16 Sep 2026 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592713; cv=none; b=MR+YCZV08fwoAXIpxGrdW64iTbNxRI/A9vkUtWWH5jaV0vAYLd3E/hynbgI1coLaELC9+xDy5sCe51+/h4WuKg01BmqR1Tp5lcPNrrSPi3pcp/aJna7VmKqFqDrelHIZcXFgNJij/GHfrB5r3B0gz2i/4VsPMF4IfXmMPJIrMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592713; c=relaxed/simple;
	bh=hU/hlu8yvgE667ehQahVwnhmbNOECAv0BBh9H801I8Y=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWf8Ed9E/pWLQmgLMoB3Y4b3c/pw2SQEs0MMAHtsD3spWWH9l28BRdP+/5C5ta9B6Sp6fbqf8m+oOPuuExc6lb6L3osKz2boRi31IsDZcSY7qYjP5QEDk52y/gHSdItPX7tcr8VOwnLkPIER2xPVLGx4A3Q2pgwboEghJ25hQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYyXLvAH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYyXLvAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CA31F000FF;
	Wed, 16 Sep 2026 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592696;
	bh=ZfMPYHr7CbwaooKam4qCfVIULL7iA2Utz/QeU/5ZsTA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EYyXLvAH8+FAH+XeBjFx9wNTIdmXoPZH0JO3kLe1iWRckre1fNkFmk5nEGXIPtyZR
	 0hd3o7x10KOfB6Ib9SIILQjokZC4ibH/iXfmkOURV7gBffSCK8hkAz2Ovpf8nAsmDu
	 7MbbBo2IOmH+r0jbyVqEJHAfQL9D4UW7QUQA+GYmCeMEAur+LHqUny4/IbbzH30YwN
	 gwuiJ0FC/tZJNTsVUPhwt57g9xCCidMuEzQbovzC6IuajhTsJdGVQQulzyp4iFmO9o
	 9k5JqvlUfcMWZsjAWx4pjzCI8l+gvR9HIXdouFuMfzv4RO8/cgB7hOm4r/4s90hbsw
	 DR83DFcYnckBg==
Subject: Re: [PATCH net v3 1/2] tcp: exclude old ACKs from tcp fast path
From: netdev-bot+sashiko@kernel.org
To: inbal.lipshtat@mail.huji.ac.il
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 amit.klein@mail.huji.ac.il
Date: Wed, 16 Sep 2026 21:04:55 +0000
Message-ID: <178959269527.22033.8096651585584240076@kernel.org>
In-Reply-To: <20260914090408.1435080-2-inbal.lipshtat@mail.huji.ac.il>
References: <20260914090408.1435080-2-inbal.lipshtat@mail.huji.ac.il>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] Documentation/networking/snmp_counter.rst contains a verbatim
  paste of the tcp_rcv_established() "fast path is disabled when:" list…

--

tcp: exclude old ACKs from tcp fast path

This changes the header prediction test in tcp_rcv_established() so that
segments whose ack_seq is below SND.UNA (in addition to those above
SND.NXT) are sent to the slow path, where tcp_ack() applies RFC5961
validation. A matching bullet is added to the comment listing the
conditions that disable the fast path.

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 0f60a1dbf9274..92bc60716f33d 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6490,6 +6490,7 @@ static bool tcp_validate_incoming(struct sock *sk, struct sk_buff *skb,
>   *	  or pure receivers (this means either the sequence number or the ack
>   *	  value must stay constant)
>   *	- Unexpected TCP option.
> + *	- ACK sequence number is outside [SND.UNA, SND.NXT].

[Severity: Low]
This isn't a bug, but should Documentation/networking/snmp_counter.rst be
updated together with this comment?

That document reproduces this exact list and says it is a copy of the
kernel comment:

  When kernel receives a TCP packet, it has two paths to handler the
  packet, one is fast path, another is slow path. The comment in kernel
  code provides a good explanation of them, I pasted them below::

    It is split into a fast path and a slow path. The fast path is
    disabled when:
    ...
    - Data is sent in both directions. The fast path only supports pure senders
      or pure receivers (this means either the sequence number or the ack
      value must stay constant)
    - Unexpected TCP option.

The pasted copy still ends at "- Unexpected TCP option." and has no
bullet for the new ACK window condition, so after this patch a reader of
the documentation would conclude that a segment carrying an ACK below
SND.UNA is still eligible for header prediction (and therefore still
counted in TcpExtTCPHPAcks / TcpExtTCPHPHits rather than being handled in
the slow path).

>   *
>   *	When these conditions are not satisfied it drops into a standard
>   *	receive procedure patterned after RFC793 to handle all cases.
> @@ -6539,7 +6540,7 @@ void tcp_rcv_established(struct sock *sk, struct sk_buff *skb)
>  
>  	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
>  	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
> -	    !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> +	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
>  		int tcp_header_len = tp->tcp_header_len;
>  		s32 delta = 0;
>  		int flag = 0;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914090408.1435080-1-inbal.lipshtat%40mail.huji.ac.il
